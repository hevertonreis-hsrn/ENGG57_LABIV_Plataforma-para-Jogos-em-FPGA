module visual_processing_unit(
    input  wire        CLOCK_50,
    input  wire [3:0]  KEY,
    input  wire [0:0]  SW,

    output wire        outRequest,
    output wire        VGA_HS,
    output wire        VGA_VS,
    output wire        VGA_BLANK_N,
    output wire        VGA_SYNC_N,
    output wire        VGA_CLK,

    output wire        DRAM_CAS_N,
    output wire        DRAM_CKE,
    output wire        DRAM_CS_N,
    output wire        DRAM_RAS_N,
    output wire        DRAM_WE_N,
    output wire        DRAM_CLK,
    output wire [12:0] DRAM_ADDR,
    output wire [1:0]  DRAM_BA,
    inout  wire [31:0] DRAM_DQ,
    output wire [3:0]  DRAM_DQM,

    output wire [9:0]  outX,
    output wire [9:0]  outY,
    output wire [7:0]  VGA_B,
    output wire [7:0]  VGA_G,
    output wire [7:0]  VGA_R
);

// CLOCKS
wire clk_vga;
wire clk_sys;
wire clk_sdram;
wire pll_locked;

clk_divider pll (
    .inclk0(CLOCK_50),
    .c0(clk_vga),
    .c1(clk_sys),
    .c2(clk_sdram),
    .locked(pll_locked)
);

// FIFO dual clock
wire [23:0] pixel_out;
wire        wrreq;
wire        wrfull;

wire [23:0] fifo_data;
wire        fifo_rdreq;
wire        fifo_rdempty;
wire        fifo_rdfull;
wire 				w_fifo_full;

dual_clock_fifo pixel_fifo (
    .data(pixel_out),
    .rdclk(clk_vga),
    .rdreq(fifo_rdreq),
    .wrclk(clk_sys),
    .wrreq(wrreq),
    .q(fifo_data),
    .rdempty(fifo_rdempty),
    .rdfull(fifo_rdfull),
    .wrfull(wrfull)
);

// Embedded VPU (gera pixels e acessa SDRAM)
embedded_vpu vpu (
    .background_loader_conduit_pll_locked(pll_locked),
    .clk_clk(clk_sys),
    .composer_conduit_pixel_out(pixel_out),
    .composer_conduit_wrreq(wrreq),
    .composer_conduit_wrfull(wrfull),
    .key_external_connection_export(KEY),    // <- NOVO
    .reset_reset_n(SW[0]),                   // <- SW[0] como RESET
    .sdram_controller_wire_addr(DRAM_ADDR),
    .sdram_controller_wire_ba(DRAM_BA),
    .sdram_controller_wire_cas_n(DRAM_CAS_N),
    .sdram_controller_wire_cke(DRAM_CKE),
    .sdram_controller_wire_cs_n(DRAM_CS_N),
    .sdram_controller_wire_dq(DRAM_DQ),
    .sdram_controller_wire_dqm(DRAM_DQM),
    .sdram_controller_wire_ras_n(DRAM_RAS_N),
    .sdram_controller_wire_we_n(DRAM_WE_N)
);

// Leitor da FIFO para o VGA
wire [7:0] r, g, b;
wire 			 preRequest;

pixel_reader p_reader (
    .clk(clk_vga),
    .rstN(SW[0]),
    .fifo_data(fifo_data),
    .fifo_empty(fifo_rdempty),
    .fifo_full(fifo_rdfull),
    .w_fifo_full(w_fifo_full),
    .fifo_rd_en(fifo_rdreq),
    .vga_request(preRequest),
    .outRed(r),
    .outGreen(g),
    .outBlue(b)
);

// Controlador VGA
vga_controller vga (
    .inRed(r),
    .inGreen(g),
    .inBlue(b),
    .fifo_full(w_fifo_full),

    .outX(outX),
    .outY(outY),
    .outRequest(outRequest),
    .preRequest(preRequest),

    .outRed(VGA_R),
    .outGreen(VGA_G),
    .outBlue(VGA_B),
    .hs(VGA_HS),
    .vs(VGA_VS),
    .vgaClk(VGA_CLK),
    .vgaBlankN(VGA_BLANK_N),
    .vgaSyncN(VGA_SYNC_N),

    .clk(clk_vga),
    .rst_n(SW[0])
);

assign DRAM_CLK = clk_sdram;

endmodule
