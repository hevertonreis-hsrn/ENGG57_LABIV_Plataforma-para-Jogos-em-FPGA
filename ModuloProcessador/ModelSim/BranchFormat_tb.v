module BranchFormat_tb;

    reg [7:0] PC;
    reg BranchMode;
    reg [31:0] RegValue;
    reg [31:0] ImmExt;
    wire [7:0] BranchTarget;

    BranchFormat uut (
        .PC(PC),
        .BranchMode(BranchMode),
        .RegValue(RegValue),
        .ImmExt(ImmExt),
        .BranchTarget(BranchTarget)
    );

    task Test(input [7:0] pc, input [31:0] regValue, input [31:0] immExt, input branchMode);
        reg [31:0] address;
        begin
            PC = pc;
            RegValue = regValue;
            ImmExt = immExt;
            BranchMode = branchMode;
            #10; // Wait for the output to stabilize
            $display("PC: %h, RegValue: %h, ImmExt: %h, BranchMode: %b, BranchTarget: %h", PC, RegValue, ImmExt, BranchMode, BranchTarget);

            if (BranchMode) begin
                if (BranchTarget !== RegValue[7:0]) begin
                    $display("Test failed for BranchMode. Expected: %h, Got: %h", RegValue[7:0], BranchTarget);
                    $stop;
                end else begin
                    $display("Test passed for BranchMode.");
                end
            end else begin
                address = PC + ImmExt;
                if (BranchTarget !== address[7:0]) begin
                    $display("Test failed for PC + ImmExt. Expected: %h, Got: %h", address[7:0], BranchTarget);
                    $stop;
                end else begin
                    $display("Test passed for PC + ImmExt.");
                end
            end
        end

    endtask

    integer i;
    reg [31:0] seed;
    initial begin
        seed = 32'h12345678; // Initialize seed for random number generation

        for (i = 0; i < 10; i = i + 1) begin
            Test($random(seed), $random(seed), $random(seed), 1'b0); // Test with PC + ImmExt
            Test($random(seed), $random(seed), $random(seed), 1'b1); // Test with BranchMode
        end

        $display("Finished testing BranchFormat.");
        $stop; // Stop the simulation
    end

endmodule