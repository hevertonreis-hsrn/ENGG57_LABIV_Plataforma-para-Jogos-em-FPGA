module pixel_counter (
	input  wire        clk,
	input  wire        rst_n,
	input  wire        enable,
	input  wire        bg_fifo_empty,
	output reg				 new_frame,
	output reg new_frame2,
	output reg [9:0]   pixel_x,         // 0–639
	output reg [8:0]   pixel_y          // 0–479
);

	localparam H_MAX = 640;
	localparam V_MAX = 480;

	reg started;
	reg new_frame_d;  // Registrador para detectar borda do new_frame


  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      started <= 1'b0;
    end else if (!started) begin
      if (!bg_fifo_empty)
        started <= 1'b1;
			else
				started <= 1'b0;
    end
  end
  
	// Pulso de new_frame2 (detecção de borda de new_frame)
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			new_frame2 <= 0;
			new_frame_d <= 0;
		end else begin
			new_frame_d <= new_frame;
			new_frame2 <= new_frame & ~new_frame_d;  // Gera pulso de 1 ciclo
		end
	end
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			pixel_x   <= 0;
			pixel_y   <= 0;
			new_frame <= 0;
		end else if (started) begin
			new_frame <= 0;
			if (enable) begin
				if (pixel_x == H_MAX - 1) begin
					pixel_x <= 0;
					if (pixel_y == V_MAX - 1) begin
						pixel_y   <= 0;
						new_frame <= 1;
					end else begin
						pixel_y <= pixel_y + 1;
					end
				end else begin
					pixel_x <= pixel_x + 1;
			end
			end
		end
	end
endmodule
