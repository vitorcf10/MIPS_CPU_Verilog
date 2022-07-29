
// Module DataMemory 
//  Memória de Dados
// *teste: Waveform1

`timescale 1ns/100ps

module DataMemory(input  wire clk,
						input  wire w_enable,
						input  wire [31:0] m_address,
						input  wire [31:0] mw_data,
					   output wire [31:0] mr_data);

  reg [31:0] RAM[63:0];

  assign mr_data = RAM[m_address[31:2]];  // word aligned

  always @(posedge clk)
  begin
    if (w_enable) 
		RAM[m_address[31:2]] <= mw_data;

  end
		
		

endmodule

