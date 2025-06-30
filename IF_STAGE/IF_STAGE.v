
module IF_STAGE (
    input wire clk,
    input wire rst,
    input wire PCSrc,
    input wire [31:0] BranchTarget,
    input wire IF_Flush,
    input wire HD_HoldPC,
    input wire HD_Hold_IF_ID,
    input wire [31:0] read_data,
    input wire ready,
    input wire [4:0] interruption,
    input wire ret_instruction,  // <- Novo sinal para retorno de interrupção
    output wire [31:0] outPC,
    output wire [31:0] outInstruction,
    output wire [31:0] outAddress,
    output reg start_read
);

// ------------------------
// Sinais internos
// ------------------------

wire [31:0] actualPC;
wire [31:0] pc_plus_4;
reg [31:0] nextPC_internal;
reg [31:0] interruption_addr;
reg [31:0] guardarPC;

assign pc_plus_4 = actualPC + 32'd4;
assign outAddress = actualPC;

// Delay de 4 ciclos
reg [2:0] delay_counter = 0;
reg delay_active = 0;
reg [4:0] last_interruption = 5'b00000;

// --- Pilha de interrupções ---
reg [4:0] stack_mem [0:31];  // pilha com 32 posições para interrupções
reg [4:0] sp;                // ponteiro da pilha
reg [4:0] stack_data_out;    // topo da pilha
reg stack_empty;
reg stack_full;
reg push, pop;
reg [4:0] data_in;

// --- Sempre no clock, update da pilha ---
always @(posedge clk or posedge rst) begin
    if (rst) begin
        sp <= 0;
        stack_empty <= 1;
        stack_full <= 0;
        stack_data_out <= 5'b0;
    end else begin
        if (push && !stack_full) begin
            stack_mem[sp] <= data_in;
            sp <= sp + 1;
        end else if (pop && !stack_empty) begin
            sp <= sp - 1;
        end

        stack_empty <= (sp == 0);
        stack_full <= (sp == 32);

        if (sp > 0)
            stack_data_out <= stack_mem[sp - 1];
        else
            stack_data_out <= 5'b0;
    end
end

// ------------------------
// Mini FSM de controle de leitura
// ------------------------

parameter WAIT_READY = 1'b0;
parameter START_READ = 1'b1;

reg state, next_state;
reg start_read_next;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= START_READ;
    else
        state <= next_state;
end

always @(*) begin
    start_read_next = 1'b0;
    next_state = state;
    case (state)
        START_READ: begin
            start_read_next = 1'b1;
            next_state = WAIT_READY;
        end
        WAIT_READY: begin
            if (ready)
                next_state = START_READ;
        end
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        start_read <= 1'b0;
    else
        start_read <= start_read_next;
end

// ------------------------
// Lógica de interrupção com delay e pilha
// ------------------------

always @(posedge clk or posedge rst) begin
    if (rst) begin
        delay_counter <= 0;
        delay_active <= 0;
        last_interruption <= 5'b00000;
        push <= 0;
        pop <= 0;
        data_in <= 5'b0;
    end else begin
        push <= 0;
        pop <= 0;
        if (interruption != 5'b00000 && delay_active == 0) begin
            delay_active <= 1;
            delay_counter <= 3'd4;  // iniciar com 4 ciclos
            last_interruption <= interruption;
            guardarPC <= pc_plus_4;  // salva o PC atual
            push <= 1;
            data_in <= interruption; // empilha interrupção
            $display("Delay ativado em %t, interrupcao=%b", $time, interruption);
        end else if (delay_active) begin
            if (delay_counter > 0) begin
                delay_counter <= delay_counter - 1;
                $display("Delay contando em %t, delay_counter=%d", $time, delay_counter);
            end else begin
                delay_active <= 0;
                $display("Delay zerado em %t, pronto para salto", $time);
            end
        end else if (ret_instruction && !stack_empty) begin
            pop <= 1;  // retira da pilha
            last_interruption <= stack_data_out;
        end
    end
end

always @(*) begin
    case (last_interruption)
        5'b00001: interruption_addr = 32'h00000080; // reset
        5'b00010: interruption_addr = 32'h00000800; // timer
        5'b00011: interruption_addr = 32'h00800000; // collision
        5'b01000: interruption_addr = 32'h00000008; // overlap
        default:  interruption_addr = 32'b0;
    endcase

    if (ret_instruction) begin
        nextPC_internal = guardarPC;  // retorno da interrupção
    end else if (delay_active && delay_counter == 0) begin
        nextPC_internal = interruption_addr;  // salto para handler
    end else if (PCSrc) begin
        nextPC_internal = BranchTarget;
    end else begin
        nextPC_internal = pc_plus_4;
    end
end

// ------------------------
// Program Counter
// ------------------------

ProgramCounter PC (
    .clk(clk),
    .rst(rst),
    .enable(ready && ~HD_HoldPC),
    .nextPC(nextPC_internal),
    .currentPC(actualPC)
);

// ------------------------
// IF/ID Register
// ------------------------

IF_ID_Register register (
    .clk(clk),
    .rst(rst),
    .enable(ready && ~HD_Hold_IF_ID),
    .inPC(pc_plus_4),
    .inInstruction(read_data),
    .IF_Flush(IF_Flush),
    .outPC(outPC),
    .outInstruction(outInstruction)
);

endmodule

// =========================================
// ProgramCounter
// =========================================

module ProgramCounter (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [31:0] nextPC,
    output reg [31:0] currentPC
);

always @(posedge clk) begin
    if (rst)
        currentPC <= 32'b0;
    else if (enable)
        currentPC <= nextPC;
end

endmodule

// =========================================
// IF_ID_Register
// =========================================

module IF_ID_Register (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [31:0] inPC,
    input wire [31:0] inInstruction,
    input wire IF_Flush,
    output reg [31:0] outPC,
    output reg [31:0] outInstruction
);

always @(posedge clk) begin
    if (rst) begin
        outPC <= 32'b0;
        outInstruction <= 32'b01010100000000000000000000000000; // NOP
    end else if (enable) begin
        outPC <= inPC;

        if (IF_Flush)
            outInstruction <= 32'b01010100000000000000000000000000; // NOP
        else if (inInstruction == 32'b0)
            outInstruction <= 32'b01010100000000000000000000000000; // NOP
        else
            outInstruction <= inInstruction;
    end
end

endmodule
