module Control_tb;

    reg [5:0] opcode; // Entrada de opcode
    wire StackPush;
    wire StackPop;
    wire BranchMode;
    wire BranchSrc;
    wire Branch;
    wire MemRead;
    wire MemToReg;
    wire [5:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;


    Control duut(
        .opcode(opcode),
        .StackPush(StackPush),
        .StackPop(StackPop),
        .BranchMode(BranchMode),
        .BranchSrc(BranchSrc),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemToReg(MemToReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );

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

    task Test(
        input [5:0] opcode_in,
        input expected_StackPush,
        input expected_StackPop,
        input expected_BranchMode,
        input expected_BranchSrc,
        input expected_Branch,
        input expected_MemRead,
        input expected_MemToReg,
        input [5:0] expected_ALUOp,
        input expected_MemWrite,
        input expected_ALUSrc,
        input expected_RegWrite
    );
        reg error;
        begin
            opcode = opcode_in;
            #10;

            $display("Testing opcode: %b", opcode_in);

            if (StackPush !== expected_StackPush) begin
                $display("Error: StackPush expected %b, got %b", expected_StackPush, StackPush);
                error = 1;
            end

            if (StackPop !== expected_StackPop) begin
                $display("Error: StackPop expected %b, got %b", expected_StackPop, StackPop);
                error = 1;
            end

            if (BranchMode !== expected_BranchMode) begin
                $display("Error: BranchMode expected %b, got %b", expected_BranchMode, BranchMode);
                error = 1;
            end

            if (BranchSrc !== expected_BranchSrc) begin
                $display("Error: BranchSrc expected %b, got %b", expected_BranchSrc, BranchSrc);
                error = 1;
            end

            if (Branch !== expected_Branch) begin
                $display("Error: Branch expected %b, got %b", expected_Branch, Branch);
                error = 1;
            end

            if (MemRead !== expected_MemRead) begin
                $display("Error: MemRead expected %b, got %b", expected_MemRead, MemRead);
                error = 1;
            end

            if (MemToReg !== expected_MemToReg) begin
                $display("Error: MemToReg expected %b, got %b", expected_MemToReg, MemToReg);
                error = 1;
            end

            if (ALUOp !== expected_ALUOp) begin
                $display("Error: ALUOp expected %b, got %b", expected_ALUOp, ALUOp);
                error = 1;
            end

            if (MemWrite !== expected_MemWrite) begin
                $display("Error: MemWrite expected %b, got %b", expected_MemWrite, MemWrite);
                error = 1;
            end

            if (ALUSrc !== expected_ALUSrc) begin
                $display("Error: ALUSrc expected %b, got %b", expected_ALUSrc, ALUSrc);
                error = 1;
            end

            if (RegWrite !== expected_RegWrite) begin
                $display("Error: RegWrite expected %b, got %b", expected_RegWrite, RegWrite);
                error = 1;
            end

            if (error) begin
                $display("Test failed for opcode %b", opcode_in);
                $stop;
            end else begin
                $display("Test passed for opcode %b", opcode_in);
            end
        end
    endtask

    integer i;
    initial begin
        Test(LW_1, 0, 0, 0, 0, 0, 1, 1, LW_1, 0, 1, 1);
        Test(LW_2, 0, 0, 0, 0, 0, 1, 1, LW_2, 0, 0, 1);
        Test(LW_3, 0, 0, 0, 0, 0, 0, 0, LW_3, 0, 1, 1);
        Test(SW_1, 0, 0, 0, 0, 0, 0, 0, SW_1, 1, 1, 0);
        Test(SW_2, 0, 0, 0, 0, 0, 0, 0, SW_2, 1, 0, 0);
        Test(MOV, 0, 0, 0, 0, 0, 0, 0, MOV, 0, 0, 1);
        Test(ADD, 0, 0, 0, 0, 0, 0, 0, ADD, 0, 0, 1);
        Test(SUB, 0, 0, 0, 0, 0, 0, 0, SUB, 0, 0, 1);
        Test(MUL, 0, 0, 0, 0, 0, 0, 0, MUL, 0, 0, 1);
        Test(DIV, 0, 0, 0, 0, 0, 0, 0, DIV, 0, 0, 1);
        Test(AND, 0, 0, 0, 0, 0, 0, 0, AND, 0, 0, 1);
        Test(OR, 0, 0, 0, 0, 0, 0, 0, OR, 0, 0, 1);
        Test(SHL, 0, 0, 0, 0, 0, 0, 0, SHL, 0, 0, 1);
        Test(SHR, 0, 0, 0, 0, 0, 0, 0, SHR, 0, 0, 1);
        Test(CMP, 0, 0, 0, 1, 0, 0, 0, CMP, 0, 0, 0);
        Test(NOT, 0, 0, 0, 0, 0, 0, 0, NOT, 0, 0, 1);
        Test(JR, 0, 0, 1, 0, 1, 0, 0, JR, 0, 0, 0);
        Test(JPC, 0, 0, 0, 0, 1, 0, 0, JPC, 0, 1, 0);
        Test(BRFL, 0, 0, 1, 0, 1, 0, 0, BRFL, 0, 1, 0);
        Test(CALL, 1, 0, 1, 0, 1, 0, 0, CALL, 0, 0, 1);
        Test(RET, 0, 1, 1, 1, 1, 0, 0, RET, 0, 0, 0);
        Test(NOP, 0, 0, 0, 0, 0, 0, 0, NOP, 0, 0, 0);
        // Teste para opcode inválido
        for (i = 6'b011110; i < 6'b111111; i = i + 1) begin
            Test(i, 0, 0, 0, 0, 0, 0, 0, NOP, 0, 0, 0);
        end

        $display("Finished testing Control.");
        $stop;
    end

endmodule