`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nandita Ekbote
// 
// Create Date: 08/22/2018 05:05:22 PM
// Design Name: 
// Module Name: testbench_Pep9_CPU
// Project Name: Pep9 CPU harware simulator
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_Pep9_CPU;

	reg Sysclk, resetbar, Cin;
	reg [7:0] InstructionSpecifier;
	wire  [7:0] AluOpt_C;
	wire S, C, V, Z, N;

	Top_Pep9CPU pep9( 
	   .AluOpt_C(AluOpt_C),
		.S(S),
		.C(C),
		.V(V), 
		.Z(Z),
		.N(N),
		.Sysclk(Sysclk),
		.resetbar(resetbar),
		.InstructionSpecifier(InstructionSpecifier),
		.Cin(Cin));
	
	initial 
	begin
		Sysclk = 'b0;
		resetbar <= 1;
		InstructionSpecifier <= 8'h08;
		Cin = 'b0;
		
		$monitor("t = %d	AluOpt_C = %h	", $time, AluOpt_C);
	end
	
	always 
    begin    
        #100 Sysclk <= ~Sysclk;
        #2000 $finish;
   end
endmodule
