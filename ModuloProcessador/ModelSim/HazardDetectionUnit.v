module HazardDetectionUnit(
    input wire [4:0] r1, // Registrador fonte
    input wire [4:0] r2, // Registrador destino 
    input wire ID_EX_MemRead,   // Sinal de leitura de memoria vinda do EX
    input wire [4:0] ID_EX_WriteReg, // Registrador de destino vindo do ID/EX register
	 input wire EX_MEM_MemRead,
	 input wire [4:0] EX_MEM_WriteReg,
    output reg HD_HoldPC,      // Nao permite atualizar o PC
    output reg HD_Hold_IF_ID, // Nao permite atualizar o IF/ID
    output reg HD_HoldControl  // Stall no controle
);

    always @(*) begin
        // Hazard: a instrução na ID depende da instrução na EX, que é um LW
        if (ID_EX_MemRead && (ID_EX_WriteReg == r1 || ID_EX_WriteReg == r2)) begin
            HD_HoldPC      = 1;
            HD_Hold_IF_ID  = 1;
            HD_HoldControl  = 1;
        end
        // Novo caso: a instrução seguinte também for um LW (ocupa MEM)
        else if (EX_MEM_MemRead && (EX_MEM_WriteReg == r1 || EX_MEM_WriteReg == r2)) begin
            HD_HoldPC      = 1;
            HD_Hold_IF_ID  = 1;
            HD_HoldControl  = 1;
        end
        else begin
            HD_HoldPC = 0; // Permite atualizar o PC
            HD_Hold_IF_ID = 0; // Permite atualizar o IF/ID
            HD_HoldControl = 0; // Permite atualizar o ID/EX
        end
    end

endmodule