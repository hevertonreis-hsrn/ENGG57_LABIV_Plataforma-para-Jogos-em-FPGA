module PCAdder (
  	input wire [7:0] inPC,       // Valor atual do PC
  	output wire [7:0] outPC      // PC incrementado (proxima instrucao)
);

    assign outPC = inPC + 8'd1;

endmodule