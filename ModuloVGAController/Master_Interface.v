module Master_Interface (
    input wire clk,
    input wire reset_n,
		
    // Sinais do Avalon
    output reg [29:0] address,
    output reg read,
    output reg [3:0] byteenable,
    output reg chipselect,
    output reg [31:0] exportdata,

    input wire [31:0] readdata,
    input wire waitrequest,
    input wire readdatavalid
		
		// FIFO (Conduit)
    output reg        fifo_wr_en,
    output reg [31:0] fifo_wr_data,
    input  wire       fifo_full
);

    localparam ADDR_SDRAM    = 30'h0000_0000;

    reg [29:0] addr_counter;  // Para iterar pela imagem na SDRAM
    reg [2:0]  state;

    localparam
        IDLE       = 3'd0,
        WAIT_READ  = 3'd1,
        WRITE_FIFO = 3'd2;
				
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state      	 <= READ_SW;
            address      <= 30'd0;
						addr_counter <= 30'd0;
            writedata    <= 32'd0;
            write        <= 0;
            read         <= 0;
            chipselect   <= 0;
            byteenable   <= 4'b1111;
            exportdata   <= 32'd0;
        end else begin
            // Reset default de sinais
            chipselect <= 0;
            write      <= 0;
            read       <= 0;

            case (state)
                IDLE: begin
                    if (!fifo_full) begin
                        address    <= ADDR_SDRAM + addr_counter;
                        chipselect <= 1;
                        read       <= 1;
                        estado     <= WAIT_READ;
                    end
                end

                WAIT_READ: begin
                    if (!waitrequest && readdatavalid) begin
                        fifo_data_out <= readdata;
                        fifo_wrreq    <= 1;
                        addr_counter  <= addr_counter + 1;
                        estado        <= WRITE_FIFO;
                    end
                end

                WRITE_FIFO: begin
                    // Apenas um ciclo de escrita no FIFO
                    fifo_wrreq <= 0;
                    estado     <= IDLE;
                end

                default: estado <= IDLE;
            endcase
        end
    end

endmodule
