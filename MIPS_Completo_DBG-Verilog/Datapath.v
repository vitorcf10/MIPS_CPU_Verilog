
// Module Datapath (Modulo Estrutural)
//  Datapath
//
// Simulação PC: Waverform11
// Teste PC Default: pcsrc=0; jump=0
// Teste PC Jump: jump=1, intr= ....00000100 (jump p/ posição 4 instruções / endereço= byte 16)
// Teste PC Branch: pcsrc=1; jump=0, intr= ....0000111 (branch p/ posição (PC + 4) + 7 instruções / (PC + 4) + 28 bytes)




module Datapath(input  wire clk,
					 input  wire reset,
					 input  wire [31:0] instr,
					 input  wire [31:0] readdata,
					 input  wire memtoreg,
					 input  wire pcsrc, 
					 input  wire alusrc,
					 input  wire regdst,
                input  wire regwrite,
					 input  wire jump,            
					 input  wire [2:0] alucontrol,
                output wire [31:0] PC,
                output wire [31:0] aluResult, 
					 output wire [31:0] writedata,
					 output wire zero,
					 output wire [5:0] RF_Addr1_DBG,
				    output wire [5:0] RF_Addr2_DBG,
				    output wire [5:0] RF_Addr3_DBG,
				    output wire [31:0] RF_DataRead1_DBG,
				    output wire [31:0] RF_DataRead2_DBG,
				    output wire [31:0] RF_DataWrite3_DBG);

					 
					 
  wire [4:0]  writereg;
  wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
  wire [31:0] signimm, signimmsh;
  wire [31:0] srca, srcb;
  wire [31:0] result;
  
  
  

  // Cálculo do valor do PC considerando instruções "padrão", branch e jump,
  //  e MUX referente ao controle do PC
  
  RegisterFF #(32) pcreg(clk, reset, pcnext, PC);  // Cria registrardor p/ PC
  
 
  Adder add_pc_default(PC, 32'b100, pcplus4);  // PC= PC + 4
 
  
  SignExtension se_immediate(instr[15:0], signimm);   // Extensão de sinal de valor imediato 
  
  
  ShiftLeft2 immsh(signimm, signimmsh);  // shift-left-2 valor imediato de instrução branch
  
  
  Adder add_pc_branch(pcplus4, signimmsh, pcbranch); // novo valor de PC p/ instrução branch
  
  
   
  MUX2 #(32) mux_pc_branch(pcplus4, 
									pcbranch, 
									pcsrc, 
									pcnextbr); // MUX: PC default OU PC branch
 
  MUX2 #(32) mux_pc_jump(pcnextbr, 
								 {pcplus4[31:28], instr[25:0], 2'b00},
								 jump, 
								 pcnext);   // MUX: Saida de mux_pc_branch OU PC jump


 
  // Arquivo de Registradores Visíveis da CPU MIPS:
  
      
  RegisterFile   RF(clk, regwrite, instr[25:21], instr[20:16], 
                 writereg, result, srca, writedata);
					  
					  
  MUX2 #(5) mux_write_address(instr[20:16],
				 					   instr[15:11],
										regdst, 
										writereg);    // MUX: endereço do registrador p/  operação de escrita no RF, de acordo c/ a instrução
						  
  MUX2 #(32) mux_write_data(aluResult,
									 readdata, 
									 memtoreg,
									 result);       // MUX: fonte dos dados p/  operação de escrita no RF, de acordo c/ a instrução
						  
 
 
 

 
 
 // ALU: Unidade Lógica e Aritmética do Datapath:
 
 MUX2 #(32) mux_alu_src(writedata,
								 signimm,
								 alusrc,
								 srcb);
 
 ALU alu_mips(srca, srcb, alucontrol, aluResult, zero);
 
 
 //  Debug only: 
assign RF_Addr1_DBG = instr[25:21];
assign RF_Addr2_DBG = instr[20:16];
assign RF_Addr3_DBG = writereg; 
assign RF_DataRead1_DBG= srca;
assign RF_DataRead2_DBG= writedata;
assign RF_DataWrite3_DBG= result;

 
endmodule
