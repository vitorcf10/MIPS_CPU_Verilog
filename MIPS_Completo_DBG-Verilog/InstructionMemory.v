
// Module DataMemory 
//  Memória de Instruções
//
// Obs: Esta implementação funciona como uma ROM, carregando o programa no início da simulação
//      Em uma implementação mais realista, deve ser substituída por uma memória similar à de dados.
//
// *teste: Waveform2

module InstructionMemory(input  wire [5:0]  mi_address,
							    output wire [31:0] mir_data);

  reg [31:0] ROM[63:0];   // IMPORTANTE: Endereçamento word/word (32 bits)


  // Simulação Apenas: Carregamento de instruções do programa:
  
  /*
  initial
  begin
	 ROM[0] = 32'h20020005;    //  main: addi $2, $0, 5 # initialize $2 = 5 
	 ROM[1] = 32'h2003000c;    //  addi $3, $0, 12 # initialize $3 = 12 
	 ROM[2] = 32'h2067fff7;    //  addi $7, $3, −9 # initialize $7 = 3 
	 ROM[3] = 32'h00e22025;    //  or $4, $7, $2 # $4 = (3 OR 5) = 7 
	 ROM[4] = 32'h00642824;    //  and $5, $3, $4 # $5 = (12 AND 7) = 4
	 ROM[5] = 32'h00a42820;    //  add $5, $5, $4 # $5 = 4 + 7 = 11
	 ROM[6] = 32'h10a7000a;    //  beq $5, $7, end # shouldn't be taken
	 ROM[7] = 32'h0064202a;    //  slt $4, $3, $4 # $4 = 12 < 7 = 0
	 ROM[8] = 32'h10800001;    //  beq $4, $0, around # should be taken
	 ROM[9] = 32'h20050000;    //  addi $5, $0, 0 # shouldn’t happen
	 ROM[10] = 32'h00e2202a;    // around: slt $4, $7, $2 # $4 = 3 < 5 = 1
	 ROM[11] = 32'h00853820;    // add $7, $4, $5 # $7 = 1 + 11 = 12
	 ROM[12] = 32'h00e23822;    // sub $7, $7, $2 # $7 = 12 − 5 = 7
	 ROM[13] = 32'hac670044;    // sw $7, 68($3) # [80] = 7
	 ROM[14] = 32'h8c020050;    // lw $2, 80($0) # $2 = [80] = 7
	 ROM[15] = 32'h08000011;    // j end # should be taken 
	 ROM[16] = 32'h20020001;    // addi $2, $0, 1 # shouldn't happen
	 ROM[17] = 32'hac020054;    // sw $2, 84($0) # write mem[84] = 7
  end
  */
  
   
    
	// Simulação Apenas: Carregamento de instruções do programa: 
  
   initial
	begin
	  $display("Carregando Instrucoes p/ InsMem ==> ROM");
	  
     $readmemh("memfile.dat",ROM);  // Carrega programa teste p/ memória ROM
	  
			$display("Instruction Memory %h", ROM[0]); 
			$display("Instruction Memory %h", ROM[1]); 
			$display("Instruction Memory %h", ROM[2]); 
			$display("Instruction Memory %h", ROM[3]); 
			$display("Instruction Memory %h", ROM[4]); 
			$display("Instruction Memory %h", ROM[5]); 
			$display("Instruction Memory %h", ROM[6]); 
			$display("Instruction Memory %h", ROM[7]); 
			$display("Instruction Memory %h", ROM[8]); 
			$display("Instruction Memory %h", ROM[9]); 
			$display("Instruction Memory %h", ROM[10]); 
			$display("Instruction Memory %h", ROM[11]); 
			$display("Instruction Memory %h", ROM[12]); 
			$display("Instruction Memory %h", ROM[13]); 
			$display("Instruction Memory %h", ROM[14]); 
			$display("Instruction Memory %h", ROM[15]); 
			$display("Instruction Memory %h", ROM[16]); 
			$display("Instruction Memory %h", ROM[17]); 
			$display("Instruction Memory %h", ROM[18]); 
			$display("Instruction Memory %h", ROM[19]); 
			$display("Instruction Memory %h", ROM[20]); 
			$display("Instruction Memory %h", ROM[21]); 
			$display("Instruction Memory %h", ROM[22]); 
			$display("Instruction Memory %h", ROM[23]); 
			$display("Instruction Memory %h", ROM[24]); 
			$display("Instruction Memory %h", ROM[25]); 
			$display("Instruction Memory %h", ROM[26]); 
			$display("Instruction Memory %h", ROM[27]); 
			$display("Instruction Memory %h", ROM[28]); 
			$display("Instruction Memory %h", ROM[29]); 
			$display("Instruction Memory %h", ROM[30]); 
			$display("Instruction Memory %h", ROM[31]);
	end
		
	
	 
  
	  
	// Leitura de instrução, de acordo com endereço armazenado no PC:  
	// Obs: word aligned / Divide enderço/4: instanciar como InstructionMemory(PC[7:2], instr);
 
  assign mir_data = ROM[mi_address]; 

  
endmodule



// Detalhes p/ acesso byte-byte ou half-word - ver:
// https://stackoverflow.com/questions/58305689/how-implement-store-byte-and-store-half-word-in-realistic-approach?noredirect=1&lq=1


