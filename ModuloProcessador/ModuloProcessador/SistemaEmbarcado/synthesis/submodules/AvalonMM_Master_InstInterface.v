module AvalonMM_Master_InstInterface(
    input wire clk,
    input wire reset_n,
    input wire i_waitrequest,
    input wire [31:0] i_readdata,
    input wire [31:0] in_address,
    input wire start_read, // Vindo de outro clock (25 MHz)

    output reg [31:0] i_address,
    output reg i_read,
    output reg [31:0] read_data,
    output reg ready
);

// Estados da FSM
parameter IDLE_STATE = 2'b00;
parameter WAIT_STATE = 2'b01;
parameter DONE_STATE = 2'b10;

reg [1:0] state, next_state;

// ---------------------------------------------
// Sincronização de 'start_read' (Clock Domain Crossing)
// ---------------------------------------------
reg [1:0] start_read_sync;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        start_read_sync <= 2'b00;
    else
        start_read_sync <= {start_read_sync[0], start_read};
end

// Detecção de borda de subida (apenas 1 pulso quando start_read sobe)
wire start_read_pulse = (start_read_sync == 2'b01);

// ---------------------------------------------
// FSM de controle Avalon-MM
// ---------------------------------------------
always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        state <= IDLE_STATE;
    else
        state <= next_state;
end

always @(*) begin
    // Sinais padrão a cada ciclo
    i_address   = 32'b0;
    i_read      = 1'b0;
    read_data = 32'b0;
    ready     = 1'b0;
    next_state = state;

    case (state)
        // Estado ocioso: espera por um pulso de leitura
        IDLE_STATE: begin
            if (start_read_pulse) begin
                i_address = in_address; // Prepara endereço
                i_read    = 1'b1;       // Dispara leitura Avalon
                next_state = WAIT_STATE;
            end
        end

        // Esperando o 'i_waitrequest' da Avalon baixar
        WAIT_STATE: begin
            i_address = in_address;
            i_read    = 1'b1;
            if (!i_waitrequest)
                next_state = DONE_STATE;
        end

        // Leitura finalizada: armazena dado e sinaliza para o IF
        DONE_STATE: begin
            read_data = i_readdata;
            ready     = 1'b1;
            next_state = IDLE_STATE;
        end
    endcase
end

endmodule
