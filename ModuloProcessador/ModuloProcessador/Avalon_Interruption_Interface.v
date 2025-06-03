module Avalon_Interruption_Interface(
	input wire clk,
	input wire reset_n,
	input wire interrupt,
	input wire [31:0] interrupt_data,
	output reg realized,
	output reg [31:0] realized_data,
	output reg [4:0] interrupt_addr
);


reg is_in_interruption;

always @(posedge clk or negedge reset_n) begin
	if (!reset_n) begin
		realized_data = 32'b0;
		interrupt_addr = 5'b0;
		is_in_interruption = 0;
	end else if (interrupt && !is_in_interruption) begin
		interrupt_addr = interrupt_data[4:0];
		realized_data = interrupt_data;
		is_in_interruption = 1;
	end else begin
		// evitando latches
		realized_data = realized_data;
		interrupt_addr = interrupt_addr;
		is_in_interruption = 0;
	end
end

endmodule