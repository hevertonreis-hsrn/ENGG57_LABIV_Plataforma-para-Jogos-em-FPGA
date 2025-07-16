module rgb16_to_rgb24(
	input      [15:0] color_input,
	output reg [7:0 ] red24,
	output reg [7:0 ] green24,
	output reg [7:0 ] blue24
);

wire [4:0] red16   = color_input[15:11];
wire [5:0] green16 = color_input[10:5];
wire [4:0] blue16  = color_input[4:0];

always @(*) begin
	// Replicar os MSBs nos LSBs melhora a fidelidade ao expandir de 5/6 para 8 bits.
	red24   = {red16, red16[4:2]};     // 5 → 8 bits
	green24 = {green16, green16[5:4]}; // 6 → 8 bits
	blue24  = {blue16, blue16[4:2]};   // 5 → 8 bits
end

endmodule
