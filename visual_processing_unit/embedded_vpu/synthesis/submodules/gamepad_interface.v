module gamepad_interface(
	input         		clk,
	input         		rst_n,
	input             read,
	output reg [31:0] readdata,
	
	// Conduits
	input 				pin_1,  // UP / Z
	input 				pin_2,  // DOWN / Y
	input 				pin_3,  // LEFT / X
	input 				pin_4,  // RIGHT / MODE
	input 				pin_6,  // B / A
	input 				pin_9,  // C / START
	output wire 	pin_7		// SELECT
);
	
	wire [11:0] data_out;

	gamepad_controller control_core (
		.clk       (clk),
		.rst_n     (rst_n),
		.pin_1     (pin_1),
		.pin_2     (pin_2),
		.pin_3     (pin_3),
		.pin_4     (pin_4),
		.pin_6     (pin_6),
		.pin_9     (pin_9),
		.select    (pin_7),
		.btn_out   (data_out)
	);


	always @(posedge clk) begin
			if (!rst_n) begin
					readdata <= 32'b0;
					end
			else if (read) begin
					//readdata <= {20'b0, data_out};
					readdata <= 32'b1;
			end
	end
endmodule
