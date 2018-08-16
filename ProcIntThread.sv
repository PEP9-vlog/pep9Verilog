`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     Portland State University 2018
// Engineer:    Sanika Chaoji
// 
// Create Date: 07/13/2018 12:04:02 AM
// Design Name: 
// Module Name: ProcIntThread
// Project Name: APB for Pep9 
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


module ProcIntThread(
    input logic sysclk,
    input logic [15:0] addr,
    input logic [7:0] dataIn,
    output logic [7:0] dataOut,
    input logic we,
    output logic PClk,             // Clock
    input logic PResetn,           // Reset. The APB reset signal is active LOW
    output logic [15:0] PAddr,     // Address. This is the APB address bus. It can be up to 32 bits wide
    output logic PSelx,            // Select. It indicates that the slave device is selected and that a data transfer is required
    output logic PEnable,          // Enable. This signal indicates the second and subsequent cycles of an APB transfer.
    output logic PWrite,           // Direction. This signal indicates an APB write access when HIGH and an APB read access when LOW
    output logic [7:0] PWData,     // Write data. This bus is driven by the peripheral bus bridge unit during write cycles when PWRITE is HIGH. This bus can be up to 32 bits wide
    input logic  PReady,           // Ready. The slave uses this signal to extend an APB transfer.
    input logic [7:0] PRData      // Read Data. The selected slave drives this bus during read cycles when PWRITE is LOW. This bus can be up to 32-bits wide.
    );
 
 
 assign PClk= sysclk;
 logic  dv, transfer;
 logic [15:0] AddReg, DataReg; 
 enum {M_Idle, M_Setup, M_Access} state, Nextstate;

// set transfer when any change in we, addr or dataIn  
 always@(we, addr, dataIn)
    transfer = 1;
    
// transfer completed on araival of PReady
 always@(posedge PReady)   
    transfer =0 ;
    
  
   assign PWData= (we) ? dataIn: 'bx;
   assign PWrite= (we) ? 1:0;
   assign PAddr = addr;
   
   always_latch begin
     if (PReady )begin
       if (we==0) 
            dataOut <= PRData;
        
     end
    end
     
   always_ff@(posedge PClk, negedge PResetn) 
       if (~PResetn) 
            state <= M_Idle;
       else state <= Nextstate ;
     
 //******************************************************************//
 // IDLE MODE  : PSelx = 0;  PENABLE=0; 
 // SETUP MODE : PSELx = 1;  PENABLE = 0;
 // ACCESS MODE: PSELx = 1;  PENABLE = 1;
 //*****************************************************************//
 
   always_comb begin

       case(state)
       M_Idle: begin
       // stay in idle stage until transfer initiated. On transfer=1 goto setup stage
              Nextstate    <= transfer ? M_Setup : M_Idle;
              PSelx         <=0;
              PEnable       <=0;
              
               end
       M_Setup:  begin
       // default next stage is access. Set PSelx=1
               Nextstate    <= M_Access;
               PSelx        <=1;
               PEnable      <=0;
               
               end
       M_Access: begin
       // set PEnable. Wait in access stage till PReady signal received from slave
       //Next state is idle is transfer completed. If another tranfer active go to setup state.
                PSelx       =1;  
                PEnable     =1;
                Nextstate   = (PReady)? (transfer ? M_Setup : M_Idle): M_Access;
                
               end
       default: Nextstate = M_Idle;
       endcase
      end 
       
 endmodule
