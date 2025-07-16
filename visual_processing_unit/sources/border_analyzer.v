module border_analyzer (
  input  wire        clk,
  input  wire        rst_n,
  input  wire        new_pixel,
  input wire new_frame,
  input  wire [23:0] bg_pixel,
  input wire [7:0] address,
  input wire read,
  output reg [31:0] readdata,

  input  wire [22:0] h0_in,
  input  wire [22:0] h1_in,
  input  wire [22:0] h2_in,
  input  wire [22:0] h3_in
);


	reg new_frame_d;
	
  // Agrupamento de entradas
  wire [22:0] h_ins [0:3];
  assign h_ins[0] = h0_in;
  assign h_ins[1] = h1_in;
  assign h_ins[2] = h2_in;
  assign h_ins[3] = h3_in;

  // Extração dos campos
  wire        is_border [0:3];
  wire [8:0]  id         [0:3];
  wire [4:0]  level      [0:3];
  wire [3:0]  offset_x   [0:3];
  wire [3:0]  offset_y   [0:3];

  genvar idx;
  generate
    for (idx = 0; idx < 4; idx = idx + 1) begin : EXTRACT_H_INS
      assign level[idx]     = h_ins[idx][22:18];
      assign id[idx]        = h_ins[idx][17:9];
      assign offset_x[idx]  = h_ins[idx][8:5];
      assign offset_y[idx]  = h_ins[idx][4:1];
      assign is_border[idx] = h_ins[idx][0];
    end
  endgenerate

  // Registradores: min(24) | max(24) | média(24)
  reg [71:0] registers_border_top    [0:31];
  reg [71:0] registers_border_bottom [0:31];
  reg [71:0] registers_border_left   [0:31];
  reg [71:0] registers_border_right  [0:31];

  // Soma e contagem
  reg [31:0] sum_border_top    [0:31];
  reg [31:0] sum_border_bottom [0:31];
  reg [31:0] sum_border_left   [0:31];
  reg [31:0] sum_border_right  [0:31];

  reg [15:0] border_count_top    [0:31];
  reg [15:0] border_count_bottom [0:31];
  reg [15:0] border_count_left   [0:31];
  reg [15:0] border_count_right  [0:31];

  //calcula min e max
	function [71:24] update_min_max;
		input [71:24] in_val;
		input [23:0] new_pixel;
		reg [23:0] min_val, max_val;
		begin
			min_val = in_val[71:48];
			max_val = in_val[47:24];
			if (min_val == 24'd0 && max_val == 24'd0)
				update_min_max = {new_pixel, new_pixel};
			else begin
				update_min_max[71:48] = (new_pixel < min_val) ? new_pixel : min_val;
				update_min_max[47:24] = (new_pixel > max_val) ? new_pixel : max_val;
			end
		end
	endfunction

  // Função para calcular média
  function [23:0] calcula_media;
    input [31:0] soma;
    input [15:0] contador;
    begin
      if (contador != 0)
        calcula_media = soma / contador;
      else
        calcula_media = 24'd0;
    end
  endfunction
  
    reg reset_after_read;

always @(posedge clk ) begin
  if (!rst_n) begin
    reset_after_read <= 0;
  end else begin
    reset_after_read <= read; // captura o estado do read a cada ciclo
  end
end
  
  
  integer i;
  always @(posedge clk) begin
    if (!rst_n || reset_after_read) begin
      for (i=0; i<32; i=i+1) begin
        registers_border_top[i]    <= 72'd0;
        registers_border_bottom[i] <= 72'd0;
        registers_border_left[i]   <= 72'd0;
        registers_border_right[i]  <= 72'd0;

        sum_border_top[i]    <= 32'd0;
        sum_border_bottom[i] <= 32'd0;
        sum_border_left[i]   <= 32'd0;
        sum_border_right[i]  <= 32'd0;

        border_count_top[i]    <= 16'd0;
        border_count_bottom[i] <= 16'd0;
        border_count_left[i]   <= 16'd0;
        border_count_right[i]  <= 16'd0;
      end
    end else if (new_pixel) begin
      for (i=0; i<4; i=i+1) begin
        if (id[i] != 0 && is_border[i]) begin
          if (offset_y[i] == 4'd0) begin // TOP
            registers_border_top[level[i]][71:24] <= update_min_max(registers_border_top[level[i]][71:24], bg_pixel);
            sum_border_top[level[i]] <= sum_border_top[level[i]] + bg_pixel;
            border_count_top[level[i]] <= border_count_top[level[i]] + 1;
            registers_border_top[level[i]][23:0] <= calcula_media(
              sum_border_top[level[i]] + bg_pixel,
              border_count_top[level[i]] + 1
            );
          end
          if (offset_y[i] == 4'd15) begin // BOTTOM
            registers_border_bottom[level[i]][71:24] <= update_min_max(registers_border_bottom[level[i]][71:24], bg_pixel);
            sum_border_bottom[level[i]] <= sum_border_bottom[level[i]] + bg_pixel;
            border_count_bottom[level[i]] <= border_count_bottom[level[i]] + 1;
            registers_border_bottom[level[i]][23:0] <= calcula_media(
              sum_border_bottom[level[i]] + bg_pixel,
              border_count_bottom[level[i]] + 1
            );
          end
          if (offset_x[i] == 4'd0) begin // LEFT
            registers_border_left[level[i]][71:24] <= update_min_max(registers_border_left[level[i]][71:24], bg_pixel);
            sum_border_left[level[i]] <= sum_border_left[level[i]] + bg_pixel;
            border_count_left[level[i]] <= border_count_left[level[i]] + 1;
            registers_border_left[level[i]][23:0] <= calcula_media(
              sum_border_left[level[i]] + bg_pixel,
              border_count_left[level[i]] + 1
            );
          end
          if (offset_x[i] == 4'd15) begin // RIGHT
            registers_border_right[level[i]][71:24] <= update_min_max(registers_border_right[level[i]][71:24], bg_pixel);
            sum_border_right[level[i]] <= sum_border_right[level[i]] + bg_pixel;
            border_count_right[level[i]] <= border_count_right[level[i]] + 1;
            registers_border_right[level[i]][23:0] <= calcula_media(
              sum_border_right[level[i]] + bg_pixel,
              border_count_right[level[i]] + 1
            );
          end
        end
      end
    end
  end
  

always @(posedge clk) begin
    if (!rst_n) begin
        readdata <= 32'd0;
    end else begin
        if (read) begin
            // Handle reads for registers_border_top
            if (address == 8'd70) begin
                readdata <= registers_border_top[address - 69][23:0];
            end else if (address == 8'd71) begin
                readdata <= registers_border_top[address - 69][47:24];
            end else if (address == 8'd72) begin
                readdata <= registers_border_top[address - 69][71:48];
            end
            // Handle reads for registers_border_bottom
            else if (address == 8'd73) begin
                readdata <= registers_border_bottom[address - 69][23:0];
            end else if (address == 8'd74) begin
                readdata <= registers_border_bottom[address - 69][47:24];
            end else if (address == 8'd75) begin
                readdata <= registers_border_bottom[address - 69][71:48];
            end
            // Handle reads for registers_border_left
            // Assuming addresses 76, 77, 78 for left border
            else if (address == 8'd76) begin
                readdata <= registers_border_left[address - 69][23:0];
            end else if (address == 8'd77) begin
                readdata <= registers_border_left[address - 69][47:24];
            end else if (address == 8'd78) begin
                readdata <= registers_border_left[address - 69][71:48];
            end

            else if (address == 8'd79) begin
                readdata <= registers_border_right[address - 69][23:0];
            end else if (address == 8'd80) begin
                readdata <= registers_border_right[address - 69][47:24];
            end else if (address == 8'd81) begin
                readdata <= registers_border_right[address - 69][71:48];
            end
            else begin
                readdata <= 32'd0; // Or some default/error value
            end
        end

    end
end


endmodule
