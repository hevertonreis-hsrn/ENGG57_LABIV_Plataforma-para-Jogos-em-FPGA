module ModuloProcessador_tb;

    // Inputs
    reg clk;
    reg clkMem;
    reg rst;
    
    // Instantiate the Unit Under Test (UUT)
    ModuloProcessador uut (
        .clk(clk), 
        .rst(rst),
        .clk_Mem(clkMem)
    );

    // Clock generation
    always #5 clk = ~clk; // Gera um clock com período de 10 unidades de tempo
    always #2.5 clkMem = ~clkMem;

    initial begin
        // Initialize Inputs
        clk = 0;
        clkMem = 0;
        rst = 1;
        
        // Reset ativo por alguns ciclos
        #20 rst = 0;
        
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
        $display("----------------------------------------------------");
        $display("--- ID STAGE ---------------------------------------");
        //$display("OPCode: %b, R1: %b, R2: %b, Imediato: %d", 
        //        uut.b2v_inst2.b2v_inst1.opcode, uut.b2v_inst2.b2v_inst1.r1,
        //        uut.b2v_inst2.b2v_inst1.r2, uut.b2v_inst2.b2v_inst1.immediate);
        //$display("ALUOp: %b, Branch: %b, BranchMode: %b, MemRead: %b, MemToReg: %b, MemWrite: %b, ALUSrc: %b, RegWrite: %b, BranchSrc: %b, Push: %b, Pop: %b, IF_Flush: %b", 
        //        uut.b2v_inst2.b2v_inst.ALUOp, uut.b2v_inst2.b2v_inst.Branch, 
        //        uut.b2v_inst2.b2v_inst.BranchMode, uut.b2v_inst2.b2v_inst.MemRead, 
        //        uut.b2v_inst2.b2v_inst.MemToReg, uut.b2v_inst2.b2v_inst.MemWrite, 
        //        uut.b2v_inst2.b2v_inst.ALUSrc, uut.b2v_inst2.b2v_inst.RegWrite,
        //        uut.b2v_inst2.b2v_inst.BranchSrc, uut.b2v_inst2.b2v_inst.StackPush,
        //        uut.b2v_inst2.b2v_inst.StackPop, uut.b2v_inst2.b2v_inst.IF_Flush);
        //$display("readData1: %d, readData2: %d", 
        //        uut.b2v_inst2.b2v_inst2.readData1, uut.b2v_inst2.b2v_inst2.readData2);
        $display("ID_EX_MemToReg: %b, ID_EX_RegWrite: %b", 
                uut.b2v_inst2.ID_EX_MemToReg, uut.b2v_inst2.ID_EX_RegWrite);
        $display("ID_EX_BranchTarget: %d, ID_EX_Branch: %b, ID_EX_MemRead: %b, ID_EX_MemWrite: %b",        
                uut.b2v_inst2.ID_EX_BranchTarget, uut.b2v_inst2.ID_EX_Branch,
                uut.b2v_inst2.ID_EX_MemRead, uut.b2v_inst2.ID_EX_MemWrite);
        $display("ID_EX_ReadData1: %d, ID_EX_ReadData2: %d, ID_EX_SignExtImm: %d",
                uut.b2v_inst2.ID_EX_ReadData1, uut.b2v_inst2.ID_EX_ReadData2,
                uut.b2v_inst2.ID_EX_SignExtImm);
        $display("ID_EX_ALUSrc: %b, ID_EX_ALUOp: %b, IF_Flush: %b", 
                uut.b2v_inst2.ID_EX_ALUSrc, uut.b2v_inst2.ID_EX_ALUOp,
                uut.b2v_inst2.IF_Flush);
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
        $display("--- MEM STAGE ---------------------------------------");
        $display("MEM_WB_RegWrite: %b, MEM_WB_MemToReg: %b, MEM_WB_ALUResult: %d, MEM_WB_ReadData: %d", 
                uut.b2v_inst4.MEM_WB_RegWrite, uut.b2v_inst4.MEM_WB_MemToReg,
                uut.b2v_inst4.MEM_WB_ALUResult, uut.b2v_inst4.MEM_WB_ReadData);
        $display("----------------------------------------------------");
        $display("--- WB STAGE ---------------------------------------");
        $display("RegWrite: %b, WriteData: %d", 
                uut.b2v_inst5.RegWrite, uut.b2v_inst5.WriteData);
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
