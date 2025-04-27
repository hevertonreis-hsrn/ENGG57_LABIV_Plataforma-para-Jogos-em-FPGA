module ALU(
    input wire [3:0] Operation,
    input wire signed [31:0] data1, data2,
    input wire [6:0] RFlagsStored, // Flags armazenadas
    output reg Zero,
    output reg signed [31:0] Result,
    output reg [6:0] RFlagsOut // Apenas gera flags
);
    reg signed [63:0] MUL_Result;
    reg [6:0] RFlags; // [overflow, above, equal, below, between, collision, error] 
                      // [6       ,5     ,4     ,3     ,2       ,1         ,0     ]
    reg match;

    // Parâmetros das operações
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

    always @(*) begin
        Result = 32'b0;
        Zero = 1'b0;
        RFlags = 5'b00000;
        match = 1'b1;
		MUL_Result = 64'b0;

        case (Operation)

            // Aritmética
            ALU_ADD: begin
                Result = data1 + data2;
                if ((data1[31] == data2[31]) && (Result[31] != data1[31]))
                    RFlags[6] = 1'b1; // Overflow
            end

            ALU_SUB: begin
                Result = data1 - data2;
                if ((data1[31] != data2[31]) && (Result[31] != data1[31]))
                    RFlags[6] = 1'b1; // Underflow
            end

            ALU_MUL: begin
                MUL_Result = data1 * data2;
                Result = MUL_Result[31:0];
                if ((MUL_Result > 64'sd2147483647) || (MUL_Result < -64'sd2147483648)) begin
                    RFlags[6] = 1'b1; // Overflow
                end

            end

            ALU_DIV: begin
                if (data2 == 0) begin
                    Result = 0;
                    RFlags[0] = 1'b1; // Error (divisão por zero) 
                end else begin
                    Result = data1 / data2;
                end
            end

            ALU_MOV: Result = data1;

            ALU_SLW: Result = data2;

            // Lógicos
            ALU_AND: begin
                Result = data1 & data2;
            end

            ALU_OR: begin
                Result = data1 | data2;
            end

            ALU_SHL: Result = data2 << $unsigned(data1);

			ALU_SHR: Result = data2 >>> $unsigned(data1);

            // Comparação
            ALU_CMP: begin
                if (data1 == data2)
                    RFlags[4] = 1'b1; // Equal
                else if (data1 > data2)
                    RFlags[5] = 1'b1; // Above
                else
                    RFlags[3] = 1'b1; // Below
            end

            ALU_NOT: begin
                Result = ~data2;
            end

            // Fluxo de controle
            ALU_JMP: begin
                Zero = 1'b1;
            end

            ALU_BFJ: begin
				match = 1'b1;

				if (data2[0] && (RFlagsStored[0] != data2[7]))
				    match = 1'b0;
				if (data2[1] && (RFlagsStored[1] != data2[8]))
					match = 1'b0;
				if (data2[2] && (RFlagsStored[2] != data2[9]))
					match = 1'b0;
				if (data2[3] && (RFlagsStored[3] != data2[10]))
					match = 1'b0;
				if (data2[4] && (RFlagsStored[4] != data2[11]))
					match = 1'b0;
				if (data2[5] && (RFlagsStored[5] != data2[12]))
					match = 1'b0;
				if (data2[6] && (RFlagsStored[6] != data2[13]))
					match = 1'b0;

				Zero = match;
			end


            // No Operation
            ALU_NOP: begin
                Result = 0;
                Zero = 1;
            end

            default: begin
                Result = 0;
                Zero = 1;
                RFlags[0] = 1; // Marca erro para instrução inválida
            end
        endcase
		  
		RFlagsOut = RFlags;

    end
endmodule
