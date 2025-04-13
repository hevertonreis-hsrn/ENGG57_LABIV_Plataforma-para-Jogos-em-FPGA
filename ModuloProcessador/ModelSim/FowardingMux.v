module ForwardingMux (
    input wire [1:0] sel,         // Controle vindo da Forwarding Unit
    input wire [31:0] regData,    // Valor normal vindo do banco de registradores
    input wire [31:0] exData,     // Valor vindo de EX/MEM
    input wire [31:0] memData,    // Valor vindo de MEM/WB
    output reg [31:0] out
);

    always @(*) begin
        case (sel)
            2'b00: out = regData;  // Sem forwarding
            2'b10: out = exData;   // Forward vindo do estágio EX/MEM
            2'b01: out = memData;  // Forward vindo do estágio MEM/WB
            default: out = regData;
        endcase
    end

endmodule
