module hCounter(
	input clk25MHz,
	output reg [9:0] counter = 0,
	output reg jumpLine = 0
	);

	always@(posedge clk25MHz) begin
	
		if (counter < 799) begin
			counter <= counter + 1;
		end
		else begin
			counter <= 0;
			jumpLine <= 1;
		end
	
	end

endmodule