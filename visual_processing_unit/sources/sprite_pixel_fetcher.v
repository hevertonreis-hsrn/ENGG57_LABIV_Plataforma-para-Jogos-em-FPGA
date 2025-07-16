module sprite_pixel_fetcher (
	input  wire        clk,
	input  wire        rst_n,
	input  wire        start,

	input  wire [22:0] h0_in,
	input  wire [22:0] h1_in,
	input  wire [22:0] h2_in,
	input  wire [22:0] h3_in,

	input  wire [23:0] rom_data,      // Saída da ROM (q)
	output reg  [23:0] pixel_out,
	output reg  [15:0] rom_addr,      // Endereço da ROM
	output reg         done
);

	// FSM States
	localparam IDLE    = 2'b00,
 					   CHECK   = 2'b01;
						 
	reg [1:0] state;

	reg [22:0] sprite_regs [0:3];
	reg [1:0] current_index;
	reg [23:0] rom_data_d;

	// Calcula o endereço da ROM
	function [15:0] sprite_to_addr(input [22:0] sprite);
		begin
			sprite_to_addr = (((sprite[17:9] - 1) * 256) +
			                    sprite[4:1] * 16 +
			                    sprite[8:5]); // <<1 pois ROM é 16 bits
		end
	endfunction

	// FSM logic
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			state         <= IDLE;
			pixel_out     <= 0;
			rom_addr      <= 0;
			current_index <= 0;
			done          <= 0;
			rom_data_d    <= 0;
		end else begin
			done       <= 0;
			rom_data_d <= rom_data; // captura da ROM após 1 ciclo

			case (state)
				IDLE: begin
					if (start) begin
						sprite_regs[0] <= h3_in;
						sprite_regs[1] <= h2_in;
						sprite_regs[2] <= h1_in;
						sprite_regs[3] <= h0_in;
						current_index  <= 0;
						if (h0_in == 0 && h1_in == 0 && h2_in == 0 && h3_in == 0) begin
							pixel_out <= 0;
							done      <= 1;
							state     <= IDLE;
						end else begin
							rom_addr <= sprite_to_addr(h3_in);
							state    <= CHECK;
						end
					end
				end
				
				CHECK: begin
					if (rom_data_d != 24'h0) begin
						pixel_out <= rom_data_d;
						done      <= 1;
						state     <= IDLE;
					end else begin
						current_index <= current_index + 1;
						if (current_index == 2'd3 || (current_index < 2'd3 && sprite_regs[current_index + 1] == 0)) begin
							pixel_out <= 0;
							done      <= 1;
							state     <= IDLE;
						end else begin
							rom_addr <= sprite_to_addr(sprite_regs[current_index + 1]);
							state    <= CHECK;
						end
					end
				end

				default: state <= IDLE;
			endcase
		end
	end
endmodule
