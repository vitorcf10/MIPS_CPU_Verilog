
// Module RegisterFile 
//  Arquivo de Registradores visíveis p/ Datapath
// *teste: Waveform3

`timescale 1ns/100ps

module RegisterFile(input  wire clk, 
						  input  wire rfw_enable, 
						  input  wire [4:0]  rfr_address1, 
						  input  wire [4:0]  rfr_address2, 
						  input  wire [4:0]  rfw_address3, 
						  input  wire [31:0] rfw_data3,
						  output wire [31:0] rfr_data1,
						  output wire [31:0] rfr_data2);
						  

						  
  reg [31:0] Registradores[31:0];

  // three ported register file
  // read two ports combinationally
  // write third port on rising edge of clk
  // register 0 hardwired to 0
  // note: for pipelined processor, write third port
  // on falling edge of clk
  
  
  
  always @(posedge clk)
    if (rfw_enable) 
		Registradores[rfw_address3] <= rfw_data3;	

  assign rfr_data1 = (rfr_address1 != 0) ? Registradores[rfr_address1] : 0;
  assign rfr_data2 = (rfr_address2 != 0) ? Registradores[rfr_address2] : 0;
  
  
  
  
endmodule



