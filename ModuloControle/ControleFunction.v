module ControleFunction(
	input clock,
	input reset_n,
	input enable,
	input [5: 0] controller_pins,
	output wire [31:0] data_out,
	output wire select
);

// Buttons
// 0 - UP
// 1 - DOWN
// 2 - LEFT
// 3 - RIGHT
// 4 - A
// 5 - B
// 6 - C
// 7 - X
// 8 - Y
// 9 - Z
// 10 - START
// 11 - MODE
// LEMBRAR QUE OS PINOS DEVEM SER NEGADOS!

localparam CONTROLLER_STATE_UP_DOWN_LEFT_RIGHT_B_C = 3'd000,
			  CONTROLLER_STATE_UP_DOWN_A_START        = 3'd001,
			  CONTROLLER_STATE_A_START                = 3'd010,
			  CONTROLLER_STATE_Z_Y_X_MODE_B_C         = 3'd011,
			  CONTROLLER_STATE_ZEROS                  = 3'd100;	

reg [2:0] controller_buttons;
reg [31: 0] buttons_values;
reg [31: 0] data_reg;
reg done;
wire controller_select;

assign select = controller_select;
assign data_out = data_reg;

ControleStateMachine fsm_controller(.clock(clock), .reset_n(reset_n), .flag(enable), .buttons(controller_buttons), .select(controller_select), .done(done));

always @(*) begin
	buttons_values = 32'b0;
	if (!reset_n) begin
		buttons_values = 32'b0;
	end else begin
		case (controller_buttons)
			CONTROLLER_STATE_UP_DOWN_LEFT_RIGHT_B_C: begin
				buttons_values[0] = ~controller_pins[0];
				buttons_values[1] = ~controller_pins[1];
				buttons_values[2] = ~controller_pins[2];
				buttons_values[3] = ~controller_pins[3];
				buttons_values[5] = ~controller_pins[4];
				buttons_values[6] = ~controller_pins[5];
			end
			CONTROLLER_STATE_UP_DOWN_A_START: begin
				buttons_values[0] = ~controller_pins[0];
				buttons_values[1] = ~controller_pins[1];
				buttons_values[4] = ~controller_pins[4];
				buttons_values[10] = ~controller_pins[5];
			end
			CONTROLLER_STATE_A_START: begin
				buttons_values[4] = ~controller_pins[4];
				buttons_values[10] = ~controller_pins[5];
			end
			CONTROLLER_STATE_Z_Y_X_MODE_B_C: begin
				buttons_values[9] = ~controller_pins[0];
				buttons_values[8] = ~controller_pins[1];
				buttons_values[7] = ~controller_pins[2];
				buttons_values[11] = ~controller_pins[3];
				buttons_values[5] = ~controller_pins[4];
				buttons_values[6] = ~controller_pins[5];
			end
			default: begin end
		endcase
	end
end

always @(posedge clock) begin
	if (!reset_n) begin
		data_reg <= 32'b0;
	end else if (done) begin
		data_reg <= buttons_values;
	end
end

endmodule