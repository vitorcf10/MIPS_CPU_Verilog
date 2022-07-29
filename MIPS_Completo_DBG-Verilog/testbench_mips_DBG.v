

//Simulação no ModelSim
//  IMPORTANTE:  
//  Arquivo p/ leitura de instruções memfile.dat (definido em InstructionMemory.v)
//   deve estar no diretório de simulação -->  ....\MIPS_Completo_DBG\simulation\modelsim\memfile.dat


`timescale 1ns/100ps

module testbench_mips();

  reg        clk;
  reg        reset;

    
  //  Debug only: 
  
  wire [31:0] PC_DBG;
  wire [31:0] instr_DBG;
  wire [31:0] addrdata_DBG;
  wire [31:0] readdata_DBG; 
  wire [31:0] writedata_DBG;
  wire [5:0] RF_Addr1_DBG;
  wire [5:0] RF_Addr2_DBG;
  wire [5:0] RF_Addr3_DBG;
  wire [31:0] RF_DataRead1_DBG;
  wire [31:0] RF_DataRead2_DBG;
  wire [31:0] RF_DataWrite3_DBG;
  wire [31:0] DM_Addr_DBG;
  wire [31:0] DM_DataRead_DBG;
  wire [31:0] DM_DataWrite_DBG;
  

  
  
								 
    
  // Instanciar Dispositivo a ser testado:
  MIPS_Completo_DBG dut(.clk(clk), 
								.reset(reset),
								.PC_DBG(PC_DBG),
								.instr_DBG(instr_DBG),								
								.DM_addrdata_DBG(DM_addrdata_DBG),
								.DM_readdata_DBG(DM_readdata_DBG),
								.DM_memwrite_DBG(DM_memwrite_DBG), 
								.DM_writedata_DBG(DM_writedata_DBG),						
								.RF_Addr1_DBG(RF_Addr1_DBG),
							   .RF_Addr2_DBG(RF_Addr2_DBG),
							   .RF_Addr3_DBG(RF_Addr3_DBG),
							   .RF_DataRead1_DBG(RF_DataRead1_DBG),
							   .RF_DataRead2_DBG(RF_DataRead2_DBG),
							   .RF_DataWrite3_DBG(RF_DataWrite3_DBG) );  
 
  // Inicar teste:
  
  
  initial 
  begin
	  $timeformat (-9, 2, "ns", 10); 
	  
	  reset = 1;
	  #80
	  reset= 0;
  end

  
  
  initial 
  begin
	 clk = 0;	
		
	  forever
	  begin
	    #40 clk= ~clk;
		 $display("   \nTime= %t --> clk= %b", $time, clk);
	  end
  end

	
	 
 
  // check results
  always @(instr_DBG)
    begin
		// Exibir Register File (RF) e Memória de Dados (DM):
		
		$display("\n \n");
		$display(" Time= %t \n PC= %d \n Instrucao Lida ==> %h  ", $time, PC_DBG, instr_DBG);
		#20;
		$display("   RFR A1 %d ---> RD1 %d ", RF_Addr1_DBG, RF_DataRead1_DBG);
		$display("   RFR A2 %d ---> RD2 %d ", RF_Addr2_DBG, RF_DataRead2_DBG);
		#10;
		$display("   DM A %d ---> ReadData %d ", DM_addrdata_DBG, DM_readdata_DBG);
		$display("   DM A %d <--- WriteData %d ", DM_addrdata_DBG, DM_writedata_DBG);
		#20;
		$display("   RFW A3  %d <--- WD3 %d ", RF_Addr3_DBG, RF_DataWrite3_DBG);
		
			
	
		// Verifica Resultado Final do Programa, após última instrução (PC=38):
		
      if(instr_DBG == 32'hac020054)  // última instrução do pgm teste: sw $2, 84($0) -> write mem[84] = 7
		begin
		  $display("\n \n");
		  if( (DM_addrdata_DBG == 84) && ( DM_writedata_DBG == 7) )
		  begin
          $display("******* SIMULACAO BEM SUCEDIDA - RESULTADO CORRETO!!");
        end 
		  else 
		  begin
			 $display("******* SIMULACAO FALHOU - RESULTADO ERRADO!");
		  end
		  $display("\n \n");
      end
		
	
		
		
    end
	 

	 
endmodule