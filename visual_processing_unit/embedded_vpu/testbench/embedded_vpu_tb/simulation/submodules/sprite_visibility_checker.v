module sprite_visibility_checker #(
    parameter SPRITE_COUNT = 32
)(
    input clk,
    input reset_n,
		
    // Control interface
    input  wire        write,
    input  wire [7:0]  address,
    input  wire [31:0] writedata,
    input  wire        latch_sprites,
    input  			[9:0 ] current_pixel_x,   // posição do pixel atual em X (0 a 639)
    input  			[8:0 ] current_pixel_y,   // posição do pixel atual em Y (0 a 479)
		output reg         sprites_ready,
		
		// Expanded outputs
    output [17:0] s0_out,
    output [17:0] s1_out,
    output [17:0] s2_out,
    output [17:0] s3_out,
    output [17:0] s4_out,
    output [17:0] s5_out,
    output [17:0] s6_out,
    output [17:0] s7_out,
    output [17:0] s8_out,
    output [17:0] s9_out,
    output [17:0] s10_out,
    output [17:0] s11_out,
    output [17:0] s12_out,
    output [17:0] s13_out,
    output [17:0] s14_out,
    output [17:0] s15_out,
    output [17:0] s16_out,
    output [17:0] s17_out,
    output [17:0] s18_out,
    output [17:0] s19_out,
    output [17:0] s20_out,
    output [17:0] s21_out,
    output [17:0] s22_out,
    output [17:0] s23_out,
    output [17:0] s24_out,
    output [17:0] s25_out,
    output [17:0] s26_out,
    output [17:0] s27_out,
    output [17:0] s28_out,
    output [17:0] s29_out,
    output [17:0] s30_out,
    output [17:0] s31_out
);

	reg  [31:0] sprite_regs [0:SPRITE_COUNT-1];
	wire [17:0] results     [0:SPRITE_COUNT-1];
  reg  [1:0 ] world_type;          // 00: 9x1, 01: 1x9, 10: 3x3
	reg  [12:0] world_offset_x;
	reg  [12:0] world_offset_y;
	
	// Register bank with the data already expanded
  reg  [8:0 ] sprite_out_id    [0:SPRITE_COUNT-1];
	reg  [12:0] sprite_out_pos_x [0:SPRITE_COUNT-1];
	reg  [12:0] sprite_out_pos_y [0:SPRITE_COUNT-1];

	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			sprite_regs[0]  <= 32'b0; sprite_regs[1]  <= 32'b0; sprite_regs[2]  <= 32'b0; sprite_regs[3]  <= 32'b0; 
			sprite_regs[4]  <= 32'b0; sprite_regs[5]  <= 32'b0; sprite_regs[6]  <= 32'b0; sprite_regs[7]  <= 32'b0;  
			sprite_regs[8]  <= 32'b0; sprite_regs[9]  <= 32'b0; sprite_regs[10] <= 32'b0; sprite_regs[11] <= 32'b0;
			sprite_regs[12] <= 32'b0; sprite_regs[13] <= 32'b0; sprite_regs[14] <= 32'b0; sprite_regs[15] <= 32'b0;
			sprite_regs[16] <= 32'b0; sprite_regs[17] <= 32'b0; sprite_regs[18] <= 32'b0; sprite_regs[19] <= 32'b0;
			sprite_regs[20] <= 32'b0; sprite_regs[21] <= 32'b0; sprite_regs[22] <= 32'b0; sprite_regs[23] <= 32'b0;
			sprite_regs[24] <= 32'b0; sprite_regs[25] <= 32'b0; sprite_regs[26] <= 32'b0; sprite_regs[27] <= 32'b0;
			sprite_regs[28] <= 32'b0; sprite_regs[29] <= 32'b0; sprite_regs[30] <= 32'b0; sprite_regs[31] <= 32'b0;
			sprites_ready <= 1'b0;
		end else begin
			sprites_ready <= 1'b0;
			if (write) begin
				if (address < SPRITE_COUNT)
					sprite_regs[address] <= writedata;
				else if (address == 8'd32)
					world_offset_x <= writedata[12:0];
				else if (address == 8'd33)
					world_offset_y <= writedata[12:0];
				else if (address == 8'd34)
					world_type <= writedata[1:0];
				else if (address == 8'd35)
					sprites_ready <= 1'b1;
			end

		end
	end

	// Auxiliary functions
	function [12:0] decode_x(input [31:0] sprite_data, input [1:0] wtype);
		case (wtype)
			2'b00: decode_x = sprite_data[22:10];              // 13 bits (9x1)
			2'b01: decode_x = {3'b000, sprite_data[22:13]};    // 10 bits (1x9)
			2'b10: decode_x = {1'b0, sprite_data[22:11]};      // 12 bits (3x3)
			default: decode_x = 13'd0;
		endcase
	endfunction

	function [12:0] decode_y(input [31:0] sprite_data, input [1:0] wtype);
		case (wtype)
			2'b00: decode_y = {3'b000, sprite_data[9:0]};       // 10 bits (9x9)
			2'b01: decode_y = sprite_data[12:0];               // 13 bits (1x9)
			2'b10: decode_y = {2'b00, sprite_data[10:0]};      // 11 bits (3x3)
			default: decode_y = 13'd0;
		endcase
	endfunction

  function [8:0] decode_id(input [31:0] sprite_data);
    decode_id = sprite_data[31:23];
  endfunction
	
	// Synchronous update of the decoded data
  genvar i;
  generate
    for (i = 0; i < SPRITE_COUNT; i = i + 1) begin : GEN_SPRITES_UPDATE
      always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
          sprite_out_id[i]    <= 9'd0;
					sprite_out_pos_x[i] <= 13'd0;
					sprite_out_pos_y[i] <= 13'd0;
        end else if (sprites_ready || latch_sprites) begin
          sprite_out_id[i]    <= decode_id(sprite_regs[i]);
					sprite_out_pos_x[i] <= decode_x(sprite_regs[i], world_type);
					sprite_out_pos_y[i] <= decode_y(sprite_regs[i], world_type);
        end
      end
    end
  endgenerate
	
	genvar j;
	generate
		for (j = 0; j < 32; j = j + 1) begin : CHECKERS
			wire 				[8:0 ] sprite_id = sprite_out_id[j];
			wire signed [13:0] pos_x 		 = $signed({1'b0, sprite_out_pos_x[j]});
			wire signed [13:0] pos_y 		 = $signed({1'b0, sprite_out_pos_y[j]});

			wire signed [13:0] pixel_world_x = $signed({3'b0, current_pixel_x}) + $signed({1'b0, world_offset_x});
			wire signed [13:0] pixel_world_y = $signed({3'b0, current_pixel_y}) + $signed({1'b0, world_offset_y});

			wire in_x_range     = (pixel_world_x >= pos_x) && (pixel_world_x < pos_x + 16);
			wire in_y_range     = (pixel_world_y >= pos_y) && (pixel_world_y < pos_y + 16);
			wire sprite_visible = (sprite_id != 0) && in_x_range && in_y_range;

			wire signed [13:0] offset_x_signed = pixel_world_x - pos_x;
			wire signed [13:0] offset_y_signed = pixel_world_y - pos_y; 

			wire [3:0] offset_x = offset_x_signed[3:0];
			wire [3:0] offset_y = offset_y_signed[3:0];

			wire is_border_pixel = (offset_x >= 0 && offset_y == 0)
													|| (offset_x == 0 && offset_y > 0 && offset_y < 15)
													|| (offset_x == 15 && offset_y > 0 && offset_y < 15)
													|| (offset_x >= 0 && offset_y == 15);

			assign results[j] = sprite_visible ? {sprite_id, offset_x, offset_y, is_border_pixel} : 18'b0;
		end
	endgenerate

	assign s0_out  = results[0];
	assign s1_out  = results[1];
	assign s2_out  = results[2];
	assign s3_out  = results[3];
	assign s4_out  = results[4];
	assign s5_out  = results[5];
	assign s6_out  = results[6];
	assign s7_out  = results[7];
	assign s8_out  = results[8];
	assign s9_out  = results[9];
	assign s10_out = results[10];
	assign s11_out = results[11];
	assign s12_out = results[12];
	assign s13_out = results[13];
	assign s14_out = results[14];
	assign s15_out = results[15];
	assign s16_out = results[16];
	assign s17_out = results[17];
	assign s18_out = results[18];
	assign s19_out = results[19];
	assign s20_out = results[20];
	assign s21_out = results[21];
	assign s22_out = results[22];
	assign s23_out = results[23];
	assign s24_out = results[24];
	assign s25_out = results[25];
	assign s26_out = results[26];
	assign s27_out = results[27];
	assign s28_out = results[28];
	assign s29_out = results[29];
	assign s30_out = results[30];
	assign s31_out = results[31];
endmodule
