module ForwardingUnit (
    input  wire [4:0] ID_EX_rs1, ID_EX_rs2,      // Registradores fonte (EX stage)
    input  wire [4:0] EX_MEM_rd, MEM_WB_rd,      // Registradores destino (MEM e WB)
    input  wire       EX_MEM_RegWrite, MEM_WB_RegWrite,
    output reg  [1:0] ForwardB, ForwardA         // Controle de forwarding
);

    always @(*) begin
        // Default: sem forwarding
        ForwardA = 2'b00;
        ForwardB = 2'b00;

        // EX hazard - prioridade mais alta
        if (EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs1))
            ForwardA = 2'b10;
        if (EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs2))
            ForwardB = 2'b10;

        // MEM hazard
        if (MEM_WB_RegWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rs1) && !(EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs1)))
            ForwardA = 2'b01;
        if (MEM_WB_RegWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rs2) && !(EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs2)))
            ForwardB = 2'b01;
    end

endmodule
