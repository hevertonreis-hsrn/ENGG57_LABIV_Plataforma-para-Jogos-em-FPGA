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
wire [31:0] nextPC_internal;

// PC + 4
assign pc_plus_4 = actualPC + 32'd4;

// MUX: Escolhe entre PC+4 ou BranchTarget
assign nextPC_internal = (PCSrc) ? BranchTarget : pc_plus_4;

// Endereço para leitura de memória
assign outAddress = actualPC;

// ------------------------
// Mini FSM de controle de leitura
// ------------------------

parameter WAIT_READY = 1'b0;
parameter START_READ = 1'b1;

reg state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= START_READ; // Começa pedindo a 1ª instrução
    else
        state <= next_state;
end

reg start_read_next;

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
// Instância do Program Counter
// ------------------------

ProgramCounter PC (
    .clk(clk),
    .rst(rst),
    .enable(ready && ~HD_HoldPC),
    .nextPC(nextPC_internal),
    .currentPC(actualPC)
);

// ------------------------
// Instância do IF/ID Register
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
