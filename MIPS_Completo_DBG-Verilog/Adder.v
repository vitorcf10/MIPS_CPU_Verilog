
// Module Adder 
//  Somador de 4 bits
// *teste: Waveform4


module Adder(input  wire [31:0] a,
			    input  wire [31:0] b,
             output wire [31:0] y);

  assign y = a + b;

endmodule




