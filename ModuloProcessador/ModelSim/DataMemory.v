module DataMemory (
    input clk,
    input MemRead,
    input MemWrite,
    input wire [31:0] ALUResult,  
    input wire [31:0] writeData, 
    output reg [31:0] readData 
);

    reg [31:0] memory [0:255];
    wire [7:0] address;  
    assign address = ALUResult[7:0];

    initial begin
        memory[1] = 32'd4;
        memory[4] = 32'd7;
        memory[5] = 32'b01111111111111111111111111111111;
        memory[6] = 32'b10000000000000000000000000000000;
    end

    // Leitura da instrucao condicionada pelo sinal MemRead
    always @ (negedge clk) begin
        if(MemRead)
            readData <= memory[address];
        else if(MemWrite)
            memory[address] <= writeData;
    end

endmodule
