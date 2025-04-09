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
    integer i;

    // Parâmetros das operações

    always @(*) begin
        Result = 32'b0;
        Zero = 1'b0;
        RFlags = 5'b00000;
        match = 1'b1;

        case (Operation)

            // Aritmética
            4'b0001: begin
                Result = data1 + data2;
                if ((data1[31] == data2[31]) && (Result[31] != data1[31]))
                    RFlags[6] = 1'b1; // Overflow
            end

            4'b0010: begin
                Result = data1 - data2;
                if ((data1[31] != data2[31]) && (Result[31] != data1[31]))
                    RFlags[6] = 1'b1; // Underflow
            end

            4'b0011: begin
                MUL_Result = data1 * data2;
                Result = MUL_Result[31:0];
                if ((MUL_Result > 64'sd2147483647) || (MUL_Result < -64'sd2147483648)) begin
                    RFlags[6] = 1'b1; // Overflow
                    RFlags[0] = 1'b1; // Error
                end

            end

            4'b0100: begin
                if (data2 == 0) begin
                    Result = 0;
                    RFlags[0] = 1'b1; // Error (divisão por zero) 
                end else begin
                    Result = data1 / data2;
                end
            end

            4'b0101: Result = data1;

            4'b0110: Result = data2;

            // Lógicos
            4'b0111: begin
                Result = data1 & data2;
            end

            4'b1000: begin
                Result = data1 | data2;
            end

            4'b1001: Result = data2 << data1;

            4'b1010: Result = data2 >>> data1;

            // Comparação
            4'b1011: begin
                if (data1 == data2)
                    RFlags[4] = 1'b1; // Equal
                else if (data1 > data2)
                    RFlags[5] = 1'b1; // Above
                else
                    RFlags[3] = 1'b1; // Below
            end

            4'b1100: begin
                Result = ~data2;
            end

            // Fluxo de controle
            4'b1101: begin
                Zero = 1'b1;
            end

            4'b1110: begin
                match = 1'b1;

                for (i = 0; i < 7; i = i + 1) begin
                    if (data2[i] && (RFlagsStored[i] != data2[i + 7]))
                        match = 1'b0;
                end

                if (match)
                    Zero = 1'b1;
                else
                    Zero = 1'b0;
            end

            // No Operation
            4'b1111: begin
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
