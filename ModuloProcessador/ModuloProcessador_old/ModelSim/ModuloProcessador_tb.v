`timescale 1ns/1ps

module ModuloProcessador_tb;

    // Inputs
    reg clk;
    reg rst;
    
    // Instantiate the Unit Under Test (UUT)
    ModuloProcessador uut (
        .clk(clk), 
        .rst(rst)
    );

    // Clock generation
    always #10 clk = ~clk; // Gera um clock com período de 10 unidades de tempo
    //always #2.5 clkMem = ~clkMem;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        
        // Reset ativo por alguns ciclos
        #102 rst = 0;
        
        // Executa por um determinado periodo e para
        #1000;
        
        $stop;
    end

    // Monitoramento de saidas
    always @(posedge clk) begin
        $display("Reset: %b", rst);
        $display("----------------------------------------------------");
        $display("--- IF STAGE ---------------------------------------");
        $display("IF_ID_PC: %d", uut.b2v_inst.IF_ID_PC);
        $display("IF_ID_Inst: %b", uut.b2v_inst.IF_ID_Inst);
        $display("IF_Flush: %b", uut.b2v_inst.IF_Flush);
        $display("----------------------------------------------------");
        $display("--- ID STAGE ---------------------------------------");
        $display("ID_EX_MemToReg: %b, ID_EX_RegWrite: %b", 
                uut.b2v_inst2.ID_EX_MemToReg, uut.b2v_inst2.ID_EX_RegWrite);
        $display("ID_EX_BranchTarget: %d, ID_EX_Branch: %b, ID_EX_MemRead: %b, ID_EX_MemWrite: %b",        
                uut.b2v_inst2.ID_EX_BranchTarget, uut.b2v_inst2.ID_EX_Branch,
                uut.b2v_inst2.ID_EX_MemRead, uut.b2v_inst2.ID_EX_MemWrite);
        $display("ID_EX_ReadData1: %d, ID_EX_ReadData2: %d, ID_EX_SignExtImm: %d",
                uut.b2v_inst2.ID_EX_ReadData1, uut.b2v_inst2.ID_EX_ReadData2,
                uut.b2v_inst2.ID_EX_SignExtImm);
        $display("ID_EX_ALUSrc: %b, ID_EX_ALUOp: %b", 
                uut.b2v_inst2.ID_EX_ALUSrc, uut.b2v_inst2.ID_EX_ALUOp);
        $display("r1: %b, r2: %b, ID_EX_WriteReg: %b", 
                uut.b2v_inst1.r1, uut.b2v_inst1.r2,
                uut.b2v_inst2.ID_EX_WriteReg);
        $display("----------------------------------------------------");
        $display("--- Hazard Detection -------------------------------");
        $display("HoldPC: %b, Hold_IF_ID: %b, HoldControl: %b",
                uut.b2v_inst1.HD_HoldPC, uut.b2v_inst1.HD_Hold_IF_ID,
                uut.b2v_inst1.HD_HoldControl);
        $display("----------------------------------------------------");
        $display("--- EX STAGE ---------------------------------------");
        $display("EX_MEM_MemToReg: %b, EX_MEM_RegWrite: %b, EX_MEM_MemRead: %b, EX_MEM_MemWrite: %b", 
                uut.b2v_inst3.EX_MEM_MemToReg, uut.b2v_inst3.EX_MEM_RegWrite,
                uut.b2v_inst3.EX_MEM_MemRead, uut.b2v_inst3.EX_MEM_MemWrite);
        $display("EX_MEM_ALUResult: %d, EX_MEM_WriteData: %d", 
                uut.b2v_inst3.EX_MEM_ALUResult, uut.b2v_inst3.EX_MEM_WriteData);
        $display("BranchTaken: %b, BranchTarget: %d", 
                uut.b2v_inst3.BranchTaken, uut.b2v_inst3.BranchTarget);
        $display("----------------------------------------------------");
        $display("--- Fowarding -------------------------------");
        $display("ID_EX_rs1: %b, ID_EX_rs2: %b",
                uut.b2v_inst8.ID_EX_rs1, uut.b2v_inst8.ID_EX_rs2);
        $display("EX_MEM_rd: %b, MEM_WB_rd: %b",
                uut.b2v_inst8.EX_MEM_rd, uut.b2v_inst8.MEM_WB_rd);
        $display("EX_MEM_RegWrite: %b, MEM_WB_RegWrite: %b",
                uut.b2v_inst8.EX_MEM_RegWrite, uut.b2v_inst8.MEM_WB_RegWrite);
        $display("ForwardA: %b, ForwardB: %b",
                uut.b2v_inst8.ForwardA, uut.b2v_inst8.ForwardB);
        $display("----------------------------------------------------");
        $display("--- MEM STAGE ---------------------------------------");
        $display("MEM_WB_RegWrite: %b, MEM_WB_MemToReg: %b, MEM_WB_ALUResult: %d, MEM_WB_ReadData: %d", 
                uut.b2v_inst4.MEM_WB_RegWrite, uut.b2v_inst4.MEM_WB_MemToReg,
                uut.b2v_inst4.MEM_WB_ALUResult, uut.b2v_inst4.MEM_WB_ReadData);
        $display("----------------------------------------------------");
        $display("--- WB STAGE ---------------------------------------");
        $display("RegWrite: %b, WriteData: %d, WriteReg: %b", 
                uut.b2v_inst5.RegWrite, uut.b2v_inst5.WriteData,
                uut.b2v_inst5.WriteReg);
        $display(" ");
        //$display("EntradaPilha: %d, SaidaPilha: %d, SP: %d", 
        //        uut.b2v_inst15.data_in, uut.b2v_inst15.data_out, uut.b2v_inst15.sp);
        //$display("Operation: %b, data1: %d, data2: %d", 
        //        uut.b2v_inst7.Operation, uut.b2v_inst7.data1, uut.b2v_inst7.data2);
        //$display("ALU Result: %d, Zero: %b",
        //        uut.b2v_inst7.Result, uut.b2v_inst7.Zero);
        //$display("RFlagsStored: %b, RFlagsOut: %b",
        //        uut.b2v_inst7.RFlagsStored, uut.b2v_inst7.RFlagsOut);
        //$display("MemRead: %b, MemWrite: %b, WriteData: %d, Address: %d",
        //        uut.b2v_inst9.MemRead, uut.b2v_inst9.MemWrite,
        //        uut.b2v_inst9.writeData, uut.b2v_inst9.ALUResult);
        //$display("MemData: %d", uut.b2v_inst9.readData);
        //$display("RegWrite: %b, writeData: %d, writeReg: %b",
        //        uut.b2v_inst4.RegWrite, uut.b2v_inst4.writeData, uut.b2v_inst4.writeReg);
        //$display("----------------------------------------------------");
    end
    
endmodule
