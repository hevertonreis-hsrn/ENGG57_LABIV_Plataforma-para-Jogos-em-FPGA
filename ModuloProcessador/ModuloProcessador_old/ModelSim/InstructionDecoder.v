module InstructionDecoder (
    input wire [31:0] instruction,  // Instrucao completa
    output wire [5:0] opcode,       // OPCODE
	 output wire [4:0] r1,           // Registrador base
	 output wire [4:0] r2,           // Registrador destino
    output wire [15:0] immediate    // Valor imediato 
);

    // Extracao dos campos da instrucao
    assign opcode = instruction[31:26];
    assign r1 = instruction[25:21];
    assign r2 = instruction[20:16];
    assign immediate = instruction[15:0];

endmodule
