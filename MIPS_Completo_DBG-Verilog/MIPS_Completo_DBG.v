
// Module MIPS_Completo_DBG (Modulo Estrutural)
//  CPU MIPS + memória de instruções + memória de dados.
//   * Usado em testbenchs como dut.


//Simulação no Quartus: Waverform.vwf  
//  Arquivo p/ leitura de instruções memfile.dat (definido em InstructionMemory.v)
//   deve estar no diretório corrente --> ...\MIPS_Completo_DBG\memfile.dat




module MIPS_Completo_DBG(input  wire clk, 
								 input  wire reset,
								 output wire [31:0] PC_DBG,
								 output wire [31:0] instr_DBG,
								 output wire [31:0] DM_addrdata_DBG,
								 output wire [31:0] DM_readdata_DBG, 
								 output wire 		  DM_memwrite_DBG, 
								 output wire [31:0] DM_writedata_DBG,
								 output wire [5:0] RF_Addr1_DBG,
								 output wire [5:0] RF_Addr2_DBG,
				             output wire [5:0] RF_Addr3_DBG,
				             output wire [31:0] RF_DataRead1_DBG,
				             output wire [31:0] RF_DataRead2_DBG,
				             output wire [31:0] RF_DataWrite3_DBG );
								 


  
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
							writedata,
						   RF_Addr1_DBG,
							RF_Addr2_DBG,
							RF_Addr3_DBG,
							RF_DataRead1_DBG,
							RF_DataRead2_DBG,
							RF_DataWrite3_DBG	);
							
						
  
InstructionMemory inst_mem(PC[7:2],
								   instr);

									

DataMemory data_mem(clk,
						  memwrite, 
						  addrdata,			  
						  writedata, 
						  readdata);		


//  Debug only: 

assign PC_DBG = PC; 
assign instr_DBG = instr; 
assign DM_addrdata_DBG = addrdata;
assign DM_readdata_DBG = readdata;
assign DM_memwrite_DBG = memwrite;
assign DM_writedata_DBG = writedata;

							 



endmodule