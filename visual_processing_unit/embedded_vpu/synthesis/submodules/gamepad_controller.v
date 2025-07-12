module gamepad_controller (
  input  wire        clk,
  input  wire        rst_n,
  input  wire        pin_1,   // UP / Z
  input  wire        pin_2,   // DOWN / Y
  input  wire        pin_3,   // LEFT / X
  input  wire        pin_4,   // RIGHT / MODE
  input  wire        pin_6,   // B / A
  input  wire        pin_9,   // C / START
  output reg  [11:0] btn_out,
  output reg         select
);

  localparam S_WAIT       = 0,
             S_PHASE_0    = 1,
             S_PHASE_1    = 2,
             S_PHASE_2    = 3,
             S_PHASE_3    = 4,
             S_PHASE_4    = 5,
             S_PHASE_5    = 6,
             S_PHASE_6    = 7,
             S_PHASE_7    = 8;
				
	reg [3:0 ] state, next_state;
  reg [12:0] phase_counter;
  reg [32:0] clk_counter;

  wire flag = (clk_counter > 1666660);

  // Clock divider logic
  always @(negedge clk or negedge rst_n) begin
    if (!rst_n)
      clk_counter <= 0;
    else if (clk_counter > 1666666)
      clk_counter <= 0;
    else
      clk_counter <= clk_counter + 1;
  end
	
	// FSM state register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= S_WAIT;
      phase_counter <= 0;
    end else begin
      state <= next_state;
      if (next_state == S_WAIT)
        phase_counter <= 0;
      else
        phase_counter <= phase_counter + 1;
    end
  end

	// Button decoding
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      btn_out <= 12'd0;
    else begin
      case (next_state)
        S_PHASE_1: begin
          btn_out[4]  <= ~pin_6; // A
          btn_out[10] <= ~pin_9; // Start
        end
        S_PHASE_2: begin
          btn_out[0] <= ~pin_1; // Up
          btn_out[1] <= ~pin_2; // Down
          btn_out[2] <= ~pin_3; // Left
          btn_out[3] <= ~pin_4; // Right
        end
        S_PHASE_4: begin
          btn_out[5] <= ~pin_6; // B
          btn_out[6] <= ~pin_9; // C
        end
        S_PHASE_6: begin
          btn_out[7]  <= ~pin_3; // X
          btn_out[8]  <= ~pin_2; // Y
          btn_out[9]  <= ~pin_1; // Z
          btn_out[11] <= ~pin_4; // Mode
        end
      endcase
    end
  end

	// FSM next-state and data logic
  always @(*) begin
    next_state = state;
    case (state)
      S_WAIT:     next_state = flag ? S_PHASE_0 : S_WAIT;
      S_PHASE_0:  next_state = (phase_counter < 1000) ? S_PHASE_0 : S_PHASE_1;
      S_PHASE_1:  next_state = (phase_counter < 2000) ? S_PHASE_1 : S_PHASE_2;
      S_PHASE_2:  next_state = (phase_counter < 3000) ? S_PHASE_2 : S_PHASE_3;
      S_PHASE_3:  next_state = (phase_counter < 4000) ? S_PHASE_3 : S_PHASE_4;
      S_PHASE_4:  next_state = (phase_counter < 5000) ? S_PHASE_4 : S_PHASE_5;
      S_PHASE_5:  next_state = (phase_counter < 6000) ? S_PHASE_5 : S_PHASE_6;
      S_PHASE_6:  next_state = (phase_counter < 7000) ? S_PHASE_6 : S_PHASE_7;
      S_PHASE_7:  next_state = (phase_counter < 8000) ? S_PHASE_7 : S_WAIT;
      default:    next_state = S_WAIT;
    endcase
  end

	// Select line control
  always @(*) begin
    select = 1'b1;
    case (state)
      S_PHASE_1,
      S_PHASE_3,
      S_PHASE_5,
      S_PHASE_7: select = 1'b0;
    endcase
  end
endmodule 