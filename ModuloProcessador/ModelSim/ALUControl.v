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

// Operações da ALU
always @(*) begin

	 Operation = 4'b1111;

    case (ALUOp)
        LW_1,SW_1,ADD: begin
            Operation = 4'b0001; // Adição
        end

        SUB: begin
            Operation = 4'b0010; // Subtração
        end

        MUL: begin
            Operation = 4'b0011; // Multiplicação
        end

        DIV: begin
            Operation = 4'b0100; // Divisão
        end

        LW_2, SW_2, MOV: begin
            Operation = 4'b0101; // Move
        end

        LW_3: begin
            Operation = 4'b0110; 
        end

        AND: begin
            Operation = 4'b0111; // AND
        end

        OR: begin
            Operation = 4'b1000; // OR
        end

        SHL: begin
            Operation = 4'b1001; // Shift Left
        end

        SHR: begin
            Operation = 4'b1010; // Shift Right
        end

        CMP: begin
            Operation = 4'b1011; // Comparação
        end

        NOT: begin
            Operation = 4'b1100; // NOT
        end

        JR, JPC, CALL, RET: begin
            Operation = 4'b1101; // Jump Register, Jump on Condition, Call, Return
        end

        BRFL: begin
            Operation = 4'b1110; // Branch Flag
        end

        NOP: begin
            Operation = 4'b1111; // No Operation
        end

        default: begin

        end
    endcase

end
endmodule
