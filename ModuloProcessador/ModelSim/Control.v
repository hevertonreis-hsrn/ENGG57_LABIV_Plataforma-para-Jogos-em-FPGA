module Control (                
    input wire [5:0] opcode,         // Campo opcode da instrucao (bits [31:26])
    output reg StackPush,
	 output reg StackPop,
	 output reg BranchMode,
    output reg BranchSrc,               // 
    output reg Branch,               // Controle de branch
    output reg MemRead,              // Habilitacao de leitura da memoria
    output reg MemToReg,             // Controle para gravar na memoria
    output reg [5:0] ALUOp,           // Controle da operacao da ALU
    output reg MemWrite,             // Habilitacao de escrita na memoria
    output reg ALUSrc,               // Fonte do segundo operando da ALU
    output reg RegWrite             // Habilitacao de escrita no registrador
);

// Definicao de opcodes (instrucoes)
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
			//SPRITE_LEVEL    = 6'b010110;  // 
			//SPRITE_POS   = 6'b010111;  //
			//SPRITE_COLLISION_BG   = 6'b011000;  //
			//SPRITE_COLLISION_SP   = 6'b011001;  // 
			//PUT_IMAGE   = 6'b011010;  //
			//WAIT_VSYNC   = 6'b011011;  //

always @(opcode) begin
    case (opcode)
        LW_1: begin
            BranchSrc = 0;
            ALUSrc = 1;
            MemToReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = LW_1;
            StackPush = 0;
			   StackPop = 0;
        end
        LW_2: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = LW_2;
            StackPush = 0;
			   StackPop = 0;
        end
        LW_3: begin
            BranchSrc = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = LW_3;
            StackPush = 0;
			   StackPop = 0; 
        end
        SW_1: begin
           	BranchSrc = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            Branch = 0;
            BranchMode = 0;
            ALUOp = SW_1;
            StackPush = 0;
			   StackPop = 0;
        end
        SW_2: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            Branch = 0;
            BranchMode = 0;
            ALUOp = SW_2;
            StackPush = 0;
			   StackPop = 0;
        end
        MOV: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = MOV;
            StackPush = 0;
			   StackPop = 0;
        end
        ADD: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = ADD;
            StackPush = 0;
			   StackPop = 0;
        end
        SUB: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = SUB;
            StackPush = 0;
			   StackPop = 0;
        end
        MUL: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = MUL;
            StackPush = 0;
			   StackPop = 0;
        end
        DIV: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = DIV;
            StackPush = 0;
			   StackPop = 0;
        end
        AND: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = AND;
            StackPush = 0;
			   StackPop = 0;
        end
        OR: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = OR;
            StackPush = 0;
			   StackPop = 0;
        end
        SHL: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = SHL;
            StackPush = 0;
			   StackPop = 0;
        end
        SHR: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = SHR;
            StackPush = 0;
			   StackPop = 0;
        end
        CMP: begin
            BranchSrc = 1;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = CMP;
            StackPush = 0;
			   StackPop = 0;
        end
        NOT: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = NOT;
            StackPush = 0;
			   StackPop = 0;
        end
        JR: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
			   BranchMode = 1;
            ALUOp = JR;
            StackPush = 0;
			   StackPop = 0;
        end
        JPC: begin
            BranchSrc = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            BranchMode = 0;
            ALUOp = JPC;
            StackPush = 0;
			   StackPop = 0;
        end
        BRFL: begin
            BranchSrc = 0;
            ALUSrc = 1;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            BranchMode = 1;
            ALUOp = BRFL;
            StackPush = 0;
			   StackPop = 0;
        end
        CALL: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 1;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            BranchMode = 1;
            ALUOp = CALL;
			   StackPush = 1;
			   StackPop = 0;
        end
        RET: begin
            BranchSrc = 1;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            BranchMode = 1;
            ALUOp = RET;
			   StackPush = 0;
			   StackPop = 1;
        end
        NOP: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            BranchMode = 0;
            ALUOp = NOP;
            StackPush = 0;
			   StackPop = 0;
        end
        default: begin
            BranchSrc = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
			   BranchMode = 0;
          	ALUOp = 6'b010101;
            StackPush = 0;
			   StackPop = 0;
        end
    endcase
end

endmodule
