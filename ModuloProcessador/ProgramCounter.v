module ProgramCounter (
    input wire clk,
    input wire rst,
    input wire [7:0] nextPC,       // Proximo PC (incrementado)
    input wire holdPC,
    output reg [7:0] currentPC     // PC atual
);

    always @(posedge clk) begin
        if (rst) begin
            currentPC <= 8'b0;  // Reset do PC
		  end
        else if(holdPC == 1'b0) begin
            currentPC <= nextPC;  // Caminho normal (incrementado)
		  end
    end
endmodule