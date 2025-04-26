// vgaController.v
module vgaController(
    input wire clk_pix,       // clock de pixel (já em 25 MHz)
    input wire rst_pix,       // reset
    output reg [9:0] hCount,  // posição horizontal
    output reg [9:0] vCount,  // posição vertical
    output reg hSync,         // sinal de sincronismo horizontal
    output reg vSync,         // sinal de sincronismo vertical
    output reg de             // data enable (1 durante área visível)
);

// Parâmetros para VGA 640x480@60Hz
parameter HA_END = 639;           // Fim da área ativa horizontal
parameter HS_STA = HA_END + 16;    // Início do pulso de hsync
parameter HS_END = HS_STA + 96;    // Fim do pulso de hsync
parameter LINE   = 799;            // Total de pixels por linha

parameter VA_END = 479;            // Fim da área ativa vertical
parameter VS_STA = VA_END + 10;    // Início do pulso de vsync
parameter VS_END = VS_STA + 2;     // Fim do pulso de vsync
parameter SCREEN = 524;            // Total de linhas por frame

// Contadores horizontais e verticais
always @(posedge clk_pix or posedge rst_pix) begin
    if (rst_pix) begin
        hCount <= 0;
        vCount <= 0;
    end else begin
        if (hCount == LINE) begin
            hCount <= 0;
            if (vCount == SCREEN)
                vCount <= 0;
            else
                vCount <= vCount + 1;
        end else begin
            hCount <= hCount + 1;
        end
    end
end

// Geração dos sinais de sincronismo e data enable
always @(*) begin
    // Sinais de sincronismo: negativos
    hSync = ~((hCount >= HS_STA) && (hCount < HS_END));
    vSync = ~((vCount >= VS_STA) && (vCount < VS_END));
    
    // Data enable: 1 na área ativa
    de = (hCount <= HA_END) && (vCount <= VA_END);
end

endmodule
