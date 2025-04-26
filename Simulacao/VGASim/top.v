module top(
    input wire clk,         // Clock 50 MHz
    input wire sim_rst,     // Reset
    output wire [9:0] sdl_sx,
    output wire [9:0] sdl_sy,
    output wire sdl_de,
    output reg [7:0] sdl_r,
    output reg [7:0] sdl_g,
    output reg [7:0] sdl_b
);

// Divisor simples de clock: 50MHz -> 25MHz
reg clk25Mhz = 0;
always @(posedge clk) begin
    clk25Mhz <= ~clk25Mhz;
end

// Sinais de posição e controle
wire [9:0] hCount, vCount;
/* verilator lint_off UNUSED */
wire hSync, vSync;
/* verilator lint_on UNUSED */
wire de;

vgaController vga_inst (
    .clk_pix(clk25Mhz),
    .rst_pix(sim_rst),
    .hCount(hCount),
    .vCount(vCount),
    .hSync(hSync),
    .vSync(vSync),
    .de(de)
);

// Liga posições diretamente
assign sdl_sx = hCount;
assign sdl_sy = vCount;
assign sdl_de = de;

// Gradiente colorido baseado na posição
always @(posedge clk25Mhz) begin
    if (de) begin
        sdl_r <= hCount[7:0];             // vermelho varia com X
        sdl_g <= vCount[7:0];             // verde varia com Y
        sdl_b <= hCount[7:0] ^ vCount[7:0]; // azul é xor de X e Y para variação
    end else begin
        sdl_r <= 8'h00;
        sdl_g <= 8'h00;
        sdl_b <= 8'h00;
    end
end

endmodule
