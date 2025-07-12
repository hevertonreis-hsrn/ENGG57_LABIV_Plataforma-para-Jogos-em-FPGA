module composer_ctrl(
  input  wire        clk,           // clk_sys
  input  wire        rst_n,

  // handshakes / status
  input  wire        bg_valid,      // vindo do BG FIFO
  input  wire        fetch_done,    // sprite_pixel_fetcher.busy
  input  wire        new_frame,     // pixel_counter sinalizou fim de frame
	input  wire				 sprites_ready,
  input  wire [9:0]  pixel_x,
  input  wire [8:0]  pixel_y,
  input  wire        wrfull,        // pixel_composer FIFO full

  // controles para blocos
  output reg         bg_rdreq,
  output reg         start_fetch,
  output reg         pc_enable,
  output reg         wrreq
);

	localparam S_IDLE 			= 0,
						 S_REQ_BG 		= 1,
						 S_WAIT_BG    = 2,
						 S_WAIT_FETCH = 3,
             S_COMPOSE    = 4;


  reg [2:0] state, next;

  // State register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) state <= S_IDLE;
    else        state <= next;
  end

  // Next-state and outputs
  always @(*) begin
    // default de-asserts
    bg_rdreq       = 1'b0;
    start_fetch    = 1'b0;
    pc_enable      = 1'b0;
    wrreq          = 1'b0;
    next           = state;

    case(state)
      S_IDLE: begin
        if (new_frame || sprites_ready) begin
          next = S_REQ_BG;
        end
      end

      S_REQ_BG: begin
        if (!wrfull && bg_valid) begin         // evita solicitar se FIFO de saída estiver cheia
          bg_rdreq = 1;
					start_fetch = 1;
          next = S_WAIT_FETCH;
        end
      end

      S_WAIT_FETCH: begin
        if (fetch_done) begin     // pixel do sprite pronto
          next = S_COMPOSE;
        end
      end

      S_COMPOSE: begin
        if (!wrfull) begin
          pc_enable = 1;           // avança pixel_counter / compõe próximo pixel
          wrreq     = 1;           // grava na FIFO de saída
          // se terminou toda a tela, volta a Idle; caso contrário, começa próximo pixel
          if (pixel_x==639 && pixel_y==479)
            next = S_IDLE;
          else
            next = S_REQ_BG;
        end
      end
    endcase
  end

endmodule
