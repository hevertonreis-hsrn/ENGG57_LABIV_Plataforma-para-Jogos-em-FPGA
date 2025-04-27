module ClockDivider (
    input wire clk_in,     // Clock de entrada (rápido)
    input wire rst,        // Reset assíncrono
    output reg clk_out     // Clock dividido por 2
);

    always @(posedge clk_in or posedge rst) begin
        if (rst)
            clk_out <= 0;
        else
            clk_out <= ~clk_out; // Inverte a cada pulso -> divide por 2
    end

endmodule
