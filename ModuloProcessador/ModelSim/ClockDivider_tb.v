`timescale 1ns/1ps

module ClockDivider_tb;
    reg clk_in; // Clock de entrada
    reg rst;    // Reset assíncrono
    wire clk_out; // Clock dividido por 2

    ClockDivider uut (
        .clk_in(clk_in),
        .rst(rst),
        .clk_out(clk_out)
    );

    always #5 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        rst = 0;
        #10;
        #10 rst = 1; // Ativa o reset
        #10 rst = 0; // Desativa o reset
        #300;
        $stop;
    end

endmodule