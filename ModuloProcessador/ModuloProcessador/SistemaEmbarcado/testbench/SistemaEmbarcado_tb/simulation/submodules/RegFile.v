module RegFile (
    input wire clk,                 // Clock
    input wire rst,                 // Reset
    input wire [4:0] readReg1,      // Endereco do primeiro registrador para leitura
    input wire [4:0] readReg2,      // Endereco do segundo registrador para leitura
    input wire [4:0] writeReg,      // Endereco do registrador para escrita
    input wire [31:0] writeData,    // Dados a serem escritos
    input wire RegWrite,            // Controle de habilitacao de escrita
    output wire [31:0] readData1,   // Dados lidos do primeiro registrador
    output wire [31:0] readData2    // Dados lidos do segundo registrador
);

    reg [31:0] registers [31:0];

    assign readData1 = (readReg1 == 5'd0) ? 32'd0 :
                        (readReg1 == 5'd1) ? 32'd1 : registers[readReg1];

    assign readData2 = (readReg2 == 5'd0) ? 32'd0 :
                        (readReg2 == 5'd1) ? 32'd1 : registers[readReg2];


    always @(posedge clk) begin
        if (rst) begin
            registers[0] <= 32'd0;
            registers[1] <= 32'd1;
            registers[2] <= 32'b0;
            registers[3] <= 32'b0;
            registers[4] <= 32'b0;
            registers[5] <= 32'b0;
            registers[6] <= 32'b0;
            registers[7] <= 32'b0;
            registers[8] <= 32'b0;
            registers[9] <= 32'b0;
            registers[10] <= 32'b0;
            registers[11] <= 32'b0;
            registers[12] <= 32'b0;
            registers[13] <= 32'b0;
            registers[14] <= 32'b0;
            registers[15] <= 32'b0;
            registers[16] <= 32'b0;
            registers[17] <= 32'b0;
            registers[18] <= 32'b0;
            registers[19] <= 32'b0;
            registers[20] <= 32'b0;
            registers[21] <= 32'b0;
            registers[22] <= 32'b0;
            registers[23] <= 32'b0;
            registers[24] <= 32'b0;
            registers[25] <= 32'b0;
            registers[26] <= 32'b0;
            registers[27] <= 32'b0;
            registers[28] <= 32'b0;
            registers[29] <= 32'b0;
            registers[30] <= 32'b0;
            registers[31] <= 32'b0;
        
        end else if (RegWrite && writeReg != 5'b00000 && writeReg != 5'b00001)
            registers[writeReg] <= writeData;
    end

endmodule
