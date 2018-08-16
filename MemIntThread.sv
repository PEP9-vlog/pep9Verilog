`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State University
// Engineer: Sanika Chaoji
// 
// Create Date: 07/13/2018 02:17:12 PM
// Design Name: Pep9_apb
// Module Name: MemIntThread
// Project Name: Pep9
// Target Devices: 
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


module MemIntThread(
    input logic PClk,             // Clock
    input logic PResetn,          // Reset. The APB reset signal is active LOW
    input logic [15:0] PAddr,     // Address. This is the APB address bus. It can be up to 32 bits wide
    input logic PSelx,            // Select. It indicates that the slave device is selected and that a data transfer is required
    input logic PEnable,          // Enable. This signal indicates the second and subsequent cycles of an APB transfer.
    input logic PWrite,           // Direction. This signal indicates an APB write access when HIGH and an APB read access when LOW
    input logic [7:0] PWData,     // Write data. This bus is driven by the peripheral bus bridge unit during write cycles when PWRITE is HIGH. This bus can be up to 32 bits wide
    output logic  PReady,         // Ready. The slave uses this signal to extend an APB transfer.
    output logic [7:0] PRData    // Read Data. The selected slave drives this bus during read cycles when PWRITE is LOW. This bus can be up to 32-bits wide.
    );
    
    // defining memory array
    logic [7:0] Mem [16'hffff:0];
    logic [7:0] MemData;
    
    logic   Id_Addr,
            en_Data, 
            Id_Data,
            dv;
    logic   [7:0]  DataReg;
    logic   [15:0] AddrReg;
                  
    enum    {S_Idle, S_Setup, S_Access} state, NextState;  
    
    
    // optional setting default data in memory
    initial begin
        for(int i=0; i<=16'hffff; i++)
            Mem[i]=i[7:0];
    end
    
   
   // copy MemData in PRData when en_Data=1 
    assign   PRData =   (en_Data)? MemData : 'bx;
   
   // update PReady value when in access state to 1 when dv=1
    assign   PReady =   (state==S_Access) ? dv : 0;
   
   //with every change in AddrReg or Id_Data, update MemData 
    always_ff@(AddrReg, Id_Data)
        MemData = Mem[AddrReg];  
    
    // update AddrReg and DataReg with new incoming address and data values when Id_Addr=1 
    always_ff@(posedge PClk)begin
        AddrReg <=(Id_Addr)? PAddr  :16'bx;
        DataReg <=(Id_Addr)? PWData :16'bx;
    end
    
    // save data in DataReg into memory if Id_Data=1
    always_ff@(posedge PClk) begin 
         if(Id_Data) begin
            Mem[AddrReg]=DataReg;
           // $display("***Data %h Saved at location %h ***\n",Mem[AddrReg], AddrReg); //for debug
          end
    end
    
    always_ff@(posedge PClk, negedge PResetn)
        if(~PResetn) state <= S_Idle;
        else         state <= NextState;         
    
    always_comb begin
        Id_Addr =0;
        dv=0;
        en_Data=0;
        Id_Data=0;
        
        case(state)
        S_Idle:begin
        
                NextState = (PSelx)? S_Setup : S_Idle;      // stay in idle state till PSEl=1
                Id_Addr =   (PSelx)? 1 : 0;
               end
               
        S_Setup:begin
       
                NextState   = S_Access;                      // next state access 
                Id_Addr =   1;                               // save address and data on AddrReg and DataReg
                end
                
        S_Access:begin
                if (PWrite) begin
                  Id_Data=1;                                //enable saving data into memory
                  dv=1;                                     //set PReady to 1
                end
                else begin
                 
                  en_Data=1;                                // enable reading data from memory
                  dv=1;                                     //set PReady to 1
                    end
                 NextState = PReady ?  S_Idle : S_Access;   // stay in access state till PReady set 
                end
                
        default:NextState = S_Idle;
        endcase                            
     end     
endmodule
