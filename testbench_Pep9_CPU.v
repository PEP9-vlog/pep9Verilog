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

	reg Sysclk, resetbar, Cin, we;
	reg [15:0] address;
	reg [7:0] writeData;
	wire  [7:0] AluOpt_C, readData;
	wire S, C, V, Z, N, done;

	Top_Pep9CPU pep9( 
	   .AluOpt_C(AluOpt_C),
		.S(S),
		.C(C),
		.V(V), 
		.Z(Z),
		.N(N),
		.Sysclk(Sysclk),
		.resetbar(resetbar),
		.Cin(Cin));
	
	initial 
	begin
		Sysclk <= 'b0;
		resetbar <= 1;
		Cin <= 'b0;
	    address <= 16'h00;
        writeData <= 8'h61;
        we <= 1;
        if(done)
            begin
                address <= 16'bx;
                writeData <= 8'bx;
            end
		$monitor("t = %d	AluOpt_C = %h	", $time, AluOpt_C);
	end
	
	SystemBus TestBenchApb(
        .DoneMem(done),
        .DatatoRead(readData),
        .DatatoWrite(writeData),
        .we(we),
        .address(address),
        .Sysclk(Sysclk));
       
	always 
    begin    
        #10 Sysclk <= ~Sysclk;
   end
endmodule
