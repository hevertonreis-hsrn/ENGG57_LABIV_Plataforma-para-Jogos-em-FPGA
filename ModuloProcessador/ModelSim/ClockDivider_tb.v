module ClockDivider_tb;
    reg clk_in; // Clock de entrada
    reg rst;    // Reset assíncrono
    wire clk_out; // Clock dividido por 2

    ClockDivider uut (
        .clk_in(clk_in),
        .rst(rst),
        .clk_out(clk_out)
    );

    task Test(input clk, input reset);
        begin
            clk_in = clk;
            rst = reset;
            #10; // Espera 10 unidades de tempo para estabilizar a saída
            $display("clk_in: %b, rst: %b, clk_out: %b", clk_in, rst, clk_out);

            
        end
    endtask

    integer i;
    reg [31:0] seed;
    initial begin
        seed = 32
    end

endmodule