module vCounter(
	input clk25MHz,
	input enable,
	output reg [9:0] counter = 0
	);

	always@(posedge clk25MHz) begin
	
		if(enable) begin
			if (counter < 524) begin
				counter <= counter + 1;
			end
			else begin
				counter <= 0;
			end
		end

	
	end

endmodule