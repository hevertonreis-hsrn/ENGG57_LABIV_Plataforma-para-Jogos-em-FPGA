module sprite_pixel_fetcher ( 
	input  wire        clk,
	input  wire        rst_n,
	input  wire        start,

	input  wire [22:0] h0_in,
	input  wire [22:0] h1_in,
	input  wire [22:0] h2_in,
	input  wire [22:0] h3_in,

	input  wire        readdatavalid,
	input  wire				 waitrequest,
	input  wire [23:0] rom_data,

	output reg  [31:0] rom_addr,
	output reg         read_request,
	output reg				 chipselect,
	output reg         done,
	output reg  [3:0 ] byteenable,
	output reg  [23:0] pixel_out
);

	// FSM States
	localparam IDLE    = 2'b00,
						 REQUEST = 2'b01,
	 					 WAIT    = 2'b10,
 					   CHECK   = 2'b11;
						 
	localparam ADDR_SDRAM = 32'h0800_0000;

	reg [3:0] state;
	
	reg [23:0] data_d;

	// Sprite buffer
	reg [22:0] sprite_regs [0:3];
	reg [1:0]  current_index;

	// Sprite field extraction
	wire [8:0] sprite_id = sprite_regs[current_index][17:9];
	wire [3:0] offset_x  = sprite_regs[current_index][8:5];
	wire [3:0] offset_y  = sprite_regs[current_index][4:1];
	wire       valid     = (sprite_regs[current_index] != 18'd0);

	// ROM address calculation
	wire [15:0] address_calc = ((sprite_id - 1) * 256) + offset_y * 16 + offset_x;

	// FSM logic
	always @(posedge clk or negedge rst_n) begin
			if (!rst_n) begin
				state         <= IDLE;
				read_request  <= 0;
				done          <= 0;
				rom_addr      <= 0;
				pixel_out     <= 0;
				current_index <= 0;
				chipselect    <= 0;
				byteenable    <= 4'b1111;
			end else begin
				byteenable   <= 4'b1111;
				chipselect   <= 0;
				read_request <= 0;
				case (state)
					IDLE: begin
						done <= 0;
						if (start) begin
							// Armazena os registros
							sprite_regs[0] <= h3_in;
							sprite_regs[1] <= h2_in;
							sprite_regs[2] <= h1_in;
							sprite_regs[3] <= h0_in;
							current_index  <= 0;

							if (h0_in == 23'd0 && h1_in == 23'd0 && h2_in == 23'd0 && h3_in == 23'd0) begin
								pixel_out <= 0;
								done      <= 1;
								state     <= IDLE;
							end else begin
								rom_addr     <= ADDR_SDRAM + (address_calc << 2);
								read_request <= 1;
								chipselect   <= 1;
								state        <= REQUEST;
							end
						end
					end

					REQUEST: begin
						chipselect   <= 1;
						read_request <= 1;
						if (!waitrequest) begin
							read_request <= 0;
							chipselect   <= 0;
							state        <= WAIT;
						end
					end

					WAIT: begin
						if (readdatavalid)
								state <= CHECK;
					end

					CHECK: begin
						if (data_d != 24'h000000) begin
							pixel_out <= data_d;
							done      <= 1;
							state     <= IDLE;
						end else begin
							// Tenta o próximo
							current_index <= current_index + 1;
							if (current_index == 2'd3 || sprite_regs[current_index + 1] == 23'd0) begin
								pixel_out <= 0;
								done      <= 1;
								state     <= IDLE;
							end else begin
								rom_addr     <= ADDR_SDRAM + ((((sprite_regs[current_index + 1][17:9] - 1) * 256) +
																  sprite_regs[current_index + 1][4:1] * 16 +
																  sprite_regs[current_index + 1][8:5]) << 2);
								read_request <= 1;
								chipselect   <= 1;
								state        <= REQUEST;
							end
						end
					end

					default: state <= IDLE;
				endcase
			end
	end
	
	always @(posedge clk) begin
		if (!rst_n)
			data_d <= 31'd0;
		else
			data_d <= rom_data;
	end
endmodule
