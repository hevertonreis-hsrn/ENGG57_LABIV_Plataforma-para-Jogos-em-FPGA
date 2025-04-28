onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Clock Principal}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/CLOCK_50
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/SW
add wave -noupdate -divider {Clock Pipeline}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst2/c0
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst3/rst_sync
add wave -noupdate -divider {IF Stage}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/rst
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/state
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/outPC
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/outInstruction
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/actualPC
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/pc_plus_4
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/nextPC_internal
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/outAddress
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/start_read
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/IF_Flush
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/HD_HoldPC
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/HD_Hold_IF_ID
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/PCSrc
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst/BranchTarget
add wave -noupdate -divider {Instruction Master}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/reset_n
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/start_read
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_address
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_read
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_waitrequest
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/i_readdata
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/ready
add wave -noupdate /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst1/state
add wave -noupdate -divider {ID Stage}
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/IF_ID_PC
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/IF_ID_Inst
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/opcode
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/r1
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/r2
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/immediate
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_MemToReg
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_RegWrite
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_MemRead
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_ALUSrc
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_ALUOp
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/branchMode
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/branchSrc
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_Branch
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_BranchTarget
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_ReadData1
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_ReadData2
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_SignExtImm
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/ID_EX_WriteReg
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/MemoryStall
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/HD_HoldControl
add wave -noupdate -divider Control
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/control_unit/ALUOp
add wave -noupdate -divider {Hazard Unit}
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst12/r1
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst12/r2
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst12/ID_EX_MemRead
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst12/ID_EX_WriteReg
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst12/HD_Hold_IF_ID
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst12/HD_HoldPC
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst12/HD_HoldControl
add wave -noupdate -divider Registradores
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/clk
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/readReg1
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/readReg2
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/readData1
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/readData2
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/RegWrite
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/writeReg
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst5/regfile/writeData
add wave -noupdate -divider {EX Stage}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_RegWrite
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_ALUSrc
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_ALUOp
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_Branch
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_BranchTarget
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_ReadData1
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_ReadData2
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_SignExtImm
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/ID_EX_WriteReg
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/EX_MEM_ALUResult
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/EX_MEM_WriteData
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst6/EX_MEM_WriteReg
add wave -noupdate -divider {Forwarding Unit}
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/ID_EX_rs1
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/ID_EX_rs2
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/EX_MEM_rd
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/MEM_WB_rd
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/EX_MEM_RegWrite
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/MEM_WB_RegWrite
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/ForwardA
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst13/ForwardB
add wave -noupdate -divider {MEM Stage}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst7/EX_MEM_RegWrite
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst7/EX_MEM_ALUResult
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst7/EX_MEM_WriteReg
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst7/MEM_WB_RegWrite
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst7/MEM_WB_ALUResult
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst7/MEM_WB_WriteReg
add wave -noupdate -divider {WB Stage}
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst11/MEM_WB_RegWrite
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst11/MEM_WB_ALUResult
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst11/MEM_WB_WriteReg
add wave -noupdate -radix binary /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst11/RegWrite
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst11/WriteReg
add wave -noupdate -radix unsigned /ModuloProcessador_tb/dut/b2v_inst/processadorcentral/b2v_inst11/WriteData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {490000 ps} 0} {{Cursor 2} {69904 ps} 0} {{Cursor 3} {770000 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1024588 ps}
