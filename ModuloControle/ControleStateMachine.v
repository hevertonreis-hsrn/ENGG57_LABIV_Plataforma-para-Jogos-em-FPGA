module ControleStateMachine(
	input clock,
	input reset_n,
	input flag,
	output reg select,
	output reg done,
	output reg [2:0] buttons
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
// PINO 1 -> UP [0 a 4] e Z [6]
// PINO 2 -> DOWN [0 a 4] e Y [6]
// PINO 3 -> LEFT [0, 2, 4] e X [6]
// PINO 4 -> RIGHT [0, 2, 4] e MODE [6]
// PINO 6 -> B [0, 2, 4, 6] e A [1, 3, 5, 7]
// PINO 9 -> C [0, 2, 4, 6] e START [1, 3, 5, 7]

localparam AGUARDAR_ATIVACAO = 9'b0000_00001,
			  ESTADO_0 			  = 9'b0000_00010,
			  ESTADO_1          = 9'b0000_00100,
			  ESTADO_2          = 9'b0000_01000,
			  ESTADO_3          = 9'b0000_10000,
			  ESTADO_4          = 9'b0001_00000,
			  ESTADO_5          = 9'b0010_00000,
			  ESTADO_6          = 9'b0100_00000,
			  ESTADO_7          = 9'b1000_00000;
			  
localparam CONTROLLER_STATE_UP_DOWN_LEFT_RIGHT_B_C = 3'b000,
			  CONTROLLER_STATE_UP_DOWN_A_START        = 3'b001,
			  CONTROLLER_STATE_A_START                = 3'b010,
			  CONTROLLER_STATE_Z_Y_X_MODE_B_C         = 3'b011,
			  CONTROLLER_STATE_ZEROS                  = 3'b100;

localparam SELECT_HIGH = 1'b1,
			  SELECT_LOW  = 1'b0;
			  
localparam DONE        = 1'b1,
			  NOT_DONE    = 1'b0;
			  
reg [12:0] contador;	
reg [8:0] state, nstate;


// FSM with 3 always blocks
always @(*) begin
	case (state)
		AGUARDAR_ATIVACAO: nstate = flag == 1 ? ESTADO_0 : AGUARDAR_ATIVACAO;
		ESTADO_0 : nstate = contador > 13'd1000 ? ESTADO_1 : ESTADO_0;
		ESTADO_1 : nstate = contador > 13'd2000 ? ESTADO_2 : ESTADO_1;
		ESTADO_2 : nstate = contador > 13'd3000 ? ESTADO_3 : ESTADO_2;
		ESTADO_3 : nstate = contador > 13'd4000 ? ESTADO_4 : ESTADO_3;
		ESTADO_4 : nstate = contador > 13'd5000 ? ESTADO_5 : ESTADO_4;
		ESTADO_5 : nstate = contador > 13'd6000 ? ESTADO_6 : ESTADO_5;
		ESTADO_6 : nstate = contador > 13'd7000 ? ESTADO_7 : ESTADO_6;
		ESTADO_7 : nstate = contador > 13'd8000 ? AGUARDAR_ATIVACAO : ESTADO_7;
		default: nstate = AGUARDAR_ATIVACAO;
	endcase
end

always@(negedge clock) begin
	if !(reset_n) begin
		state <= AGUARDAR_ATIVACAO;
	end else begin
		state <= nstate;
	end
end

always@(*) begin
	case (state)
		AGUARDAR_ATIVACAO: begin
			buttons = CONTROLLER_STATE_ZEROS;
			select = SELECT_LOW;
			done = NOT_DONE;
		end
		ESTADO_0, ESTADO_2, ESTADO_4: begin
			buttons = CONTROLLER_STATE_UP_DOWN_LEFT_RIGHT_B_C;
			select = SELECT_HIGH;
			done = NOT_DONE;
		end
		ESTADO_1, ESTADO_3: begin
			buttons = CONTROLLER_STATE_UP_DOWN_A_START;
			select = SELECT_LOW;
			done = NOT_DONE;
		end
		ESTADO_5: begin
			buttons = CONTROLLER_STATE_A_START;
			select = SELECT_LOW;
			done = NOT_DONE;
		end
		ESTADO_6: begin
			buttons = CONTROLLER_STATE_Z_Y_X_MODE_B_C;
			select = SELECT_HIGH;
			done = NOT_DONE;
		end
		ESTADO_7: begin
			buttons = CONTROLLER_STATE_ZEROS;
			select = SELECT_LOW;
			done = NOT_DONE;
		end
		default: begin
			buttons = CONTROLLER_STATE_ZEROS;
			select = SELECT_LOW;
			done = NOT_DONE;
		end
	endcase
end

// Timing logic
always @(posedge clock) begin
	if (!reset_n) begin
		contador <= 13'b0;
	end else begin
		case (state)
			AGUARDAR_ATIVACAO: contador <= 13'b0;
			default: contador <= contador + 13'b0;
		endcase
	end
end

endmodule