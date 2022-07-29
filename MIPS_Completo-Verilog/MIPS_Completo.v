
// Module top_mips_computer (Modulo Estrutural)
//  CPU MIPS + memória de instruções + memória de dados.
//   * Usado em testbenchs como dut.


//Simulação no Quartus: Waverform.vwf  
//  Arquivo p/ leitura de instruções memfile.dat (definido em InstructionMemory.v)
//   deve estar no diretório corrente --> ...\MIPS_Completo_DBG\memfile.dat






module MIPS_Completo(input  wire clk, 
							input  wire reset);


  wire [31:0] PC;
  wire [31:0] instr;
  wire [31:0] addrdata; 
  wire [31:0] readdata;
  wire memwrite;
  wire [31:0] writedata; 
 
  
  // instanciar processador e memórias: 
  
    
  MIPS mips_computer(clk,
							reset,
							instr,
							readdata,
							PC,
							memwrite,
							addrdata,
							writedata );
							
						
  
InstructionMemory inst_mem(PC[7:2],
								   instr);

									

DataMemory data_mem(clk,
						  memwrite, 
						  addrdata,			  
						  writedata, 
						  readdata);		





endmodule