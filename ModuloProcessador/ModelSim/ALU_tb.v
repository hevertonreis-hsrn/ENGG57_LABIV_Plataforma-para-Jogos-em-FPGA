`timescale 1ns/1ps

module ALU_tb;
    reg [3:0] Operation;
    reg [31:0] data1, data2;
    reg [6:0] RFlagsStored;
    wire [31:0] Result;
    wire [6:0] RFlagsOut;
    wire Zero;

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

    ALU uut (
        .Operation(Operation),
        .data1(data1),
        .data2(data2),
        .RFlagsStored(RFlagsStored),
        .Result(Result),
        .RFlagsOut(RFlagsOut),
        .Zero(Zero)
    );

    task OperationTest(
        input [3:0] op,
        input [31:0] a,
        input [31:0] b,
        input [6:0] flags,
        input [31:0] expected_result,
        input [6:0] expected_flags,
        input expected_zero
    );
    begin
        Operation = op;
        data1 = a;
        data2 = b;
        RFlagsStored = flags;
        #10; // wait for the operation to complete

        $display("Operation: %b, A: %d, B: %d, Flags: %b", Operation, data1, data2, flags);
        $display("Result: %d, Expected Result: %d", Result, expected_result);

        // Check the results
        if (Result !== expected_result) begin
            $display("Error: Operation: %b, A: %d, B: %d, Flags: %b", Operation, data1, data2, RFlagsStored);
            $display("Error: Expected Result: %d, Got: %d", expected_result, Result);
            $stop;
        end else begin
            $display("Success: Operation: %b, A: %d, B: %d, Flags: %b", Operation, data1, data2, RFlagsStored);
            $display("Success: Expected Result: %d, Got: %d", expected_result, Result);
        end

        if (RFlagsOut !== expected_flags) begin
            $display("Error: Operation: %b, A: %d, B: %d, Flags: %b", Operation, data1, data2, RFlagsStored);
            $display("Error: Expected Flags: %b, Got: %b", expected_flags, RFlagsOut);
            $stop;
        end else begin
            $display("Success: Expected Flags: %b, Got: %b", expected_flags, RFlagsOut);
        end

        if (Zero !== expected_zero) begin
            $display("Error: Operation: %b, A: %d, B: %d, Flags: %b", Operation, data1, data2, RFlagsStored);
            $display("Error: Expected Zero: %b, Got: %b", expected_zero, Zero);
            $stop;
        end else begin
            $display("Success: Expected Zero: %b, Got: %b", expected_zero, Zero);
        end
    end
    endtask

    reg [31:0] seed;
    integer a, b;
    integer i;
    integer expect_result;
    reg [6:0] ExpectedFlags;
    reg match;

    initial begin
        seed = 10;
        ExpectedFlags = 7'b0000_000; // No flags set
        RFlagsStored = 7'b0000_000; // No flags set
        match = 1'b0;

        // Testing ALU_ADD
        $display("Testing ALU_ADD");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed) % 1000000; // Limit the range to avoid overflow
            b = $random(seed) % 1000000; // Limit the range to avoid overflow
            ExpectedFlags = 7'b0000_000; // No flags set
            expect_result = a + b;

            OperationTest(ALU_ADD, a, b, RFlagsStored, a + b, ExpectedFlags, 1'b0); // No flags set
        end
        $display("Testing edges for ALU_ADD");
        $display("Testing: Adding the biggest number possible, to check overflow");
        a = (1 << 31) - 1;
        b = (1 << 31) - 1;
        ExpectedFlags = 7'b1000_000; // Overflow
        OperationTest(ALU_ADD, a, b, RFlagsStored, a + b, ExpectedFlags, 1'b0); // Overflow

        $display("Testing: ading two smallest negative numbers");
        a = -(1 << 31);
        b = -(1 << 31);
        ExpectedFlags = 7'b1000_000; // Overflow
        OperationTest(ALU_ADD, a, b, RFlagsStored, a + b, ExpectedFlags, 1'b0);

        $display("Testing: Adding two random negative numbers");
        a = -$urandom_range(-1, -1000000);
        b = -$urandom_range(-1, -1000000);
        ExpectedFlags = 7'b0000_000; // No flags set
        OperationTest(ALU_ADD, a, b, RFlagsStored, a + b, ExpectedFlags, 1'b0); // No flags set

        // Testing ALU_SUB
        $display("Testing ALU_SUB");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed) % 1000000; // Limit the range to avoid overflow
            b = $random(seed) % 1000000; // Limit the range to avoid overflow
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_SUB, a, b, RFlagsStored, a - b, ExpectedFlags, 1'b0); // No flags set
        end
        $display("Testing edges for ALU_SUB");
        $display("Testing: Subtracting the biggest number possible");
        a = 0;
        b = (1 << 31) - 1;
        ExpectedFlags = 7'b0000_000; // No flags set
        OperationTest(ALU_SUB, a, b, RFlagsStored, a - b, ExpectedFlags, 1'b0); // No flags set

        $display("Testing ALU_MUL");
        for (i = 0; i < 10; i = i + 1) begin
            a = i; // Limit the range to avoid overflow
            b = i + 10; // Limit the range to avoid overflow

            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_MUL, a, b, RFlagsStored, a * b, ExpectedFlags, 1'b0); // No flags set
        end
        $display("Testing edges for ALU_MUL");
        $display("Testing: Multiplying the biggest number possible, to check overflow");
        a = (1 << 31) - 1;
        b = (1 << 31) - 1;
        ExpectedFlags = 7'b1000_001; // Overflow
        OperationTest(ALU_MUL, a, b, RFlagsStored, a * b, ExpectedFlags, 1'b0); // Overflow


        $display("Testing ALU_DIV");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_DIV, a, b, RFlagsStored, a / b, ExpectedFlags, 1'b0); // No flags set
        end
        $display("Testing edges for ALU_DIV");
        $display("Testing: Dividing by zero, to check error flag");
        a = (1 << 31) - 1;
        b = 0;
        ExpectedFlags = 7'b0000_001; // Error
        OperationTest(ALU_DIV, a, b, RFlagsStored, 0, ExpectedFlags, 1'b0); // Error

        $display("Testing: Dividing the biggest number possible, to check overflow");
        a = 1;
        b = (1 << 31) - 1;
        ExpectedFlags = 7'b0000_000; // No flags set
        OperationTest(ALU_DIV, a, b, RFlagsStored, a / b, ExpectedFlags, 1'b0); // No flags set

        $display("Testing ALU_MOV");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_MOV, a, b, RFlagsStored, a, ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_SLW");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_SLW, a, b, RFlagsStored, b, ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_AND");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_AND, a, b, RFlagsStored, a & b, ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_OR");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_OR, a, b, RFlagsStored, a | b, ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_SHL");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_SHL, a, b, RFlagsStored, b << $unsigned(a), ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_SHR");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_SHR, a, b, RFlagsStored, b >>> $unsigned(a), ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_CMP");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            if (a == b) ExpectedFlags[4] = 1'b1; // Equal
            else if (a > b) ExpectedFlags[5] = 1'b1; // Above
            else ExpectedFlags[3] = 1'b1; // Below
            OperationTest(ALU_CMP, a, b, RFlagsStored, 0, ExpectedFlags, 1'b0); // No flags set
        end
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = a;
            ExpectedFlags = 7'b0010_000; // No flags set
            OperationTest(ALU_CMP, a, b, RFlagsStored, 0, ExpectedFlags, 1'b0); // No flags set
        end
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = -a;
            ExpectedFlags = 7'b0000_000; // No flags set
            if (a > b) ExpectedFlags[5] = 1'b1; // Above
            else if (a < b) ExpectedFlags[3] = 1'b1; // Below
            OperationTest(ALU_CMP, a, b, RFlagsStored, 0, ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_NOT");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_NOT, a, b, RFlagsStored, ~b, ExpectedFlags, 1'b0); // No flags set
        end

        $display("Testing ALU_JMP");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            OperationTest(ALU_JMP, a, b, RFlagsStored, 0, ExpectedFlags, 1'b1); // No flags set
        end

        $display("Testing ALU_BFJ");
        for (i = 0; i < 10; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            ExpectedFlags = 7'b0000_000; // No flags set
            match = 1'b1;

            if (b[0] && (RFlagsStored[0] != b[7]))
                match = 1'b0;
            else if (b[1] && (RFlagsStored[1] != b[8]))
                match = 1'b0;
            else if (b[2] && (RFlagsStored[2] != b[9]))
                match = 1'b0;
            else if (b[3] && (RFlagsStored[3] != b[10]))
                match = 1'b0;
            else if (b[4] && (RFlagsStored[4] != b[11]))
                match = 1'b0;
            else if (b[5] && (RFlagsStored[5] != b[12]))
                match = 1'b0;
            else if (b[6] && (RFlagsStored[6] != b[13]))
                match = 1'b0;

            OperationTest(ALU_BFJ, a, b, RFlagsStored, 0, ExpectedFlags, match); // No flags set
        end

        $display("Testing ALU_NOP");
        a = $random(seed);
        b = $random(seed);
        ExpectedFlags = 7'b0000_000; // No flags set
        OperationTest(ALU_NOP, a, b, RFlagsStored, 0, ExpectedFlags, 1'b1); // No flags set

        $display("Finished testing ALU");
        $stop;
    end


endmodule