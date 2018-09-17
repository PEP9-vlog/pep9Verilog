/*
* Pep9 CPU simulator on Nexys4DDR
* Initial version: Certain unary and non unary operations with immediate addressing mode and Register File
* Stages: Decode, Execute and Store
*
* Created on Monday, 9 July, 2018
* @author: Nandita Ekbote
* @copyright Portland State University, 2018
*
*/

//Top level module for Pep9 CPU. Drives the various execution states
module Top_Pep9CPU(
 output [7:0] AluOpt_C,
 output S,
 output C,
 output V, 
 output Z,
 output N,
 input Sysclk,
 input resetbar,
// input [7:0] InstructionSpecifier,
 input Cin);
 
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
 
    reg Ftch, Dec, Ex, St;
    reg [0:2] state;
    wire DoneFtch, DoneDec, DoneExec, DoneSt;
    wire [7:0] AluInp1_A, AluInp2_B ;
    wire [4:0] OutReg;
    wire [3:0] alu_control;
    wire [7:0] InstructionSpecifier;
   initial 
      begin 
          state <= s0;
          Ftch <= 1'b0;
          Dec <= 1'b0;
          Ex <= 1'b0;
          St <= 1'b0;
      end
    
      always@(posedge Sysclk)
      begin
          if(resetbar == 1'b0)
              state <= s1;
          
          case(state)
          s0: //fetch
                if(Ftch == 1'b1)
                begin
                    if(DoneFtch == 1'b1) 
                    begin
                        Ftch <= 1'b0;
                        state <= s1;
                    end
                end
                else
                begin
                    Ftch <= 1'b1;   
                end
                
          s1: //Decode
              if(Dec == 1'b1)
              begin
                  if(DoneDec == 1'b1) 
                  begin
                      Dec <= 1'b0;
                      state <= s2;
                  end
              end
              else
              begin
                  Dec <= 1'b1;    
              end     
          
          s2: //Execute
              if(Ex == 1'b1)
              begin
                  if(DoneExec == 1'b1) 
                  begin
                        Ex <= 1'b0;
                        state <= s3;
                  end
              end
              else
              begin  
                  Ex <= 1'b1;  
              end       
                  
          s3: //Store
              if(St == 1'b1)
              begin
                  if(DoneSt == 1'b1) 
                  begin
                    St <= 1'b0;
                    state <= s0;
                  end
              end
              else
              begin  
                  St <= 1'b1;  
              end
                  
          endcase
      end  
     
    //example memory fetch of instruction at address 
    Fetch Pep9ftch(DoneFtch, InstructionSpecifier, Sysclk, Ftch );
    
    //Pipeline stages     
    Decode Pep9dec( DoneDec, OutReg, AluInp1_A,  AluInp2_B, alu_control, Dec, Sysclk, InstructionSpecifier);
    Execute Pep9exe(  DoneExec, AluOpt_C, S, C, V, Z, N, Ex, Sysclk, AluInp1_A,  AluInp2_B, alu_control,  Cin );
    Store Pep9st(DoneSt, St, Sysclk, OutReg, AluOpt_C);

endmodule 

//Fetch: fetches instruction from address specified by PC
module Fetch(
 output donemem, 
 output [7:0] InstructionSpecifier, 
 input Sysclk, 
 input Ftch 
 );
    
    wire DonePCInc;
    wire [15:0] PC, address;
    reg LoadCk, MARCk, apbclocken, Enftch;
	reg [2:0] FetchState;
	reg [4:0] A, B;
    
    initial 
    begin
		FetchState <= 3'd0;
        LoadCk <= 1'b0;
        MARCk <= 1'b0;
        apbclocken <= 1'b0;
        Enftch <= 1'b0;
    end
    
    always@(posedge Sysclk)
	begin
		if(Ftch)
		begin
			case(FetchState)
			3'd0: //reg set for PC to on Abus and Bbus
					begin
						A <= 5'd6;
						B <= 5'd7;
						LoadCk <= 1'b1;
						FetchState <= 3'd1;
					end
					
			3'd1: //MAR
					begin
						A <= 'bz;
						B <= 'bz;
						LoadCk <= 1'b0;
						MARCk <= 1'b1;
						FetchState <= 3'd2;
					end
			3'd2: //Memory Read
					begin
				        MARCk <= 'b0;
						apbclocken <= 1'b1;
						FetchState <= 3'd3;
					end			
			
			3'd3: //Chck for mem operation complete
					begin
				        if(donemem)
				        begin
							apbclocken <= 0;
						    FetchState <= 3'd4;
						end
					end
		  
		      3'd4: //Increment PC
		          begin
		              Enftch <= 1'd1;
		              FetchState <= 3'd5;
		          end
		      
		      3'd5: //Check if PC incremented
		          begin
		              if(DonePCInc)
		              begin
		                  Enftch <= 1'd0;
		                  FetchState <= 3'd0;
		              end
		          end
			endcase
		end
	end
    
    //Get PC
    RegSetAbs loadpc(
       .Abus(PC[15:8]), 
       .Bbus(PC[7:0]), 
       .Sysclk(Sysclk),
       .Cbus(8'bz), 
       .A(A), 
       .B(B), 
       .C(5'bz), 
       .LoadCk(LoadCk)
    );
        
    //Form 16-bit address
    AccessMAR loadaddr(
		.MAROut(address),
		.Sysclk(Sysclk),
		.MARCk(MARCk),
		.MARA(PC[15:8]),  
		.MARB(PC[7:0])  
	);
        
    //Get instruciton specifier from memory
    SystemBus Pep9apbftch(
        .DoneMem(donemem),
        .DatatoRead(InstructionSpecifier),
        .DatatoWrite('bz),
        .we('b0),
        .address(address),
        .Sysclk(apbclocken ? Sysclk: 'b0));
       
     //Increment PC 
      PCIncrementer PCIncrftch( 
        .DonePCInc(DonePCInc),
        .Sysclk(Sysclk),
        .En(Enftch)
        );  
       
endmodule

//Decode: Instruction decode to identify type of operation and its operands
module Decode(
    output reg DoneDec,
    output reg [4:0] OutReg, 
    output reg [7:0] Oprnd1, 
    output reg [7:0] Oprnd2, 
    output reg [3:0] alu_ctrl, 
    input Dec, 
    input Sysclk, 
    input [7:0] InstructionSpecifier);

    reg r, LoadCk, MARCk, ApbClockEn, MDRMux, MDRCk, Amux, MemReadDoneSignal, direct_state;
    reg [4:0] A,B;
    reg [2:0] DecodeState, MemReadState;
    wire MemDone;
    wire [7:0] Abus, AMuxAbus, Bbus, DataBus, MDROut, MDRInp;
    wire [15:0] address;
      
    initial 
    begin 
        LoadCk <= 1'd0;
        MARCk <= 1'd0;
        ApbClockEn <= 1'd0;
        MDRMux <= 1'd0;
        MDRCk <= 1'd0;
        Amux <= 1'd0;
        A <= 5'bzzzzz;
        B <= 5'bzzzzz;
        DecodeState <= 3'd2;
        MemReadState <= 2'd0;
        MemReadDoneSignal <= 1'd0;
        DoneDec <= 1'b0;
        direct_state <= 1'd0;
    end
    
    always@(posedge Sysclk)
    begin
        if(Dec)
        begin
            //check unary or non unary
            if(InstructionSpecifier[7:4] > 4'd0)
            begin   //Non-Unary
                case(DecodeState)
                3'd0:   //Fetch OS higher byte
                        begin
                            MemRead( 5'd6, 5'd7);
                            if(MemReadDoneSignal)
                                DecodeState <= 3'd1;
                        end
                        
                3'd1:   //Fecth OS lower byte
                        DecodeState <= 3'd2;
                        
                3'd2:   //Addressing mode and Oprnd2
                        begin
                        AddressingMode(InstructionSpecifier[2:0]);
                        end 
                        
                3'd3:   //Decode operation 
                        begin
						LoadCk <= 1'b0;
                        MemReadDoneSignal <= 1'b0;
                        NonUnaryOperationDecode(InstructionSpecifier[7:3]);
                        LoadCk <= 1'b1;
                        DecodeState <= 3'd4;
                        end  
                        
                3'd4:   //Assign Operands
                        begin
                        LoadCk <= 1'b0;
                        A <= 5'bz;
                        B <= 5'bz;
                        Oprnd1 <= AMuxAbus;
                        Oprnd2 <= Bbus;
                        DoneDec <= 1'b1;
                        end 
                endcase
            end
            else    //Unary
            begin
                r <=  InstructionSpecifier[0];                
                UnaryOperationDecode(InstructionSpecifier[3:1]);
                if(InstructionSpecifier[7:1] == 7'b0001000) 
                    alu_ctrl <= 4'b1110;
                //if(InstructionSpecifier[7:1] == 7'b0010011) //NOP?
//                        alu_ctrl <= 4'b1110;
                OutReg <= r? 5'd3: 5'd1;
                A <= r? 5'd3: 5'd1;
                B <= 5'bz;
                LoadCk <= 1'b1;
                DoneDec <= 1'b1;
            end
            
        end
    end
    
    //Instantiations    
    RegSetAbs DecInputs(
       .Abus(Abus), 
        .Bbus(Bbus), 
        .Sysclk(Sysclk),
        .Cbus(8'bz), 
        .A(A), 
        .B(B), 
        .C(5'bz), 
        .LoadCk(LoadCk)
    );
    
	AccessMAR DecMAR(
		.MAROut(address),
		.Sysclk(Sysclk),
		.MARCk(MARCk),
		.MARA(Abus),  
		.MARB(Bbus)  
	);
    
    SystemBus Decapb(
        .DoneMem(MemDone),
        .DatatoRead(DataBus),
        .DatatoWrite(8'bz),
        .we(1'b0),
        .address(address),
        .Sysclk(ApbClockEn ? Sysclk: 1'b0));
        
    Mux DecMDRMux(
		.Y(MDRInp),
		.Sysclk(Sysclk),
		.Inp1(DataBus),
		.Inp2(8'bz),
		.Sel(MDRMux));
		
    AccessMDR DecMDR(
		.MDROut(MDROut), 
		.Sysclk(Sysclk),
		.MDRCk(MDRCk),
		.MDRInp(MDRInp));
	
    AMuxAbs DecAMux(
           .AMuxAbus(AMuxAbus),
           .Sysclk(Sysclk),
           .Abus(Abus),
           .MDR(MDROut),
           .AMux(Amux)
        );  
  
    //Task definitions
        //Unary alu operation decode  
		task UnaryOperationDecode;
			input [2:0] opcode;
			
			case(opcode)
			3'd3:    //Not r
					alu_ctrl <= 4'b1010;
			
			3'd4:    //NeG r
					alu_ctrl <= 4'b1010;
			
			3'd5:    //ASL r
					alu_ctrl <= 4'b1011;
			
			3'd6:    //ASR r
					alu_ctrl <= 4'b1101;
			
			3'd7:    //ROL r
					alu_ctrl <= 4'b1100;
			endcase
		endtask             //End of Unary alu operation decode 
    
		//Nonunary alu operation decode
		task NonUnaryOperationDecode;
			input [4:0] opcode;
			case(opcode[4:1])
			4'd5:    //SP
					begin
					B <= 5'd5;
					OutReg <= 5'd5;
					if(opcode[0])
						alu_ctrl <= 4'b0011;
					else
						alu_ctrl <= 4'b0001;
					end
			
			4'd6:   //ADD r
					begin
					alu_ctrl <= 4'b0001;
					if(opcode[0])
						B <= 5'd3;
					else
						B <= 5'd1;
					OutReg <= B;
					end
			
			4'd7:   //SUB r
					begin
					alu_ctrl <= 4'b0011;
					if(opcode[0])
						B <= 5'd3;
					else
						B <= 5'd1;
					OutReg <= B;
					end
			
			4'd8:   //AND r
					begin
					alu_ctrl <= 4'b0101;
					if(opcode[0])
						B <= 5'd3;
					else
						B <= 5'd1;
					OutReg <= B;
					end
			
			4'd9:    //OR r
					begin
					alu_ctrl <= 4'b0111;
					if(opcode[0])
						B <= 5'd3;
					else
						B <= 5'd1;
					OutReg <= B;
					end       
			
			4'd10:    //CMPw r
					begin
					alu_ctrl <= 4'b0011;
					if(opcode[0])
						B <= 5'd3;
					else
						B <= 5'd1;
					OutReg <= 5'd11;    //T1 reg
					end
			
			4'd11:    //CMPb r
					begin
					alu_ctrl <= 4'b0011;
					if(opcode[0])
						B <= 5'd3;
					else
					B <= 5'd1;
					OutReg <= 5'd11;    //T1 reg
					end
			
			4'd12:   //LDw r
					begin
					alu_ctrl <= 4'b0000;
					if(opcode[0])
						OutReg <= 5'd3;
					else
						OutReg <= 5'd1;            
					end
			
			4'd13:   //LDb r
					begin
					alu_ctrl <= 4'b0000;
					if(opcode[0])
						OutReg <= 5'd3;
					else
						OutReg <= 5'd1;
					end
			
			4'd14:   //STw r
					begin
					alu_ctrl <= 4'b0000;
					if(opcode[0])
						B <= 5'd3;
					else
						B <= 5'd1;
					end        
					
			4'd15:   //STb r
					begin
					alu_ctrl <= 4'b0000;
					if(opcode[0])
						B <= 5'd3;
					else
						B <= 5'd1;
					end
			default: $display("Default of AddressingMode");      
			endcase
		endtask             //End of Nonunary alu operation decode
    
		//Addressing mode decode
		task AddressingMode;
			input [2:0] aaa;
			
			case(aaa)
			3'd0:    //Immediate
					begin
						B <= 5'd10;
						LoadCk <= 1'b1;
						DecodeState <= 3'd3;
					end
			3'd1:   //Direct
					begin
						DirectAddressing();
					end
					
			default: $display("Default of AddressingMode");        
			endcase
		endtask     //End of Addressing mode decode
    
		//Direct addressing mode decode
		task DirectAddressing;
			case(direct_state)
				1'b0:	//Set Address on Abus and Bbus
						begin
                            MemRead( 5'd9, 5'd10 );
							if(MemReadDoneSignal)
								direct_state <= 1'b1;
						end
						
				1'b1:	//Clear all control signals
						begin
						    MemReadDoneSignal <= 1'b0;
						    DecodeState <= 3'd3;
						    direct_state <= 1'b0;
						end
						
				default: $display("Default of DirectAddressingMode");  
			endcase
		endtask    //End of Direct addressing mode decode

        //Read from memor with address from RegSet
        task MemRead;
           input [4:0] HighAddrReg;
           input [4:0] LowAddrsReg;
    
           case(MemReadState)
                3'd0:    //Set Address on Abus and Bbus
                    begin
                       A <= HighAddrReg;
                       B <= LowAddrsReg;
                       LoadCk <= 1'b1;
                       MemReadState <= 3'd1;
                    end
        
                3'd1:    //AccessMAR
                    begin
                       LoadCk <= 1'b0;
                       A <= 5'bzzzzz;
                       B <= 5'bzzzzz;
                       MARCk <= 1'b1;
                       MemReadState <= 3'd2;
                    end
                
                3'd2:    //Enable read on System Bus
                    begin
                       ApbClockEn <= 1'b1;
                       if(MemDone)
                          MemReadState <= 3'd3;
                    end
                
                3'd3:    //MDRmux
                    begin
                        ApbClockEn <= 1'b0;
                        MDRMux <= 1'b1;
                        MemReadState <= 3'd4;
                    end            
                        
                3'd4:    //MDR
                    begin
                        MDRMux <= 1'b0;
                        MDRCk <= 1'b1;
                        MemReadState <= 3'd5;
                    end
                
                3'd5:    //Amux
                    begin
                        MemReadDoneSignal <= 1'b1;
                        MDRCk <= 1'b0;
                        Amux <= 1'b0;
                        MemReadState <= 3'd0;
                    end
                    
                 default: $display("Default of MemRead"); 
           endcase
        endtask    //End of MemRead    
           
endmodule


//Execute: Performs the operation decoded through ALU 
module Execute(
 output reg DoneEx, 
 output [7:0] AluOpt_C,
 output S,
 output C,
 output  V, 
 output Z,
 output  N,
 input Ex, 
 input Sysclk,
 input  [7:0] AluInp1_A,  //AluInp1_A
 input  [7:0] AluInp2_B,  //AluInp2_B
 input  [3:0] alu_control, //ALU control for operation perform
 input  Cin //Carry-in 
 );

    initial 
    begin 
        DoneEx <= 1'b0;
    end
  
	ALU alu_exe1(
	.AluOpt_C(AluOpt_C),  
    .S(S), 
    .C(C),
	.V(V),
	.Z(Z),
	.N(N),
    .alu_enable(Ex),
    .Sysclk(Sysclk),
    .AluInp1_A(AluInp1_A),  
    .AluInp2_B(AluInp2_B), 
    .alu_control(alu_control), 
    .Cin(Cin));
		
	always@(AluOpt_C)
	begin
	       DoneEx <= 1'b1;
	end
	       
endmodule

//Execute - ALU
module ALU(
	output reg [7:0] AluOpt_C,  //result 
	output reg S, 
	output reg C,
	output reg V,
	output reg Z,
	output reg N,
	input alu_enable,
	input Sysclk,
	input  [7:0] AluInp1_A,  //AluInp1_A
	input  [7:0] AluInp2_B,  //AluInp2_B
	input  [3:0] alu_control, //ALU control for operation perform
	input  Cin //Carry-in
    );
	
	reg Cout, Sout, Vout, Zout, Nout, CCk, SCk, NCk, VCk, AndZ, ZCk;
    
    initial begin
        Cout <= 1'b0;
        Sout <= 1'b0;
        Zout <= 1'b0;
        Vout <= 1'b0;
        Nout <= 1'b0;        
        CCk <= 1'b0;
        SCk <= 1'b0;
        ZCk <= 1'b0;
        VCk <= 1'b0;
        NCk <= 1'b0;
        AndZ <= 1'b0;
        S <= 1'b0; 
        C <= 1'b0;
        V <= 1'b0;
        Z <= 1'b0;
        N <= 1'b0;
    end
    
	always@(posedge Sysclk)
	begin
	if (alu_enable)
	begin
		case(alu_control) 
        4'd0: begin
                AluOpt_C <= AluInp1_A; 
                //status bits
                Cout <=  1'd0;
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
        
        4'd1: begin
                {Cout,AluOpt_C} = AluInp1_A + AluInp2_B; 
                //status bits    
                //Cout <= ??
                Zout <= (AluOpt_C == 8'd0)? 1'b1 : 1'b0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'b1: 1'b0; 
                Vout <= ((AluInp1_A[7] == 1'b0) && (AluInp2_B[7] == 1'b0) && (AluOpt_C[7] == 1'b1)) || ((AluInp1_A[7] == 1'b1) && (AluInp2_B[7] == 1'b1) && (AluOpt_C[7] == 1'b0))? 1'b1: 1'b0; 
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
            
        4'd2: begin
                {Cout,AluOpt_C} <= AluInp1_A + AluInp2_B + Cin; 
                //status bits    
                //Cout <= ??
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= ((AluInp1_A[7] == 'b0) && (AluInp2_B[7] == 'b0) && (AluOpt_C[7] == 'b1)) || ((AluInp1_A[7] == 'b1) && (AluInp2_B[7] == 'b1) && (AluOpt_C[7] == 'b0))? 1'd1: 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
        
        4'd3: begin
                {Cout,AluOpt_C} <= AluInp1_A + (~AluInp2_B) + 1; 
                //status bits    
                //Cout <= ??
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= ((AluInp1_A[7] == 'b0) && (AluInp2_B[7] == 'b0) && (AluOpt_C[7] == 'b1)) || ((AluInp1_A[7] == 'b1) && (AluInp2_B[7] == 'b1) && (AluOpt_C[7] == 'b0))? 1'd1: 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end            
            
        4'd4: begin
                {Cout,AluOpt_C} <= AluInp1_A + (~AluInp2_B) + Cin; 
                //status bits    
                //Cout <= ??
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= ((AluInp1_A[7] == 'b0) && (AluInp2_B[7] == 'b0) && (AluOpt_C[7] == 'b1)) || ((AluInp1_A[7] == 'b1) && (AluInp2_B[7] == 'b1) && (AluOpt_C[7] == 'b0))? 1'd1: 1'd0;
                CCk <= 1'd1;
                VCk <= 1'd1;
                end            
            
        4'd5: begin
                AluOpt_C <= AluInp1_A & AluInp2_B; 
                //status bits        
                Cout <=  1'd0;
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end                    
            
        4'd6: begin
                AluOpt_C <= ~(AluInp1_A & AluInp2_B); 
                //status bits            
                Cout <=  1'd0;
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
        
        4'd7: begin
                AluOpt_C <= (AluInp1_A | AluInp2_B); 
                //status bits            
                Cout <=  1'd0;
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
        
        4'd8: begin
                AluOpt_C <= ~(AluInp1_A | AluInp2_B); 
                //status bits    
                Cout <=  1'd0;
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end                    
            
        4'd9: begin
                AluOpt_C <= (AluInp1_A ^ AluInp2_B); 
                //status bits    
                Cout <=  1'd0;
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end                    
        
        4'd10: begin
                AluOpt_C <= ~(AluInp1_A); 
                //status bits    
                C <=  1'd0;
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                V <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
        
        4'd11: begin
                AluOpt_C <= (AluInp1_A << 1); //ASL A retain sign bit
                //status bits
                Cout <=  AluInp1_A[7];
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= ((AluInp1_A[7] == 'b0) && (AluOpt_C[7] == 'b1)) || ((AluInp1_A[7] == 'b1) && (AluOpt_C[7] == 'b0))? 1'd1: 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
        
        4'd12: begin
                Cout <=  AluInp1_A[7];
                AluOpt_C <= {(AluInp1_A << 1),AluInp1_A[7]}; //ROL A
                //status bits    
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= ((AluInp1_A[7] == 'b0) && (AluOpt_C[7] == 'b1)) || ((AluInp1_A[7] == 'b1) && (AluOpt_C[7] == 'b0))? 1'd1: 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
            
        4'd13: begin
                AluOpt_C <= (AluInp1_A >> 1); //ASR A
                //status bits        
                Cout <=  AluInp1_A[0];
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1)? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;
                end
        
        4'd14: begin
                Cout <=  AluInp1_A[0];
                AluOpt_C <= {AluInp1_A[0],(AluInp1_A >> 1)}; //ROR A
                //status bits
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C < 8'd0)? 1'd1: 1'd0; 
                Vout <= 1'd0;  
                CCk <= 1'd1;
                VCk <= 1'd1;                      
                end

        4'd15: begin 
                AluOpt_C <= 0;
                Nout <= AluInp1_A[4];
                Zout <= AluInp1_A[5];
                Vout <= AluInp1_A[6];
                Cout <= AluInp1_A[7];
                CCk <= 1'd1;
                VCk <= 1'd1;
               end
        
    endcase
		
		ZCk <= 1'd1;
		NCk <= 1'd1;
				
		if(SCk)
        begin
            S <= Cout;
            SCk <= 1'b0;
        end
        if(CCk)
        begin
            C <= Cout;
            CCk <= 1'b0;
        end
        if(VCk)
        begin
            V <= Vout;
            VCk <= 1'b0;
        end
        if(ZCk)
        begin
            if(AndZ)
                Z <= Zout & Z;
            else 
                Z <= Zout;
            ZCk <= 1'b0;
        end
        if(NCk)
        begin
            N <= Nout;
            NCk <= 1'b0;
        end
    end
	end
endmodule

//Store: stores the result of the operation perfomed to Reg File
module Store(
	output reg DoneSt,
	input St,
	input Sysclk,
	input [4:0] OutReg,
	input [7:0] OutputData);

    wire [7:0] Abus, Bbus;
    reg LoadCk, StoreState;
    reg [4:0] C;
    
    initial 
    begin 
        DoneSt <= 1'b0; 
        LoadCk <= 1'b0; 
        StoreState <= 1'b0; 
        C <= 5'bz;
    end
    
    always@(posedge Sysclk)
    begin
        if(St)
        begin
            case(StoreState)
            1'b0:   //Reg set store
                    begin
                    LoadCk <= 1'b1;
                    C <= OutReg;
                    StoreState <= 1'b1;
                    end
            1'b1:   //Signal done
                    begin
                    LoadCk <= 1'b0;
                    C <= 5'bz;
                    DoneSt <= 1'b1;
                    StoreState <= 1'b0;
                    end
            endcase
        end
        else
            LoadCk <= 1'b0;
    end
    
	RegSetAbs storeres(
        .Abus(Abus), 
        .Bbus(Bbus), 
        .Sysclk(Sysclk),
        .Cbus(OutputData), 
        .A(5'bz), 
        .B(5'bz), 
        .C(C), 
        .LoadCk(LoadCk)
    );

endmodule


//Abstract to CPU contents
//System Bus: APB
module SystemBus(
    output DoneMem,
    output [7:0] DatatoRead,
    input [7:0] DatatoWrite,
    input we,
    input [15:0] address,
    input Sysclk);

    apb_top Pep9apb( .sysclk(Sysclk),
    .address(address),
    .writeData(DatatoWrite),
    .we(we),
    .readData(DatatoRead),
    .done(DoneMem));

endmodule

//RegSetAbs: Abstraction layer to single RegSet of Pep9 CPU
module RegSetAbs(
    output [7:0] Abus, 
    output [7:0] Bbus, 
    input Sysclk,
    input [7:0] Cbus, 
    input [4:0] A, 
    input [4:0] B, 
    input [4:0] C, 
    input LoadCk);

    RegSet Pep9RegSet(
	.Abus(Abus), 
	.Bbus(Bbus), 
	.Sysclk(Sysclk),
	.Cbus(Cbus), 
	.A(A), 
	.B(B), 
	.C(C), 
	.LoadCk(LoadCk)
	);

endmodule

//Abstraction for Amux
module AMuxAbs(
   output [7:0] AMuxAbus,
   input Sysclk,
   input [7:0] Abus,
   input [7:0] MDR,
   input AMux
);

    Mux Amultiplexer(
	.Y(AMuxAbus),
	.Sysclk(Sysclk),
	.Inp1(Abus),
	.Inp2(MDR),
	.Sel(AMux)
    );
    
endmodule

//Abstraction for Cmux
module CMuxAbs(
   output [7:0] Cbus,
   input Sysclk,
   input [7:0] AluOpt,
   input [7:0] Flags,
   input CMux
);

    Mux Cmultiplexer(
	.Y(Cbus),
	.Sysclk(Sysclk),
	.Inp1(AluOpt),
	.Inp2(Flags),
	.Sel(CMux)
    );
    
endmodule

//Helper modules
//Increment PC
module PCIncrementer( 
    output reg DonePCInc,
    input Sysclk,
    input En);

    wire S, Co, V, Z, N;
    wire [7:0] Abus, Bbus, AMuxAbus, NewRegValue, Cbus;
    reg LoadCk, Amux, alu_enable, Cmux;
    reg [2:0] PCincState;
    reg [3:0] alu_control;
    reg [4:0] A, B, C;
    
    initial 
    begin
        DonePCInc <= 1'd0;
        PCincState <= 3'd0;
        LoadCk <= 1'b0;
         Amux <= 1'b0;
         alu_enable <= 1'b0;
         Cmux <= 1'b0;
    end 
    
    always@(posedge Sysclk)
    begin
    if(En)
    case(PCincState)
	3'd0: //RegSet to Abus and Bbus
			begin
			DonePCInc <= 1'd0;
			A <= 5'd7;
			B <= 5'dz;
			C <= 5'dz;
			LoadCk <= 1'b1;
			PCincState <= 3'd1;
			end
	
	3'd1: //Amux create common Amux module
			begin
				LoadCk <= 1'b0;
				Amux <= 1'b1;
				PCincState <= 3'd2;
			end
			
	3'd2: //Alu instantitate for alu_ctrl = 'd1
			begin			
				alu_control <= 4'd1;
				alu_enable <= 1'b1;
				PCincState <= 3'd3;
			end
			
	3'd3: //Cmux create common Amux module on Cbus
			begin
				alu_enable <= 1'b0;
				Cmux <= 1'b1;
				PCincState <= 3'd4;	
			end

	3'd4: //Reg Set  to store new PC
			begin
				A <= 5'dz;
				B <= 5'dz;
				C <= 5'd7;
				LoadCk <= 1'b1;
				PCincState <= 3'd5;
			end
			
	3'd5: //reset control signals
			begin
				LoadCk <= 1'b0;
				DonePCInc <= 1'd1;
				PCincState <= 3'd0;	
			end
	endcase 
	end   
	
	//Instantiations
	 RegSet PCincRegset(
       .Abus(Abus), 
       .Bbus(Bbus), 
       .Sysclk(Sysclk),
       .Cbus(Cbus), 
       .A(A), 
       .B(B), 
       .C(C), 
       .LoadCk(LoadCk)
       );
       
     AMuxAbs PCincAMuxAbs(
          .AMuxAbus(AMuxAbus),
          .Sysclk(Sysclk),
          .Abus(Abus),
          .MDR(8'dz),
          .AMux(1'b1)
       ); 
       
      ALU PCincALU(
           .AluOpt_C(NewRegValue),  
           .S(S), 
           .C(Co),
           .V(V),
           .Z(Z),
           .N(N),
           .alu_enable(alu_enable),
           .Sysclk(Sysclk),
           .AluInp1_A(AMuxAbus), 
           .AluInp2_B(8'd1), 
           .alu_control(alu_control),
           .Cin(1'bz) 
           );
           
      CMuxAbs PCincCMuxAbs(
            .Cbus(Cbus),
            .Sysclk(Sysclk),
            .AluOpt(NewRegValue),
            .Flags(8'dz),
            .CMux(1'b1)
           ); 
           
endmodule

//Reg file
module RegSet(
	output reg [7:0] Abus, 
	output reg [7:0] Bbus, 
	input Sysclk,
	input [7:0] Cbus, 
	input [4:0] A, 
	input [4:0] B, 
	input [4:0] C, 
	input LoadCk
	);
	
	// Reg set
	reg [15:0] AReg, X, SP, PC, T2, T3, T4, T5, T6, M1, M2, M3, M4, M5;
    reg [23:0] IR;
    reg [7:0] T1;
    
    initial begin 
        PC <= 16'h0;
        SP <= 16'hFB8F;
        IR <= 24'd0;
        AReg <= 16'd0;
        X <= 16'd0;
        M1 <= 16'h0001;
        M2 <= 16'h0203;
        M3 <= 16'h0408;
        M4 <= 16'hF0F6;
        M5 <= 16'hFEFF;
        //Temperory Regs
        T1 <= 8'd0;
        T2 <= 16'd0;
        T3 <= 16'd0;
        T4 <= 16'd0;
        T5 <= 16'd0;
        T6 <= 16'd0;
     end
	
	
	always@(posedge Sysclk)
	begin
		if(LoadCk)
		begin
		//Cbus
        case(C)
        5'b00000 :  AReg[15:8] <= Cbus; 
        5'b00001 :  AReg[7:0]  <= Cbus; 
        5'b00010 :  X[15:8]    <= Cbus; 
        5'b00011 :  X[7:0]     <= Cbus; 
        5'b00100 :  SP[15:8]   <= Cbus; 
        5'b00101 :  SP[7:0]    <= Cbus; 
        5'b00110 :  PC[15:8]   <= Cbus; 
        5'b00111 :  PC[7:0]    <= Cbus; 
        5'b01000 :  IR[23:16]  <= Cbus; 
        5'b01001 :  IR[15:0]   <= Cbus; 
        5'b01010 :  IR[7:0]    <= Cbus; 
        5'b01011 :  T1         <= Cbus; 
        5'b01100 :  T2[15:8]   <= Cbus; 
        5'b01101 :  T2[7:0]    <= Cbus; 
        5'b01110 :  T3[15:8]   <= Cbus; 
        5'b01111 :  T3[7:0]    <= Cbus;  
        5'b10000 :  T4[15:8]   <= Cbus;
        5'b10001 :  T4[7:0]    <= Cbus;  
        5'b10010 :  T5[15:8]   <= Cbus;
        5'b10011 :  T5[7:0]    <= Cbus;  
        5'b10100 :  T6[15:8]   <= Cbus;
        5'b10101 :  T6[7:0]    <= Cbus[7:0];
        default: ;
        endcase
        
		case(A)
		//Abus
		5'b00000: Abus <= AReg[15:8];
        5'b00001: Abus <= AReg[7:0];
        5'b00010: Abus <= X[15:8];
        5'b00011: Abus <= X[7:0];        
        5'b00100: Abus <= SP[15:8];
        5'b00101: Abus <= SP[7:0];
        5'b00110: Abus <= PC[15:8];
        5'b00111: Abus <= PC[7:0];        
        5'b01000: Abus <= IR[23:16];
        5'b01001: Abus <= IR[15:0];
        5'b01010: Abus <= IR[7:0];
        5'b01011: Abus <= T1;
        5'b01100: Abus <= T2[15:8];
        5'b01101: Abus <= T2[7:0];        
        5'b01110: Abus <= T3[15:8];
        5'b01111: Abus <= T3[7:0];            
        5'b10000: Abus <= T4[15:8];        
        5'b10001: Abus <= T4[7:0];            
        5'b10010: Abus <= T5[15:8];        
        5'b10011: Abus <= T5[7:0];            
        5'b10100: Abus <= T6[15:8];        
        5'b10101: Abus <= T6[7:0];    
		default: ;
		endcase	
		
		//Bbus
		case(B)
		5'b00000: Bbus <= AReg[15:8];
        5'b00001: Bbus <= AReg[7:0];
        5'b00010: Bbus <= X[15:8];
        5'b00011: Bbus <= X[7:0];        
        5'b00100: Bbus <= SP[15:8];
        5'b00101: Bbus <= SP[7:0];
        5'b00110: Bbus <= PC[15:8];
        5'b00111: Bbus <= PC[7:0];        
        5'b01000: Bbus <= IR[23:16];
        5'b01001: Bbus <= IR[15:0];
        5'b01010: Bbus <= IR[7:0];
        5'b01011: Bbus <= T1;
        5'b01100: Bbus <= T2[15:8];
        5'b01101: Bbus <= T2[7:0];        
        5'b01110: Bbus <= T3[15:8];
        5'b01111: Bbus <= T3[7:0];            
        5'b10000: Bbus <= T4[15:8];        
        5'b10001: Bbus <= T4[7:0];            
        5'b10010: Bbus <= T5[15:8];        
        5'b10011: Bbus <= T5[7:0];            
        5'b10100: Bbus <= T6[15:8];        
        5'b10101: Bbus <= T6[7:0];
        default: ;
        endcase

		end
		
	end
	
endmodule

//8bit 2x1 Multiplexer
module Mux(
	output reg [7:0] Y,
	input Sysclk,
	input [7:0] Inp1,
	input [7:0] Inp2,
	input Sel
);

	always@(posedge Sysclk)
	begin
		Y <= (Sel) ? Inp1 : Inp2;  //Sel = 1 then Inp1 and Sel = 0 then Inp2
	end
	
endmodule

//Memory Data Register
module AccessMDR(
	output reg [7:0] MDROut, 
	input Sysclk,
	input MDRCk,
	input [7:0] MDRInp
	);
	
	always@(posedge Sysclk)
	begin
		if(MDRCk)
		begin
		//Update MDR
		MDROut <= MDRInp;
		end
	end
	
endmodule

//Memory Addressing Register
module AccessMAR(
	output reg [15:0] MAROut,
	input Sysclk,
	input MARCk,
	input [7:0] MARA,  //higher order byte
	input [7:0] MARB   //lower order byte
	);
	
	always@(posedge Sysclk)
	begin
		if(MARCk)
		begin
		//Update 16bit address bus
		MAROut <= (MARA<<8) | MARB;
		end
	end
endmodule
