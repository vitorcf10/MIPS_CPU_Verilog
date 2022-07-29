
// Module SignExtension 
//  Extensão de sinal, 16 bits --> 32 bits
//
// *teste: Waveform6

module SignExtension(input  wire [15:0] a,
							output wire [31:0] y);
              
  assign y = {{16{a[15]}}, a};
  
endmodule