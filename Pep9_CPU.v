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
 input [7:0] InstructionSpecifier,
 input Cin);
 
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
 
    reg Dec, Ex, St;
    reg [0:2] state;
    wire DoneDec, DoneExec, DoneSt;
    wire [7:0] AluInp1_A, AluInp2_B ;
    wire [4:0] OutReg;
    wire [3:0] alu_control;
    
   initial 
      begin 
          state <= s0;
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
              state <= s1;
          
          s1: //Decode
              if(Dec == 1'b1)
              begin
                  $display("decoding %b", DoneDec);
                  if(DoneDec == 1'b1) 
                      state <= s2;
                  $display("decoding %b", DoneDec);
              end
              else
              begin
                  Dec <= 1'b1;  
                  Ex <= 1'b0;  
                  St <= 1'b0; 
                  $display("Enable decode"); 
              end     
          
          s2: //Execute
              if(Ex == 1'b1)
              begin
                  $display("exe %b", DoneExec);
                  if(DoneExec == 1'b1) 
                      state <= s3;
              end
              else
              begin
                  $display("Enable exec");
                  Dec <= 1'b0;  
                  Ex <= 1'b1;  
                  St <= 1'b0;  
              end       
                  
          s3: //Store
              if(St == 1'b1)
              begin
                  $display("storing %b", DoneSt);
                  if(DoneSt == 1'b1) 
                      state <= s1;
                  end
              else
              begin
                  $display("st");
                  Dec <= 1'b0;  
                  Ex <= 1'b0;  
                  St <= 1'b1;  
              end
                  
          endcase
      end  
         
    Decode Pep9dec( DoneDec, OutReg, AluInp1_A,  AluInp2_B, alu_control, Dec, Sysclk, InstructionSpecifier);
    Execute Pep9exe(  DoneExec, AluOpt_C, S, C, V, Z, N, Ex, Sysclk, AluInp1_A,  AluInp2_B, alu_control,  Cin );
    Store Pep9st(DoneSt, St, Sysclk, OutReg, AluOpt_C);
    
  

endmodule 


//Decode: Instruction decode to identify type of operation and its operands
module Decode(
 output reg DoneDec,
 output reg [4:0] OutReg, 
 output [7:0] Oprnd1, 
 output [7:0] Oprnd2, 
 output reg [3:0] alu_ctrl, 
 input Dec, 
 input Sysclk, 
 input [7:0] InstructionSpecifier);

    integer unstatus;
    reg r, LoadCk;
    reg [4:0] A,B;
    reg [2:0] DecodeState;
      
    initial 
    begin 
        unstatus = 'bz; 
        LoadCk = 1'd0;
        A <= 'bz;
        B <='bz;
        DecodeState = 3'd0;
        DoneDec = 'b0;
    end
    
    always@(posedge Sysclk)
    begin
        if(Dec)
        begin
            //check unary or non unary
            if(InstructionSpecifier[7:4] > 4'd0)
            begin
                case(DecodeState)
                3'd0:   //Fetch OS higher byte
                        DecodeState <= 3'd1;
                        
                3'd1:   //Fecth OS lower byte
                        DecodeState <= 3'd2;
                        
                3'd2:   //Decode operation
                        begin
                        NonUnaryOperationDecode(alu_ctrl,A,OutReg,InstructionSpecifier[7:3]);     
                        DecodeState <= 3'd3;
                        end 
                3'd3: //Addressing mode and Oprnd2
                        begin
                        AddressingMode(B,InstructionSpecifier[2:0]);
                        LoadCk <= 1'b1;
//                        DecodeState <= 3'd4;
                        end   
                endcase
            end
            else
            begin
                r <=  InstructionSpecifier[0];                
                UnaryOperationDecode(alu_ctrl,InstructionSpecifier[3:1]);
                if(InstructionSpecifier[7:1] == 7'b0001000) 
                    alu_ctrl <= 4'b1110;
                //if(InstructionSpecifier[7:1] == 7'b0010011) //NOP?
//                        alu_ctrl <= 4'b1110;
                OutReg <= r? 5'd3: 5'd1;
                A <= r? 5'd3: 5'd1;
                B <= 'bz;
                LoadCk <= 1'b1;
                
            end
            DoneDec = 1'b1;
        end
    end
    
    RegSet DecInputs(Oprnd1, Oprnd2, Sysclk,'bz, A, B, 'bz, LoadCk);
    
    task UnaryOperationDecode;
        output [3:0] alu_ctrl;
        input [2:0] opcode;
        case(opcode)
        3'd3:    //Not r
                alu_ctrl = 4'b1010;
        
        3'd4:    //NeG r
                alu_ctrl = 4'b1010;
        
        3'd5:    //ASL r
                alu_ctrl = 4'b1011;
        
        3'd6:    //ASR r
                alu_ctrl = 4'b1101;
        
        3'd7:    //ROL r
                alu_ctrl = 4'b1100;
        endcase
    endtask
    
        task NonUnaryOperationDecode;
        output [3:0] alu_ctrl;
        output [4:0] A;
        output [4:0] OutReg;
        input [4:0] opcode;
        case(opcode[4:1])
        4'd5:    //SP
                begin
                A = 5'd5;
                OutReg = 5'd5;
                if(opcode[0])
                    alu_ctrl = 4'b0011;
                else
                    alu_ctrl = 4'b0001;
                end
        
        4'd6:   //ADD r
                begin
                alu_ctrl = 4'b0001;
                if(opcode[0])
                    A = 5'd3;
                else
                    A = 5'd1;
                OutReg = A;
                end
        
        4'd7:   //SUB r
                begin
                alu_ctrl = 4'b0011;
                if(opcode[0])
                    begin
                    A = 5'd3;
                    
                    end
                else
                    A = 5'd1;
                OutReg = A;
                end
        
        4'd8:   //AND r
                begin
                alu_ctrl = 4'b0101;
                if(opcode[0])
                    A = 5'd3;
                else
                    A = 5'd1;
                end
        
        4'd9:    //OR r
                begin
                alu_ctrl = 4'b0111;
                if(opcode[0])
                    A = 5'd3;
                else
                    A = 5'd1;
                OutReg = A;
                end       
        
        4'd10:    //CMPw r
                begin
                alu_ctrl = 4'b0011;
                if(opcode[0])
                    A = 5'd3;
                else
                    A = 5'd1;
                OutReg = 5'd11;    //T1 reg
                end
        
        4'd11:    //CMPb r
                begin
                alu_ctrl = 4'b0011;
                if(opcode[0])
                    A = 5'd3;
                else
                    A = 5'd1;
                OutReg = 5'd11;    //T1 reg
                end
        
        4'd12:   //LDw r
                begin
                alu_ctrl = 4'b0000;
                if(opcode[0])
                    OutReg = 5'd3;
                else
                    OutReg = 5'd1;            
                end
        
        4'd13:   //LDb r
                begin
                alu_ctrl = 4'b0000;
                if(opcode[0])
                    OutReg = 5'd3;
                else
                    OutReg = 5'd1;
                end
        
        4'd14:   //STw r
                begin
                alu_ctrl = 4'b0000;
                if(opcode[0])
                    A = 5'd3;
                else
                    A = 5'd1;
                end        
                
        4'd15:   //STb r
                begin
                alu_ctrl = 4'b0000;
                if(opcode[0])
                    A = 5'd3;
                else
                    A = 5'd1;
                end
          default: ;      
        endcase
    endtask
    
    task AddressingMode;
        output [4:0] B;
        input [2:0] aaa;
        //input [15:0] OperationSpecifier;
        case(aaa)
        3'd0:    //Immediate
                B = 5'd10;
                
        default: ;        
        endcase
    endtask
    
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
        DoneEx = 'b0;
    end
    

    
	ALU alu_exe1(AluOpt_C, S, C, V, Z, N, Ex, Sysclk, AluInp1_A, AluInp2_B,  alu_control,  Cin );
	
	always@(AluOpt_C)
	begin
	       DoneEx = 1'b1;
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
        Cout = 1'b0;
        Sout = 1'b0;
        Zout = 1'b0;
        Vout = 1'b0;
        Nout = 1'b0;        
        CCk = 1'b0;
        SCk = 1'b0;
        ZCk = 1'b0;
        VCk = 1'b0;
        NCk = 1'b0;
        AndZ = 1'b0;
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
                {Cout,AluOpt_C} <= AluInp1_A + AluInp2_B; 
                //status bits    
                //Cout <= ??
                Zout <= (AluOpt_C == 8'd0)? 1'd1 : 1'd0;
                Nout <= (AluOpt_C[7] == 1'b1 )? 1'd1: 1'd0; 
                Vout <= ((AluInp1_A[7] == 'b0) && (AluInp2_B[7] == 'b0) && (AluOpt_C[7] == 'b1)) || ((AluInp1_A[7] == 'b1) && (AluInp2_B[7] == 'b1) && (AluOpt_C[7] == 'b0))? 1'd1: 1'd0; 
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
    reg LoadCk;
    
    initial 
    begin 
        LoadCk = 1'b0; 
    end
    
    always@(posedge Sysclk)
    begin
        if(St)
        begin
            LoadCk = 1'b1;
            #100 DoneSt <= 1'b1;
        end
        else
            LoadCk = 1'b0;
    end
    
    RegSet stores(Abus, Bbus, Sysclk, OutputData, 'bz, 'bz, OutReg, LoadCk);

endmodule


//Helper modules
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
        PC = 16'h0;
        SP = 16'hFB8F;
        IR = 24'd0;
        AReg = 16'd0;
        X = 16'd0;
        M1 = 16'h0001;
        M2 = 16'h0203;
        M3 = 16'h0408;
        M4 = 16'hF0F6;
        M5 = 16'hFEFF;
        //Temperory Regs
        T1 = 8'd0;
        T2 = 16'd0;
        T3 = 16'd0;
        T4 = 16'd0;
        T5 = 16'd0;
        T6 = 16'd0;
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


