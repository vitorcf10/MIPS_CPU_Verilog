// Module ALU 
//  Unidade lógica/aritmética simples, 32-bits
//
// *teste: Waveform8

//*** CÓDIGO Incompleto: contempla apenas as instruções da implementação inicial *****

`timescale 1ns/100ps

module ALU(input  wire [31:0] a,
			  input  wire [31:0] b,
           input  wire [2:0]  alucontrol,
           output reg  [31:0] result,
           output wire zero);

  wire [31:0] condinvb;
  wire [31:0] sum;
  

  assign condinvb = alucontrol[2] ? ~b : b;   // inversão de operando p/ subtração
  assign sum = a + condinvb + alucontrol[2];  // soma 1, quando for subtração.

  always @(*)
    case (alucontrol[1:0])
      2'b00: result = a & b;
      2'b01: result = a | b;
      2'b10: result = sum;
      2'b11: result = sum[31];
    endcase

  assign zero = (result == 32'b0);
  
  	
	
endmodule
