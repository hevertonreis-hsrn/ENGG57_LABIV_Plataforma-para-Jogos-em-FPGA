module pixel_composer (
	input  wire        clk,
	input  wire        rst_n,
	input  wire [23:0] bg_pixel,
	input  wire [23:0] selected_pixel,
	output wire [23:0] pixel_out
);
	//----------------------------
	// Composição do pixel por prioridade
	//----------------------------
	assign pixel_out = (selected_pixel != 24'h000000) ? selected_pixel :
										 bg_pixel;  // BB;
endmodule
