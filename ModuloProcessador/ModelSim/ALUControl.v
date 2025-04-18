module ALUControl(
	input wire [5:0] ALUOp,
    output reg [3:0] Operation
);

// Definicao de parametros
parameter   LW_1  = 6'b000000,  // Load Word - Estado 1
		    LW_2  = 6'b000001,  // Load Word - Estado 2
			LW_3  = 6'b000010,  // Load Word - Estado 3
			SW_1  = 6'b000011,  // Store Word - Estado 1
			SW_2  = 6'b000100,  // Store Word - Estado 2
			MOV   = 6'b000101,  // Move
			ADD   = 6'b000110,  // Add
			SUB   = 6'b000111,  // Subtract
			MUL   = 6'b001000,  // Multiply
			DIV   = 6'b001001,  // Divide
			AND   = 6'b001010,  // AND
			OR    = 6'b001011,  // OR
			SHL   = 6'b001100,  // Shift Left
			SHR   = 6'b001101,  // Shift Right
			CMP   = 6'b001110,  // Compare
			NOT   = 6'b001111,  // NOT
			JR    = 6'b010000,  // Jump Register
			JPC   = 6'b010001,  // Jump on Condition
			BRFL  = 6'b010010,  // Branch Flag
			CALL  = 6'b010011,  // Call
			RET   = 6'b010100,  // Return
			NOP   = 6'b010101;  // No Operation

parameter   ALU_ADD = 4'b0001,
            ALU_SUB = 4'b0010,
            ALU_MUL = 4'b0011,
            ALU_DIV = 4'b0100,
            ALU_MOV = 4'b0101,
            ALU_SLW = 4'b0110,
            ALU_AND = 4'b0111,
            ALU_OR  = 4'b1000,
            ALU_SHL = 4'b1001,
            ALU_SHR = 4'b1010,
            ALU_CMP = 4'b1011,
            ALU_NOT = 4'b1100,
            ALU_JMP = 4'b1101,
            ALU_BFJ = 4'b1110,
            ALU_NOP = 4'b1111;

// Operações da ALU
always @(*) begin

	Operation = 4'b1111;

    case (ALUOp)
        LW_1,SW_1,ADD: begin
            Operation = ALU_ADD; // Adição
        end

        SUB: begin
            Operation = ALU_SUB; // Subtração
        end

        MUL: begin
            Operation = ALU_MUL; // Multiplicação
        end

        DIV: begin
            Operation = ALU_DIV; // Divisão
        end

        LW_2, SW_2, MOV: begin
            Operation = ALU_MOV; // Move
        end

        LW_3: begin
            Operation = ALU_SLW; 
        end

        AND: begin
            Operation = ALU_AND; // AND
        end

        OR: begin
            Operation = ALU_OR; // OR
        end

        SHL: begin
            Operation = ALU_SHL; // Shift Left
        end

        SHR: begin
            Operation = ALU_SHR; // Shift Right
        end

        CMP: begin
            Operation = ALU_CMP; // Comparação
        end

        NOT: begin
            Operation = ALU_NOT; // NOT
        end

        JR, JPC, CALL, RET: begin
            Operation = ALU_JMP; // Jump Register, Jump on Condition, Call, Return
        end

        BRFL: begin
            Operation = ALU_BFJ; // Branch Flag
        end

        NOP: begin
            Operation = ALU_NOP; // No Operation
        end

        default: begin
            Operation = ALU_NOP;
        end
    endcase

end
endmodule
