module sprite_pixel_fetcher ( 
	input  wire        clk,
	input  wire        rst_n,

	input  wire [17:0] h0_in,
	input  wire [17:0] h1_in,
	input  wire [17:0] h2_in,
	input  wire [17:0] h3_in,

	output reg  [15:0] rom_addr0,
	output reg  [15:0] rom_addr1,
	output reg  [15:0] rom_addr2,
	output reg  [15:0] rom_addr3,

	input  wire [23:0] rom_data0,
	input  wire [23:0] rom_data1,
	input  wire [23:0] rom_data2,
	input  wire [23:0] rom_data3,

	output reg  [23:0] h0_pixel_out,
	output reg  [23:0] h1_pixel_out,
	output reg  [23:0] h2_pixel_out,
	output reg  [23:0] h3_pixel_out,

	output wire        busy
);

	//-------------------------------
	// Extração dos campos das entradas
	//-------------------------------
	wire [8:0] sprite_id0 = h0_in[17:9];
	wire [3:0] offset_x0  = h0_in[8:5];
	wire [3:0] offset_y0  = h0_in[4:1];
	wire       valid0     = (h0_in != 18'd0);

	wire [8:0] sprite_id1 = h1_in[17:9];
	wire [3:0] offset_x1  = h1_in[8:5];
	wire [3:0] offset_y1  = h1_in[4:1];
	wire       valid1     = (h1_in != 18'd0);

	wire [8:0] sprite_id2 = h2_in[17:9];
	wire [3:0] offset_x2  = h2_in[8:5];
	wire [3:0] offset_y2  = h2_in[4:1];
	wire       valid2     = (h2_in != 18'd0);

	wire [8:0] sprite_id3 = h3_in[17:9];
	wire [3:0] offset_x3  = h3_in[8:5];
	wire [3:0] offset_y3  = h3_in[4:1];
	wire       valid3     = (h3_in != 18'd0);

	//-------------------------------
	// FSM States
	//-------------------------------
	localparam IDLE  = 2'b00;
	localparam FETCH = 2'b01;
	localparam DONE  = 2'b10;

	reg [1:0] state, next_state;

	//-------------------------------
	// Sinal de qualquer sprite válido
	//-------------------------------
	wire any_valid_input = valid0 | valid1 | valid2 | valid3;

	//-------------------------------
	// FSM State Register
	//-------------------------------
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n)
			state <= IDLE;
		else
			state <= next_state;
	end

	//-------------------------------
	// FSM Next State Logic
	//-------------------------------
	always @(*) begin
		next_state = state;
		case (state)
			IDLE:  if (any_valid_input) next_state = FETCH;
			FETCH: next_state = DONE;
			DONE:  next_state = IDLE;
			default: next_state = IDLE;
		endcase
	end

	//-------------------------------
	// Geração dos endereços para ROM
	//-------------------------------
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			rom_addr0 <= 16'd0;
			rom_addr1 <= 16'd0;
			rom_addr2 <= 16'd0;
			rom_addr3 <= 16'd0;
		end else if (state == IDLE) begin
			rom_addr0 <= valid0 ? ((sprite_id0 - 1) * 256 + offset_y0 * 16 + offset_x0) : 16'd0;
			rom_addr1 <= valid1 ? ((sprite_id1 - 1) * 256 + offset_y1 * 16 + offset_x1) : 16'd0;
			rom_addr2 <= valid2 ? ((sprite_id2 - 1) * 256 + offset_y2 * 16 + offset_x2) : 16'd0;
			rom_addr3 <= valid3 ? ((sprite_id3 - 1) * 256 + offset_y3 * 16 + offset_x3) : 16'd0;
		end
	end

	//-------------------------------
	// Captura dos pixels da ROM
	//-------------------------------
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			h0_pixel_out <= 24'd0;
			h1_pixel_out <= 24'd0;
			h2_pixel_out <= 24'd0;
			h3_pixel_out <= 24'd0;
		end else if (state == IDLE) begin
			if (!any_valid_input) begin
				h0_pixel_out <= 24'd0;
				h1_pixel_out <= 24'd0;
				h2_pixel_out <= 24'd0;
				h3_pixel_out <= 24'd0;
			end
		end else if (state == FETCH) begin
			h0_pixel_out <= valid0 ? rom_data0 : 24'd0;
			h1_pixel_out <= valid1 ? rom_data1 : 24'd0;
			h2_pixel_out <= valid2 ? rom_data2 : 24'd0;
			h3_pixel_out <= valid3 ? rom_data3 : 24'd0;
		end
	end

	//-------------------------------
	// Sinal de ocupado (busy)
	//-------------------------------
	assign busy = (state != IDLE);
endmodule
