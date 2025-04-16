module ForwardingUnit (
    input  wire [4:0] ID_EX_rs1, ID_EX_rs2,      // Registradores fonte (EX stage)
    input  wire [4:0] EX_MEM_rd, MEM_WB_rd,      // Registradores destino (MEM e WB)
    input  wire       EX_MEM_RegWrite, MEM_WB_RegWrite,
    output reg  [1:0] ForwardB, ForwardA         // Controle de forwarding
);

    always @(ID_EX_rs1, EX_MEM_rd, EX_MEM_RegWrite, MEM_WB_RegWrite, MEM_WB_rd) begin        

        if (EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs1))
            ForwardA = 2'b10; // Forward from EX stage
        else if (MEM_WB_RegWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rs1))
            ForwardA = 2'b01; // Forward from MEM stage
        else
            ForwardA = 2'b00; // No forwarding
    end

    always @(ID_EX_rs2, EX_MEM_rd, EX_MEM_RegWrite, MEM_WB_RegWrite, MEM_WB_rd) begin

        if (EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs2))
            ForwardB = 2'b10; // Forward from EX stage
        else if (MEM_WB_RegWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rs2))
            ForwardB = 2'b01; // Forward from MEM stage
        else 
            ForwardB = 2'b00; // No forwarding
    end

endmodule
