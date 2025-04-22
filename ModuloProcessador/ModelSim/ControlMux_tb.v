module ControlMux_tb;
    reg inBranchMode;
    reg inBranchSrc;
    reg inBranch;
    reg inMemRead;
    reg inMemToReg;
    reg [5:0] inALUOp;
    reg inMemWrite;
    reg inALUSrc;
    reg inRegWrite;
    reg holdControl;

    wire outBranchMode;
    wire outBranchSrc;
    wire outBranch;
    wire outMemRead;
    wire outMemToReg;
    wire [5:0] outALUOp;
    wire outMemWrite;
    wire outALUSrc;
    wire outRegWrite;

    ControlMux uut (
        .inBranchMode(inBranchMode),
        .inBranchSrc(inBranchSrc),
        .inBranch(inBranch),
        .inMemRead(inMemRead),
        .inMemToReg(inMemToReg),
        .inALUOp(inALUOp),
        .inMemWrite(inMemWrite),
        .inALUSrc(inALUSrc),
        .inRegWrite(inRegWrite),
        .holdControl(holdControl),
        .outBranchMode(outBranchMode),
        .outBranchSrc(outBranchSrc),
        .outBranch(outBranch),
        .outMemRead(outMemRead),
        .outMemToReg(outMemToReg),
        .outALUOp(outALUOp),
        .outMemWrite(outMemWrite),
        .outALUSrc(outALUSrc),
        .outRegWrite(outRegWrite)
    );

    task Test(
        input expectedBranchMode,
        input expectedBranchSrc,
        input expectedBranch,
        input expectedMemRead,
        input expectedMemToReg,
        input [5:0] expectedALUOp,
        input expectedMemWrite,
        input expectedALUSrc,
        input expectedRegWrite
    );
        reg error;
        begin
            if (expectedBranchMode !== outBranchMode) begin
                $display("Error: expected outBranchMode = %b, got %b", expectedBranchMode, outBranchMode);
                error = 1;
            end

            if (expectedBranchSrc !== outBranchSrc) begin
                $display("Error: expected outBranchSrc = %b, got %b", expectedBranchSrc, outBranchSrc);
                error = 1;
            end

            if (expectedBranch !== outBranch) begin
                $display("Error: expected outBranch = %b, got %b", expectedBranch, outBranch);
                error = 1;
            end

            if (expectedMemRead !== outMemRead) begin
                $display("Error: expected outMemRead = %b, got %b", expectedMemRead, outMemRead);
                error = 1;
            end

            if (expectedMemToReg !== outMemToReg) begin
                $display("Error: expected outMemToReg = %b, got %b", expectedMemToReg, outMemToReg);
                error = 1;
            end

            if (expectedALUOp !== outALUOp) begin
                $display("Error: expected outALUOp = %b, got %b", expectedALUOp, outALUOp);
                error = 1;
            end

            if (expectedMemWrite !== outMemWrite) begin
                $display("Error: expected outMemWrite = %b, got %b", expectedMemWrite, outMemWrite);
                error = 1;
            end

            if (expectedALUSrc !== outALUSrc) begin
                $display("Error: expected outALUSrc = %b, got %b", expectedALUSrc, outALUSrc);
                error = 1;
            end

            if (expectedRegWrite !== outRegWrite) begin
                $display("Error: expected outRegWrite = %b, got %b", expectedRegWrite, outRegWrite);
                error = 1;
            end

            if (error) begin
                $display("Test failed!");
            end else begin
                $display("Test passed!");
            end
        end
    endtask

    initial begin
        // Test case 1: holdControl = 0
        inBranchMode = 1;
        inBranchSrc = 0;
        inBranch = 1;
        inMemRead = 1;
        inMemToReg = 0;
        inALUOp = 6'b000001;
        inMemWrite = 1;
        inALUSrc = 0;
        inRegWrite = 1;
        holdControl = 0;

        #10; // Wait for the output to stabilize

        Test(
            inBranchMode,
            inBranchSrc,
            inBranch,
            inMemRead,
            inMemToReg,
            inALUOp,
            inMemWrite,
            inALUSrc,
            inRegWrite
        );

        // Test case 2: holdControl = 1
        holdControl = 1;

        #10; // Wait for the output to stabilize

        Test(
            1'b0,
            1'b0,
            1'b0,
            1'b0,
            1'b0,
            6'b010101,
            1'b0,
            1'b0,
            1'b0
        );

        $display("Finished testing ControlMux.");
        $stop;
    end

endmodule