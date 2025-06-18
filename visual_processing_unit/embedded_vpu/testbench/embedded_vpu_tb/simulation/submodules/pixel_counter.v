module pixel_counter (
	input  wire        clk,
	input  wire        rst_n,
	input  wire        enable,
	input  wire        bg_fifo_empty,
	output reg				 new_frame,
	output reg [9:0]   pixel_x,         // 0–639
	output reg [8:0]   pixel_y          // 0–479
);

	localparam H_MAX = 640;
	localparam V_MAX = 480;

	reg started;

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
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			pixel_x   <= 0;
			pixel_y   <= 0;
			new_frame <= 0;
		end else if (enable && started) begin
			new_frame <= 0;
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
endmodule
