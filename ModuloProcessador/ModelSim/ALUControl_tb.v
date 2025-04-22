`timescale 1ns/1ps

module ALUControl_tb;
    reg [5:0] ALUOp;
    wire [3:0] Operation;

    ALUControl duut (
        .ALUOp(ALUOp),
        .Operation(Operation)
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

    task TestOperation(input [5:0] ALUOp, input [3:0] expected);
        begin
            ALUOp = ALUOp;
            #10; // Wait for the operation to be computed
            if (Operation !== expected) begin
                $display("Test failed for ALUOp: %b, expected: %b, got: %b", ALUOp, expected, Operation);
            end else begin
                $display("Test passed for ALUOp: %b, expected: %b", ALUOp, expected);
                $stop;
            end
        end
    endtask

    initial begin
        // Test cases
        TestOperation(LW_1, ALU_ADD);
        TestOperation(SW_1, ALU_ADD);
        TestOperation(ADD, ALU_ADD);
        TestOperation(SUB, ALU_SUB);
        TestOperation(MUL, ALU_MUL);
        TestOperation(DIV, ALU_DIV);
        TestOperation(AND, ALU_AND);
        TestOperation(OR, ALU_OR);
        TestOperation(SHL, ALU_SHL);
        TestOperation(SHR, ALU_SHR);
        TestOperation(CMP, ALU_CMP);
        TestOperation(NOT, ALU_NOT);
        TestOperation(JR, ALU_JMP);
        TestOperation(JPC, ALU_BFJ);
        TestOperation(BRFL, ALU_NOP);
        TestOperation(CALL, ALU_NOP);
        TestOperation(RET, ALU_NOP);
        TestOperation(NOP, ALU_NOP);

        // Testing invalid operation
        TestOperation(6'b111111, ALU_NOP); // Invalid operation
        TestOperation(6'b110101, ALU_NOP); // No operation

        $display("Finished testing ALUControl.");
        $stop;
    end

endmodule