module MEM_WB_Register (
    input wire clk,
    input wire rst,
    input wire inMemToReg,
	 input wire inRegWrite,
	 input wire [31:0] inReadData,
	 input wire [31:0] inALUResult,
	 input wire [4:0] inWriteReg,
	 output reg outRegWrite,
	 output reg outMemToReg,
	 output reg [31:0] outALUResult,
	 output reg [31:0] outReadData,
	 output reg [4:0] outWriteReg
);

    always @(posedge clk) begin
        if (rst) begin
            outMemToReg  <= 1'b0;
				outRegWrite  <= 1'b0;
				outReadData  <= 32'b0;
				outALUResult <= 32'b0;
				outWriteReg <= 5'b0;
        end else begin
            outMemToReg  <= inMemToReg;
				outRegWrite  <= inRegWrite;
				outReadData  <= inReadData;
				outALUResult <= inALUResult;
				outWriteReg <= inWriteReg;
        end
    end
endmodule
