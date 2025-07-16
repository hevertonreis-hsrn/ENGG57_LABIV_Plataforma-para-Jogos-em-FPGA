`timescale 1ns/1ps

module visual_processing_unit_tb;
  // clocks e reset
  reg clk50 = 0;
  reg rst_n = 0;
  always #10 clk50 = ~clk50;  // Clock de 50 MHz

  // SDRAM
  wire [12:0] zs_addr;
  wire [1:0]  zs_ba;
  wire        zs_cas_n, zs_cke, zs_cs_n, zs_ras_n, zs_we_n;
  wire        sdram_clk;
  wire [3:0]  zs_dqm;
  wire [31:0] zs_dq;

  // VGA e sinais de controle
  wire        outRequest;
  wire        VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK;
  wire [9:0]  outX, outY;
  wire [7:0]  VGA_R, VGA_G, VGA_B;

  // SW e KEY simulados
  reg [0:0] SW = 1'b0;      // reset ativo em 0
	
	// GPIO - botões do controle (ativos em 0)
  reg GPIO35 = 1;
  reg GPIO31 = 1;
  reg GPIO27 = 1;
  reg GPIO25 = 1;
  reg GPIO33 = 1;
  reg GPIO23 = 1;
  wire GPIO29;

  // Variáveis auxiliares
  integer i;

  // DUT: seu top-level
  visual_processing_unit dut (
    .CLOCK_50(clk50),
    .SW(SW),
		
    .outRequest(outRequest),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .VGA_BLANK_N(VGA_BLANK_N),
    .VGA_SYNC_N(VGA_SYNC_N),
    .VGA_CLK(VGA_CLK),

    .DRAM_CAS_N(zs_cas_n),
    .DRAM_CKE(zs_cke),
    .DRAM_CS_N(zs_cs_n),
    .DRAM_RAS_N(zs_ras_n),
    .DRAM_WE_N(zs_we_n),
    .DRAM_CLK(sdram_clk),
    .DRAM_ADDR(zs_addr),
    .DRAM_BA(zs_ba),
    .DRAM_DQ(zs_dq),
    .DRAM_DQM(zs_dqm),

		.GPIO35(GPIO35),
		.GPIO31(GPIO31),
    .GPIO27(GPIO27),
    .GPIO25(GPIO25),
    .GPIO33(GPIO33),
    .GPIO23(GPIO23),
    .GPIO29(GPIO29),
		
    .outX(outX),
    .outY(outY),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B)
  );

  // Modelo de SDRAM de simulação
  embedded_vpu_sdram_controller_test_component sdram_model (
    .clk(sdram_clk),
    .zs_addr(zs_addr),
    .zs_ba(zs_ba),
    .zs_cas_n(zs_cas_n),
    .zs_cke(zs_cke),
    .zs_cs_n(zs_cs_n),
    .zs_dqm(zs_dqm),
    .zs_ras_n(zs_ras_n),
    .zs_we_n(zs_we_n),
    .zs_dq(zs_dq)
  );

  // Simula o reset e eventos básicos
  initial begin
    // Reset global
    SW = 1'b0;  // reset ativo
    #100;
    SW = 1'b1;  // libera reset
    // Simula por um tempo razoável
    #90_000_000;

    $finish;
  end
endmodule
