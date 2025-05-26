module Master_Interface (
  input  wire        clk,
  input  wire        reset_n,

  // Avalon Interface
  input  wire        waitrequest,
  input  wire        readdatavalid,
  input  wire [15:0] readdata,
  output reg         read,
  output reg         chipselect,
  output reg  [1:0 ] byteenable,
  output reg  [29:0] address,
	output reg  [4:0 ] burstcount,      // NOVO
	output reg 				 beginbursttransfer,
  output reg  [15:0] exportdata,

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
  localparam BURST_BYTES  = BURST_LEN * 4;

  localparam IDLE          = 3'd0,
             READ_REQUEST  = 3'd1,
             WAIT_DATA     = 3'd2;
	
	// Internal registers
	reg [2:0 ] state, nstate;
  reg [29:0] addr_counter;
  reg        started;
	reg [4:0]  burst_word_counter;
	reg [15:0] data_d;
	
	  reg [15:0] init_counter;
	
	

  // FSM - Sequential block
  always @(posedge clk) begin
    if (!reset_n) begin
			state        <= IDLE;
			started 		 <= 1'b0;
			addr_counter <= 30'd0;
			burst_word_counter <= 5'd0;
		      init_counter       <= 16'd0; // Reset do contador

    end else begin
      state      	 <= nstate;
			
			if (!started && pll_locked) begin
			
				 if (init_counter < 16'd33550) begin
					init_counter <= init_counter + 1;
			end else begin
				started <= 1'b1;
			end
		end
			
      case (state)
        READ_REQUEST: begin
					if (!waitrequest) begin
						if (fifo_empty) begin
							burst_word_counter <= 0;
						end else if (!fifo_empty && fifo_used == 0) begin
							burst_word_counter <= 0;
						end else if (!fifo_full && !waitrequest && (512 - fifo_used) >= BURST_LEN) begin
							burst_word_counter <= 0;
						end
					end
        end
				
        WAIT_DATA: begin					
					if (readdatavalid) begin
            burst_word_counter <= burst_word_counter + 1;
            if (addr_counter >= TOTAL_PIXELS - 1) begin
							addr_counter <= 30'd0;
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
          nstate = READ_REQUEST;
				end
			end

      READ_REQUEST: begin
				if (!waitrequest) begin
					if (fifo_empty) begin
						nstate = WAIT_DATA;
					end else if (!fifo_empty && fifo_used == 0) begin
						nstate = READ_REQUEST;
					end else if (!fifo_full && !waitrequest && (512 - fifo_used) >= BURST_LEN) begin
						nstate = WAIT_DATA;
					end
				end
			end
			
      WAIT_DATA: begin
				if (!waitrequest && readdatavalid && burst_word_counter == (BURST_LEN - 1)) begin
					nstate = READ_REQUEST;
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
		byteenable   			 = 2'b11;
		burstcount   			 = BURST_LEN;
		address      			 = ADDR_SDRAM + (addr_counter << 1);
		beginbursttransfer = 0;
		
		case (state)
			IDLE: begin
				address    = 30'h3FFF_FFFF;
				exportdata = 16'hFFFF;
			end

			READ_REQUEST: begin
				if (!waitrequest) begin
					if (fifo_empty) begin
						chipselect = 1'b1;
						read       = 1'b1;
						beginbursttransfer = 1;
					end else if (!fifo_empty && fifo_used == 0) begin
						// does nothing
					end else if (!fifo_full && !waitrequest && (512 - fifo_used) >= BURST_LEN) begin
						chipselect = 1'b1;
						read       = 1'b1;
						beginbursttransfer = 1;
					end
				end
			end

			WAIT_DATA: begin
				exportdata = data_d;
				
				if(readdatavalid && (burst_word_counter <= 7))
					fifo_wr_en = 1'b1;
			end

			default: ; // No extra actions
		endcase
	end

	always @(posedge clk) begin
		if (!reset_n)
			data_d <= 16'd0;
		else
			data_d <= readdata;
	end
endmodule
