`timescale 1ns/1ps

module ModuloVgaControllerTB;
  // clocks e reset
  reg clk50 = 0, rst_n = 0;
  always #10 clk50 = ~clk50;        // 50 MHz

  // sinais SDRAM
  wire [12:0] zs_addr;
  wire [1:0]  zs_ba;
  wire        zs_cas_n, zs_cke, zs_cs_n, zs_ras_n, zs_we_n, sdram_clk;
  wire [1:0]  zs_dqm;
  wire [15:0] zs_dq;

  // sinais VGA / FIFO / Avalon
  wire        outRequest;
  wire        VGA_HS, VGA_VS, VGA_BLANK_N, VGA_SYNC_N, VGA_CLK;
  wire [9:0]  outX, outY;
  wire [7:0]  VGA_R, VGA_G, VGA_B;
	
	//test keys
	reg rightKey = 1, leftKey = 1;
	reg  [2:0] keys;
	
	// aux
	integer i;
	
  // Instancia DUT
  ModuloVgaController dut (
    .CLOCK_50(clk50),
    .KEY(keys),
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
    .outX(outX),
		.outY(outY),
    .VGA_B(VGA_B),
		.VGA_G(VGA_G),
		.VGA_R(VGA_R)
  );

  // Instancia modelo SDRAM de simulacao
  EmbarcadoVGA_sdram_controller_test_component sdram_sim (
    .clk(sdram_clk),
    .zs_addr(zs_addr), .zs_ba(zs_ba),
    .zs_cas_n(zs_cas_n), .zs_cke(zs_cke), .zs_cs_n(zs_cs_n),
    .zs_dqm(zs_dqm), .zs_ras_n(zs_ras_n), .zs_we_n(zs_we_n),
    .zs_dq(zs_dq)
  );
	
	always @* keys = {leftKey, rightKey, rst_n};
	
	// TASKS para simular apertos de botoes
  task press_right_button;
    begin
      rightKey = 0; #500;
      rightKey = 1; #1000;
    end
  endtask

  task press_left_button;
    begin
      leftKey = 0; #500;
      leftKey = 1; #1000;
    end
  endtask
	
  initial begin
    // reset
    rst_n = 0; #100;
    rst_n = 1;
		
		#400_000; // tempo para o processador executar a primeira escrita no master
		
		 // Loop: pressiona alternadamente os botoes
    for (i = 0; i < 10; i = i + 1) begin
      press_right_button();
      press_left_button();
    end

    // simulacao
    #90_000_000;
    $finish;
  end
endmodule
