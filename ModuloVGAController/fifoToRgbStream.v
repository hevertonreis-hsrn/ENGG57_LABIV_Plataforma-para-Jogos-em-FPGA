module fifoToRgbStream (
  input clk,
  input rstN,
  
  input [15:0] fifo_data,
  input        fifo_empty,
	input				 fifo_full,
	output wire  w_fifo_full,					
  output reg   fifo_rd_en,

  input        vga_request, // do VGA
  output reg [7:0] outRed, outGreen, outBlue
);

	wire [4:0] red16   = fifo_data[15:11];
	wire [5:0] green16 = fifo_data[10:5];
	wire [4:0] blue16  = fifo_data[4:0];
	
	assign w_fifo_full = fifo_full;
	
	
	always @(*) begin
	// Replicar os MSBs nos LSBs melhora a fidelidade ao expandir de 5/6 para 8 bits.
	outRed   = {red16, red16[4:2]};     // 5 → 8 bits
	outGreen = {green16, green16[5:4]}; // 6 → 8 bits
	outBlue  = {blue16, blue16[4:2]};   // 5 → 8 bits
end


  always @(posedge clk) begin
    if (!rstN) begin
      fifo_rd_en   <= 0;
    end else begin
      fifo_rd_en <= 0;
			
      if (vga_request && !fifo_empty) begin
        fifo_rd_en <= 1;
      end
    end
  end
endmodule
