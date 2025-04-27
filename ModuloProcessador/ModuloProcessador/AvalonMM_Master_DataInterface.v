module AvalonMM_Master_Data_Interface(
    input wire clk,
    input wire reset_n,
    input wire d_waitrequest,
    input wire [31:0] d_readdata,

    input wire [31:0] in_address,
    input wire [31:0] write_data,
    input wire MemRead,       // Novo: sinal de leitura
    input wire MemWrite,      // Novo: sinal de escrita
    input wire start_access,  // Pulso de start vindo do domínio de 25 MHz

    output reg [31:0] d_address,
    output reg [31:0] d_writedata,
    output reg d_read,
    output reg d_write,
    output reg [31:0] read_data,
    output reg ready
);

// Estados da FSM
parameter IDLE_STATE  = 2'b00;
parameter WAIT_STATE  = 2'b01;
parameter DONE_STATE  = 2'b10;

reg [1:0] state, next_state;

// ---------------------------------------------
// Sincronização de 'start_access' (Cross Clock)
// ---------------------------------------------
reg [1:0] start_access_sync;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        start_access_sync <= 2'b00;
    else
        start_access_sync <= {start_access_sync[0], start_access};
end

wire start_access_pulse = (start_access_sync == 2'b01);

// ---------------------------------------------
// FSM - Controle Avalon-MM (RW)
// ---------------------------------------------
always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        state <= IDLE_STATE;
    else
        state <= next_state;
end

always @(*) begin
    // Defaults
    d_address    = 32'b0;
    d_writedata  = 32'b0;
    d_read       = 1'b0;
    d_write      = 1'b0;
    read_data  = 32'b0;
    ready      = 1'b0;
    next_state = state;

    case (state)
        IDLE_STATE: begin
            if (start_access_pulse) begin
                d_address   = in_address;
                d_writedata = write_data;
                if (MemRead)
                    d_read = 1'b1;
                else if (MemWrite)
                    d_write = 1'b1;
                next_state = WAIT_STATE;
            end
        end

        WAIT_STATE: begin
            d_address   = in_address;
            d_writedata = write_data;
            if (MemRead)
                d_read = 1'b1;
            else if (MemWrite)
                d_write = 1'b1;

            if (!d_waitrequest)
                next_state = DONE_STATE;
        end

        DONE_STATE: begin
            if (MemRead)
                read_data = d_readdata;
            ready = 1'b1;
            next_state = IDLE_STATE;
        end
    endcase
end

endmodule
