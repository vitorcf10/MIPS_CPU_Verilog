
// Module RegisterFF
//  FlipFlop usado como registrador de armazenamento do PC -parametrizável - default: 8-bits
//
// *teste: Waveform9




module RegisterFF #(parameter WIDTH = 8)
								(input clk,
								 input reset,
								 input  wire [WIDTH-1:0] d, 
								 output reg  [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset) 
		q <= 0;
    else
		q <= d;
		
endmodule
