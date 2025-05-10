module Master_Interface (
	input wire clk,
	input wire reset_n,
	
	// Sinais do Avalon
	
	input  wire        waitrequest,
	input  wire        readdatavalid,
	input  wire [31:0] readdata,
	output reg         read,
	output reg         chipselect,
	output reg  [3:0 ] byteenable,
	output reg  [29:0] address,
	output reg  [31:0] exportdata,
	
	// FIFO (Conduit)
	input  wire        fifo_full,
	output reg         fifo_wr_en
);

	localparam ADDR_SDRAM   = 30'h0000_0000;
	localparam IMG_WIDTH    = 640;
	localparam IMG_HEIGHT   = 480;
	localparam TOTAL_PIXELS = IMG_WIDTH * IMG_HEIGHT;

	reg [29:0] addr_counter;
	reg [2:0 ] state;

	localparam IDLE       = 3'd0,
						 WAIT_READ  = 3'd1,
						 WRITE_FIFO = 3'd2;
			
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			address      <= 0;
			addr_counter <= 0;
			read         <= 0;
			chipselect   <= 0;
			byteenable   <= 4'b1111;
			exportdata   <= 0;
			fifo_wr_en   <= 0;
			state        <= IDLE;
		end else begin
			// Default desativa sinais
			read       <= 0;
			chipselect <= 0;
			fifo_wr_en <= 0;

			case (state)
				IDLE: begin
					if (!fifo_full) begin
						address    <= ADDR_SDRAM + addr_counter;
						chipselect <= 1;
						read       <= 1;
						state      <= WAIT_READ;
					end
				end

				WAIT_READ: begin
					if (!waitrequest && readdatavalid) begin
						exportdata <= readdata;
						fifo_wr_en <= 1;
						
						if (addr_counter == TOTAL_PIXELS - 1)
							addr_counter <= 0;
						else
							addr_counter <= addr_counter + 1;
						state <= WRITE_FIFO;
					end
				end

				WRITE_FIFO: begin
					fifo_wr_en <= 0;
					state      <= IDLE;
				end

				default: state <= IDLE;
			endcase
		end
	end

endmodule
