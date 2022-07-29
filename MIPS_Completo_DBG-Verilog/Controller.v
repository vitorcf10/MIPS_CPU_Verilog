
// Module controller
// Estrutural: Decodificador Principal + Decodificador da ALU
// simulação: Waveform10

module Controller(input  wire [5:0] opcode,
						input  wire [5:0] funct,
                  input  wire zero,
						output wire pcsrc,
                  output wire memtoreg,
						output wire alusrc,
						output wire regdst,
						output wire regwrite,
						output wire memwrite,
                  output wire jump,
                  output wire [2:0] alucontrol);

  wire [1:0] aluop;
  wire       branch;

  MainDecoder MDecoder(.opcode(opcode), 
							  .aluop(aluop), 
							  .branch(branch), 
							  .memtoreg(memtoreg), 
							  .alusrc(alusrc), 
							  .regdst(regdst), 
							  .regwrite(regwrite), 
							  .memwrite(memwrite), 
							  .jump(jump) );
  
  
  ALUDecoder ADecoder(.funct(funct), 
							 .aluop(aluop), 
							 .alucontrol(alucontrol) ); 
	
 
    
  assign pcsrc = branch & zero;
  
endmodule