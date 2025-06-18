module pixel_composer (
	input  wire        clk,
	input  wire        rst_n,
	input  wire [23:0] bg_pixel,
	input  wire [23:0] h0_pixel,
	input  wire [23:0] h1_pixel,
	input  wire [23:0] h2_pixel,
	input  wire [23:0] h3_pixel,
	output wire [23:0] pixel_out
);
	//----------------------------
	// Composição do pixel por prioridade
	//----------------------------
	assign pixel_out = (h3_pixel != 24'h000000) ? h3_pixel :
										 (h2_pixel != 24'h000000) ? h2_pixel :
										 (h1_pixel != 24'h000000) ? h1_pixel :
										 (h0_pixel != 24'h000000) ? h0_pixel :
										 bg_pixel;  // BB;
endmodule
