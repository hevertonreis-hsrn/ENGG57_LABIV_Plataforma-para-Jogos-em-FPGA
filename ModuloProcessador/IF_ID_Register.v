module IF_ID_Register (
    input wire clk,                   // Clock
    input wire rst,                   // Sinal de reset
    input wire [7:0] inPC,            // Entrada: PC incrementado
    input wire [31:0] inInstruction,  // Entrada: Instrução buscada da memória
    input wire hold_IF_ID,
	input wire IF_Flush,
    output reg [7:0] outPC,           // Saída: PC incrementado
    output reg [31:0] outInstruction  // Saída: Instrucao armazenada
);

    always @(posedge clk) begin
        if (rst) begin
            outPC <= 8'b0;
            outInstruction <= 32'b01010100000000000000000000000000;
        end else if(IF_Flush) begin
				outInstruction <= 32'b01010100000000000000000000000000;
        end else if(hold_IF_ID == 1'b0) begin
            outPC <= inPC;
            outInstruction <= inInstruction;
        end
    end

endmodule
