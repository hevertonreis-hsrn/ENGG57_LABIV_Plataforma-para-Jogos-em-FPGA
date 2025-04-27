module MEM_STAGE(
    input wire clk,
    input wire rst,
	 input wire EX_MEM_MemToReg,
	 input wire EX_MEM_RegWrite,
	 input wire EX_MEM_MemRead,
    input wire EX_MEM_MemWrite,    
    
    input wire [31:0] EX_MEM_ALUResult,
    input wire [31:0] EX_MEM_WriteData,
    input wire [4:0] EX_MEM_WriteReg,
    input wire [31:0] read_data,
    input wire ready,  

    output wire MEM_WB_MemToReg,
    output wire MEM_WB_RegWrite,
    output wire [31:0] MEM_WB_ALUResult,
    output wire [31:0] MEM_WB_ReadData,
    output wire [4:0] MEM_WB_WriteReg,
	 
	 output wire [31:0] outAddress,
	 output wire [31:0] outWriteData,
	 output reg MemRead,
	 output reg MemWrite,
	 output reg start_access
);

// Sinais internos
reg pending_access;

// Passa endereço e dados para interface
assign outAddress = EX_MEM_ALUResult;
assign outWriteData = EX_MEM_WriteData;

// Controle de memória (sem alterar MEM_WB_ReadData aqui)
always @(posedge clk or posedge rst) begin
    if (rst) begin
        start_access    <= 1'b0;
        pending_access  <= 1'b0;
        MemRead         <= 1'b0;
        MemWrite        <= 1'b0;
    end else begin
        start_access <= 1'b0;

        if (!pending_access) begin
            if (EX_MEM_MemRead || EX_MEM_MemWrite) begin
                start_access   <= 1'b1;
                pending_access <= 1'b1;
                MemRead        <= EX_MEM_MemRead;
                MemWrite       <= EX_MEM_MemWrite;
            end
        end else begin
            if (ready) begin
                pending_access <= 1'b0;
                MemRead        <= 1'b0;
                MemWrite       <= 1'b0;
            end
        end
    end
end

// Instancia MEM_WB_Register, conectando o dado lido diretamente ao registrador
MEM_WB_Register mem_wb_register(
    .clk(clk),
    .rst(rst),
    .inMemToReg(EX_MEM_MemToReg),
    .inRegWrite(EX_MEM_RegWrite),
    .inALUResult(EX_MEM_ALUResult),
    .inReadData(read_data),  // <-- passa diretamente o dado vindo da memória
    .inWriteReg(EX_MEM_WriteReg),
    .outRegWrite(MEM_WB_RegWrite),
    .outMemToReg(MEM_WB_MemToReg),
    .outALUResult(MEM_WB_ALUResult),
    .outReadData(MEM_WB_ReadData),
    .outWriteReg(MEM_WB_WriteReg)
);

endmodule

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

