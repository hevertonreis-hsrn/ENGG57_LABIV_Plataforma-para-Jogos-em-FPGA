module Return(
    input wire [7:0] PC,      // PC de 8 bits
    output reg [4:0] RAReg,   // Registrador RA (sempre 31)
    output reg [31:0] RetAdd  // Endereço de retorno estendido
);

    always @(*) begin
        RAReg = 5'b11111;  // RAReg sempre 31
        RetAdd = {{24{PC[7]}}, PC}; // Extensao de sinal correta
    end

endmodule
