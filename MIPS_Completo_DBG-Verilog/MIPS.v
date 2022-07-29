// MIPS.v
// Código modificado, a partir de:
//   Section 7.6 of Digital Design & Computer Architecture - David Harris, Sarah Harris


// Module MIPS (Modulo Estrutural)
//  Controle + Datapath

module MIPS(input  wire clk,
				input  wire reset,
				input  wire [31:0] instr,
				input  wire [31:0] readdata,
            output wire [31:0] PC,
				output wire memwrite,
				output wire [31:0] aluResult,
				output wire [31:0] writedata,
				output wire [5:0] RF_Addr1_DBG,
				output wire [5:0] RF_Addr2_DBG,
				output wire [5:0] RF_Addr3_DBG,
				output wire [31:0] RF_DataRead1_DBG,
				output wire [31:0] RF_DataRead2_DBG,
				output wire [31:0] RF_DataWrite3_DBG);

			

  wire [2:0] alucontrol;
  wire memtoreg;
  wire alusrc;
  wire regdst;
  wire regwrite; 
  wire jump;
  wire pcsrc;
  wire zero;
  
 
  
  
  
  Controller ControlUnit_mips(.opcode(instr[31:26]), 
								      .funct(instr[5:0]), 
										.zero(zero), 
										.pcsrc(pcsrc), 
										.memtoreg(memtoreg), 
										.alusrc(alusrc), 
										.regdst(regdst), 
										.regwrite(regwrite), 
										.memwrite(memwrite), 
										.jump(jump), 
										.alucontrol(alucontrol) );
  
 
 
 
	
	
  Datapath Datapath_mips(clk,
								 reset, 
								 instr,
								 readdata,
								 memtoreg,
								 pcsrc,	  
								 alusrc,
								 regdst,
								 regwrite,
								 jump,
								 alucontrol,
								 PC,
								 aluResult,
								 writedata, 
								 zero,
								 RF_Addr1_DBG,
							    RF_Addr2_DBG,
							    RF_Addr3_DBG,
							    RF_DataRead1_DBG,
							    RF_DataRead2_DBG,
							    RF_DataWrite3_DBG);
	
	
endmodule

