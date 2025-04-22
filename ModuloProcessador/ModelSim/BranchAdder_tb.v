module BranchAdder_tb;
    reg [7:0] PC;
    reg [31:0] signExtImm;
    wire [7:0] addResult;

    BranchAdder uut (
        .PC(PC),
        .signExtImm(signExtImm),
        .addResult(addResult)
    );

    task Validate(input [7:0] PC_input, input [31:0] signExtImm_input);
        begin
            PC = PC_input;
            signExtImm = signExtImm_input;

            #10; // Wait for the addition to be computed
            if (addResult !== (PC + signExtImm_input[7:0])) begin
                $display("Test failed for PC: %b, signExtImm: %b, expected: %b, got: %b", PC, signExtImm, (PC + signExtImm_input[7:0]), addResult);
            end else begin
                $display("Test passed for PC: %b, signExtImm: %b, result: %b", PC, signExtImm, addResult);
            end
        end
    endtask

    integer i;
    reg [31:0] seed;
    initial begin
        seed = 5;
        for (i = 0; i < 256; i = i + 1) begin
            Validate($random(seed), $random(seed));
        end

        $display("Finished testing BranchAdder.");
        $stop;
    end

endmodule