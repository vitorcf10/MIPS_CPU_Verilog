
// Module MUX2 
//  Multiplexador 2x1, parametrizado p/ nro de bits - default = 8bits
// *teste: Waveform7

module MUX2 #(parameter WIDTH = 8)
             (input  wire [WIDTH-1:0] d0, 
				  input  wire [WIDTH-1:0] d1, 
              input  wire  s, 
              output wire [WIDTH-1:0] y);

  assign y = s ? d1 : d0; 
  
endmodule