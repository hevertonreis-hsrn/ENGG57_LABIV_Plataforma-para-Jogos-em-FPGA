module pixel_reader (
  input clk,
  input rstN,
  
  input [23:0] fifo_data,
  input        fifo_empty,
	input				 fifo_full,
	output wire  w_fifo_full,					
  output reg   fifo_rd_en,

  input        vga_request, // do VGA
  output reg [7:0] outRed, outGreen, outBlue
);
	
	assign w_fifo_full = fifo_full;
	
	
	always @(*) begin
		outRed   = fifo_data[23:16];
		outGreen = fifo_data[15:8 ];
		outBlue  = fifo_data[7:0  ];
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
