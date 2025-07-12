module composer (
    input  wire        clk,
    input  wire        rst_n,

    // Avalon interface (resumo)
    input  wire        avalon_write,
    input  wire [7:0 ] avalon_address,
    input  wire [31:0] avalon_writedata,

    // Background FIFO interface
    input  wire [23:0] bg_fifo_q,
    input  wire        bg_fifo_empty,
		input  wire        bg_fifo_full,
    output wire        bg_fifo_rdreq,

    // Saída para FIFO final de vídeo
    input  wire        wrfull,
    output wire        wrreq,
    output wire [23:0] pixel_out,
		
		// Interface SRAM externa
    input  wire        master_readdatavalid,
		input  wire        master_waitrequest,
    input  wire [31:0] master_readdata,
    output wire [31:0] master_address,
    output wire        master_read,
		output wire [3:0 ] master_byteenable,
		output wire 			 master_chipselect,
		
		output wire        new_frame_test,
		output wire        new_frame_int
);

    //-----------------------------
    // PIXEL COUNTER
    //-----------------------------
    wire [9:0] pixel_x;
    wire [8:0] pixel_y;
		wire       new_frame;
    wire       pc_enable;
		wire 			 sprites_ready;
		wire new_frame2;
			
		assign new_frame_test = new_frame2;
		assign new_frame_int  = new_frame;
	
    pixel_counter pc_inst (
        .clk(clk),
        .rst_n(rst_n),
        .enable(pc_enable),
				.bg_fifo_empty(bg_fifo_empty),
				.new_frame(new_frame),
				.new_frame2(new_frame2),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y)
    );

    //-----------------------------
    // VISIBILITY CHECKER
    //-----------------------------
    wire [17:0] vis_out [31:0];

    sprite_visibility_checker #(32) svc (
        .clk(clk),
        .reset_n(rst_n),
        .write(avalon_write),
        .address(avalon_address),
        .writedata(avalon_writedata),
        .latch_sprites(new_frame),
        .current_pixel_x(pixel_x),
        .current_pixel_y(pixel_y),
				.sprites_ready(sprites_ready),
        .s0_out(vis_out[0]), .s1_out(vis_out[1]), .s2_out(vis_out[2]), .s3_out(vis_out[3]),
        .s4_out(vis_out[4]), .s5_out(vis_out[5]), .s6_out(vis_out[6]), .s7_out(vis_out[7]),
        .s8_out(vis_out[8]), .s9_out(vis_out[9]), .s10_out(vis_out[10]), .s11_out(vis_out[11]),
        .s12_out(vis_out[12]), .s13_out(vis_out[13]), .s14_out(vis_out[14]), .s15_out(vis_out[15]),
        .s16_out(vis_out[16]), .s17_out(vis_out[17]), .s18_out(vis_out[18]), .s19_out(vis_out[19]),
        .s20_out(vis_out[20]), .s21_out(vis_out[21]), .s22_out(vis_out[22]), .s23_out(vis_out[23]),
        .s24_out(vis_out[24]), .s25_out(vis_out[25]), .s26_out(vis_out[26]), .s27_out(vis_out[27]),
        .s28_out(vis_out[28]), .s29_out(vis_out[29]), .s30_out(vis_out[30]), .s31_out(vis_out[31])
    );

    //-----------------------------
    // TOP4 SELECTOR
    //-----------------------------
    wire [22:0] h0, h1, h2, h3;

    top4_sprite_selector selector (
        .s0_in(vis_out[0]),  .s1_in(vis_out[1]),  .s2_in(vis_out[2]),  .s3_in(vis_out[3]),
        .s4_in(vis_out[4]),  .s5_in(vis_out[5]),  .s6_in(vis_out[6]),  .s7_in(vis_out[7]),
        .s8_in(vis_out[8]),  .s9_in(vis_out[9]),  .s10_in(vis_out[10]), .s11_in(vis_out[11]),
        .s12_in(vis_out[12]), .s13_in(vis_out[13]), .s14_in(vis_out[14]), .s15_in(vis_out[15]),
        .s16_in(vis_out[16]), .s17_in(vis_out[17]), .s18_in(vis_out[18]), .s19_in(vis_out[19]),
        .s20_in(vis_out[20]), .s21_in(vis_out[21]), .s22_in(vis_out[22]), .s23_in(vis_out[23]),
        .s24_in(vis_out[24]), .s25_in(vis_out[25]), .s26_in(vis_out[26]), .s27_in(vis_out[27]),
        .s28_in(vis_out[28]), .s29_in(vis_out[29]), .s30_in(vis_out[30]), .s31_in(vis_out[31]),
        .h0_out(h0), .h1_out(h1), .h2_out(h2), .h3_out(h3)
    );

    //-----------------------------
    // SPRITE ROM + FETCHER
    //-----------------------------
    wire [15:0] rom_addr[3:0];
    wire [23:0] rom_data[3:0];
    wire [23:0] spixel[3:0];
		wire [23:0] selected_pixel;
    wire        fetch_done;
		wire        start_fetch;
		wire [23:0] sprite_output;
		
	assign sprite_output = {master_readdata[15:8 ], // RR
												  master_readdata[23:16],  // GG
												  master_readdata[31:24]}; // BB
		

    sprite_pixel_fetcher fetcher (
        .clk(clk),
				.rst_n(rst_n),
				.start(start_fetch),
        .h0_in(h0),
				.h1_in(h1),
				.h2_in(h2),
				.h3_in(h3),
        .readdatavalid(master_readdatavalid),
				.waitrequest(master_waitrequest),
        .rom_data(sprite_output),
        .rom_addr(master_address),
        .read_request(master_read),
			.chipselect(master_chipselect),
        .pixel_out(selected_pixel),
		  .byteenable(master_byteenable),
        .done(fetch_done)
    );
	 
	 
	//-----------------------------
	// COLLISION SPRITE ANALYZER
	//-----------------------------
	
	wire collision;
	
	collision_sprite_analyzer collision_sprite(
		.clk(clk),
		.rst_n(rst_n),
		.new_pixel(fetch_done),
		.new_frame(new_frame2),
		.h0_in(h0),
		.h1_in(h1),
		.h2_in(h2),
		.h3_in(h3),
		.collision(collision) // ainda não implementado
	);
	 
	 
    //-----------------------------
    // BORDER ANALYZER
    //-----------------------------
		
		wire r_comp;
		wire g_comp;
		wire b_comp;
		wire side_val;
		wire selector_val;
		wire min_val;
		wire max_val;
		wire pixel_between;
		
    border_analyzer border_inst (
        .clk(clk),
        .rst_n(rst_n),
		  .new_pixel(fetch_done),
		  .new_frame(new_frame2),
        .bg_pixel(bg_fifo_q),
        .h0_in(h0),
        .h1_in(h1),
        .h2_in(h2),
        .h3_in(h3),
        .r_in(r_comp),
        .g_in(g_comp),
        .b_in(b_comp),
        .side_in(side_val),
        .selector_in(selector_val),
        .reg_min_in(min_val),
        .reg_max_in(max_val),
        .between(pixel_between)
    );

    //-----------------------------
    // PIXEL COMPOSER
    //-----------------------------
    pixel_composer compositor (
        .clk(clk), .rst_n(rst_n),
        .bg_pixel(bg_fifo_q),
        .selected_pixel(selected_pixel),
        .pixel_out(pixel_out)
    );

    //-----------------------------
    // CONTROLE DE CICLOS
    //-----------------------------
      composer_ctrl ctrl (
			.clk           (clk),
			.rst_n         (rst_n),
			.bg_valid      (!bg_fifo_empty),
			.fetch_done    (fetch_done),
			.new_frame     (new_frame),
			.sprites_ready (sprites_ready),
			.pixel_x       (pixel_x),
			.pixel_y       (pixel_y),
			.wrfull        (wrfull),
			.bg_rdreq      (bg_fifo_rdreq),
			.start_fetch   (start_fetch),
			.pc_enable     (pc_enable),
			.wrreq         (wrreq)
		);


endmodule
