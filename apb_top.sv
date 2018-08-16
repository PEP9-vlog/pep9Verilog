`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portlnd State University 2018
// Engineer: Sanika Chaoji
// 
// Create Date: 07/12/2018 11:55:14 PM
// Design Name: pep9_apb
// Module Name: apb_top
// Project Name: Pep9
// Target Devices: 
// Tool Versions: 
// Description: The Advanced Peripheral Bus (APB) protocol is organised in two modules: ProcIntThread and MemIntThread.
//              This module instantiates the two modules. This module contains the bus signals, clock and reset, address, we, writeData and readData
 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module apb_top (
    input logic     sysclk,
    input logic     [15:0]  address,
    input logic     [7:0]   writeData,
    input logic     we,
    output logic    [7:0]  readData,
    output logic    done
    );


logic   PClk , PResetn=0, PSelx;
tri     PReady, PEnable, PWrite;
tri     [15:0] PAddr;
tri     [7:0]  PWData;
tri     [7:0]   PRData;
logic  [7:0]    dataOut;
assign done = (PReady)? 1:  0,          // if PReady =1 -> done =1; else done=0
        readData = (we)? 8'bxx :  dataOut;        

initial begin
 #2 PResetn=1;
 end

// creating ProcIntThread module instance- APB_Master
ProcIntThread   APB_Master(
    .sysclk(sysclk),
    .addr(address),
    .dataIn(writeData),
    .dataOut(dataOut),
    .we(we),
    .PClk(PClk),                
    .PResetn(PResetn),          
    .PAddr(PAddr),                 
    .PSelx(PSelx),           
    .PEnable(PEnable),         
    .PWrite(PWrite),           
    .PWData(PWData),    
    .PReady(PReady),          
    .PRData(PRData)
    );

// creating MemIntThread module instance- APB_Slave    
MemIntThread    APB_Slave(
    .PClk(PClk),             
    .PResetn(PResetn),          
    .PAddr(PAddr),     
    .PSelx(PSelx),            
    .PEnable(PEnable),          
    .PWrite(PWrite),           
    .PWData(PWData),    
    .PReady(PReady),          
    .PRData(PRData)
    );

endmodule
