`timescale 1ns/1ps

module ModuloVgaControllerTB;
  // clocks e reset
  reg clk50 = 0, rst_n = 0;
  always #10 clk50 = ~clk50;        // 50 MHz

  // sinais SDRAM
  wire [12:0] zs_addr;
  wire [1:0]  zs_ba;
  wire        zs_cas_n, zs_cke, zs_cs_n, zs_ras_n, zs_we_n;
  wire [3:0]  zs_dqm;
  wire [31:0] zs_dq;

  // sinais VGA / FIFO / Avalon
  wire        outRequest;
  wire        VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK;
  wire [9:0]  outX, outY;
  wire [7:0]  VGA_R, VGA_G, VGA_B;
	
  // Instancia DUT
  ModuloVgaController dut (
    .CLOCK_50(clk50),
    .KEY(rst_n),
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
    .DRAM_WE_N(zs_we_n), .DRAM_ADDR(zs_addr),
    .DRAM_BA(zs_ba), .DRAM_DQ(zs_dq), .DRAM_DQM(zs_dqm),
    .outX(outX), .outY(outY),
    .VGA_B(VGA_B), .VGA_G(VGA_G), .VGA_R(VGA_R)
  );

  // Instancia modelo SDRAM de simulação
  EmbarcadoVGA_sdram_controller_test_component sdram_sim (
    .clk(clk50),
    .zs_addr(zs_addr), .zs_ba(zs_ba),
    .zs_cas_n(zs_cas_n), .zs_cke(zs_cke), .zs_cs_n(zs_cs_n),
    .zs_dqm(zs_dqm), .zs_ras_n(zs_ras_n), .zs_we_n(zs_we_n),
    .zs_dq(zs_dq)
  );

  initial begin
    // reset
    rst_n = 0; #100;
    rst_n = 1;

    // simulacao
    #40_000_000;
    $finish;
  end
endmodule
