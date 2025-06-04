module Master_Interface (
  input  wire        clk,
  input  wire        reset_n,

  // Avalon Interface
  input  wire        waitrequest,
  input  wire        readdatavalid,
  input  wire [31:0] readdata,
	input  wire [31:0] slave_writedata,
	input  wire      	 slave_write,
	input  wire [7:0 ] slave_address, 
  output reg         read,
  output reg         chipselect,
  output reg  [3:0 ] byteenable,
  output reg  [29:0] address,
	output reg  [4:0 ] burstcount,      // NOVO
	output reg 				 beginbursttransfer,
  output reg  [31:0] exportdata,

  // FIFO (Conduit)
  input  wire        fifo_full,
	input  wire        fifo_empty,
  input  wire [8:0]  fifo_used,
  output reg         fifo_wr_en,

  // PLL (Conduit)
  input  wire        pll_locked
);
	
	// Parameters
  localparam ADDR_SDRAM   = 30'h0000_0000;
  localparam IMG_WIDTH    = 640;
  localparam IMG_HEIGHT   = 480;
  localparam TOTAL_PIXELS = IMG_WIDTH * IMG_HEIGHT;
  localparam BURST_LEN    = 8;

  localparam IDLE         = 3'd0,
						 CHECK_FIFO   = 3'd1,
						 READ_REQUEST = 3'd2,
						 WAIT_DATA    = 3'd3;

	// Internal registers
	reg [2:0 ] state, nstate;
  reg [29:0] addr_counter;
  reg        started;
	reg [4:0 ] burst_word_counter;
	reg [31:0] data_d;
	reg [15:0] init_counter;
	
	reg [31:0] bg_width;
  reg [31:0] bg_height;
  reg [31:0] offset_x;
  reg [31:0] offset_y;
	reg [31:0] next_offset_x;
	reg [31:0] next_offset_y;
  reg        start_config;
	
	// Address calculation using visible pixel and offset
  wire [9:0 ] curr_x 				= addr_counter % IMG_WIDTH;
  wire [9:0 ] curr_y 				= addr_counter / IMG_WIDTH;
  wire [29:0] real_bg_index = ((offset_y + curr_y) * bg_width + (offset_x + curr_x));

  // FSM - Sequential block
  always @(posedge clk) begin
    if (!reset_n) begin
			state        			 <= IDLE;
			started 		 			 <= 1'b0;
			addr_counter 			 <= 30'd0;
			burst_word_counter <= 5'd0;
		  init_counter       <= 16'd0; // Reset do contador
			offset_x					 <= 0;
      offset_y 					 <= 0;
    end else begin
      state <= nstate;
			
			if (!started && pll_locked) begin	
				if (init_counter < 16'd33550) begin
					init_counter <= init_counter + 1;
				end else if (start_config) begin
					started <= 1'b1;
				end
			end
			
      case (state)
				IDLE: begin
					offset_x <= 0;
					offset_y <= 0;
				end
				
        READ_REQUEST: begin
					if (!waitrequest) begin
						burst_word_counter <= 0;
					end
        end
				
        WAIT_DATA: begin					
					if (readdatavalid) begin
            burst_word_counter <= burst_word_counter + 1;
            if (addr_counter >= TOTAL_PIXELS - 1) begin
							addr_counter <= 30'd0;
							// Overflow and underflow protection 
							if ((next_offset_x + IMG_WIDTH) >= bg_width)
									offset_x <= bg_width - IMG_WIDTH;
							else
									offset_x <= next_offset_x;

							if ((next_offset_y + IMG_HEIGHT) >= bg_height)
									offset_y <= bg_height - IMG_HEIGHT;
							else
									offset_y <= next_offset_y;
						end else begin
							addr_counter <= addr_counter + 1;
						end
          end
        end
      endcase
    end
  end

	 // FSM - Combinational block
  always @* begin
		nstate = state;
    case (state)
      IDLE: begin
        if (started && !fifo_full) begin
          nstate = CHECK_FIFO;
				end
			end
			
			CHECK_FIFO: begin
				if (fifo_empty) begin
					nstate = READ_REQUEST;
				end else if (!fifo_empty && fifo_used == 0) begin
					nstate = CHECK_FIFO;
				end else if (!fifo_full && !waitrequest && (512 - fifo_used) >= BURST_LEN) begin
					nstate = READ_REQUEST;
				end
			end

      READ_REQUEST: begin
				if (!waitrequest) begin
					nstate = WAIT_DATA;
				end
			end
			
      WAIT_DATA: begin
				if (!waitrequest && readdatavalid && burst_word_counter == (BURST_LEN - 1)) begin
					nstate = CHECK_FIFO;
				end
			end

      default:
        nstate = IDLE;
    endcase
  end

	always @* begin
		// Defaults
		read        			 = 1'b0;
		chipselect   			 = 1'b0;
		fifo_wr_en   			 = 1'b0;
		byteenable   			 = 4'b1111;
		burstcount   			 = BURST_LEN;
		address      			 = ADDR_SDRAM + (real_bg_index << 2);
		beginbursttransfer = 0;
		exportdata         = 31'b0;
		
		case (state)
			IDLE: begin
				address    = 30'h3FFF_FFFF;
				exportdata = 16'hFFFF;
			end
			
			CHECK_FIFO: ; // does nothing
			
			READ_REQUEST: begin
				if (!waitrequest) begin
					chipselect         = 1'b1;
					read               = 1'b1;
					beginbursttransfer = 4'b1;
				end
			end

			WAIT_DATA: begin
				exportdata = data_d;
				if(readdatavalid && (burst_word_counter < BURST_LEN))
					fifo_wr_en = 1'b1;
			end

			default: ; // No extra actions
		endcase
	end

	always @(posedge clk) begin
		if (!reset_n)
			data_d <= 31'd0;
		else
			data_d <= readdata;
	end
	
	
	// WR Mode
	// States
	localparam S_IDLE  = 1'b0;
	localparam S_WRITE = 1'b1;

	reg state_slave, nstate_slave;

	// FSM - Sequential block
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n)
			state_slave <= S_IDLE;
		else
			state_slave <= nstate_slave;
	end

	// FSM - Combinational block
	always @* begin
		nstate_slave = state_slave;
		case (state_slave)
			S_IDLE: begin
				nstate_slave = S_WRITE;
			end 

			S_WRITE: begin
				nstate_slave = S_WRITE;
			end

			default: nstate_slave = S_IDLE;
		endcase
	end
	
	always @(posedge clk or negedge reset_n) begin
		if (!reset_n) begin
			bg_width      <= 0;
			bg_height     <= 0;
			next_offset_x <= 0;
			next_offset_y <= 0;
			start_config  <= 0;
		end else begin
			case (state_slave)
				S_IDLE: begin
					bg_width      <= 0;
					bg_height     <= 0;
					next_offset_x <= 0;
					next_offset_y <= 0;
					start_config  <= 0;
				end

				S_WRITE: begin
					if (slave_write) begin
						case (slave_address)
							4'h0: bg_width      <= slave_writedata;
							4'h1: bg_height     <= slave_writedata;
							4'h2: next_offset_x <= slave_writedata;
							4'h3: next_offset_y <= slave_writedata;
							4'h4: start_config  <= slave_writedata[0];
							default: ;
						endcase
					end
				end

				default: nstate_slave = S_IDLE;
			endcase
		end
	end

endmodule
