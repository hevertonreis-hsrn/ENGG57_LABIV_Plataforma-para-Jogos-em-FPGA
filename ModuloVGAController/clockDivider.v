module clockDivider (
    input wire clk,       // Clock de entrada
    input wire reset,     // Sinal de reset (ativo alto)
    output reg clk_out    // Clock de saída dividido
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset assíncrono - força o clock de saída para 0
        clk_out <= 1'b0;
    end else begin
        // Inverte o sinal de clock a cada ciclo do clock de entrada
        clk_out <= ~clk_out;
    end
end

endmodule