`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State University 2018
// Engineer: Sanika Chaoji
// 
// Create Date: 07/24/2018 04:26:58 PM
// Design Name: Test bench for apb_top module
// Module Name: TB_apb
// Project Name: Pep9 
// Target Devices: 
// Tool Versions: 
// Description: 
//  This module is a test bench written for apb_top module. This module contains 
//  three tasks: write(), readByte() and readInstruction() that allow user to read
//  or write to memory over APB bus. The module initialises apb_top module.
//  PS: The delays in the tasks (eg #2) must be replaced by a delay function before 
 //      systhesis, if reusing in your application 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module clock(
    output bit sysclk);
    initial 
        forever #1 sysclk = ~sysclk;
        
endmodule

//Test bench 
module TB_apb;

    bit sysclk;
    logic [15:0]    address;
    logic [7:0]     writeData;
    logic [7:0]    readData;
    logic [7:0]    temp;
    logic we;
    logic done;
       
    
    initial begin
    $monitor("Address       WE          DataIn          Done        DataOut     ");
    $monitor("%h            %b           %h             %b           %h         ",address, we, writeData, done, readData); //in Tcl console, read data for done=1
    // 1. Test writing 
        write(16'h0405, 8'h11);
    // 2. Test reading a byte  
        readByte(16'h0405, temp);
    // 3. Test continues writing
        write(16'h0406, 8'hab);
        write(16'h0407, 8'hcd);
        write(16'h0408, 8'hef);
    // 4. Test continuous writing followed by continuous reading in random order    
        readByte(16'h0407, temp);
        readByte(16'h0406, temp);
        readByte(16'h0405, temp);
        readByte(16'h0408, temp);
    // 5. Test reading 3 bytes    
       // readInstruction(16'h0405, temp);
       // readInstruction(16'h0406, temp);
       
    // 6. Writing to all memory locations and read all
     for(int i=0; i<=16'hffff; i++)
        write(i, i[7:0]);
               
     for(int i=0; i<=16'hffff; i++) begin
        readByte (i, temp);
        if (temp!=i[7:0]) $display("*********Oops!!... memory location %h read %h instead of %h *******", i, temp, i[7:0]); 
     end
        
    // 7. Write a memory location and check for all the memory locations impacted
    
      write( 16'h0123, 8'hff);
         for(int i=0; i<=16'hffff; i++) begin
           readByte (i, temp);
           if (temp!=i[7:0]) $display("*********Memory Altered! Memory location %h read %h instead of %h *******", i, temp, i[7:0]); 
         end
        
    // 8. Write and read with random time intervals
            write(16'h0000, 8'hab);
         #50   write(16'h0006, 8'hcd);
            write(16'h0008, 8'hef);
            write(16'h0001, 8'hab);
         #11   write(16'h0003, 8'hcd);
            write(16'h0005, 8'hef);
            readByte(16'h0004, temp);
         #75   readByte(16'h0001, temp);
            readByte(16'h0003, temp);
            readByte(16'h0008, temp); 
        #13   write(16'h0002, 8'hcd);
            write(16'h0004, 8'hef);
        
        $finish;
    end
    
    //Instantiating clock
    clock C1 (.sysclk(sysclk));
    
    //**************************************************************************************
    // write() 
    // Task for writing data to the memory over APB
    // this task can be included in application top layer using APB protocol
    //IMP: replace #2 with a delay function
    //**************************************************************************************
    task write  (input logic [15:0] addr, 
                 input logic [7:0] data);
        address     <= addr;
        writeData   <= data;
        we          <= 1;                    // set write enable
        @(posedge done) begin               // wait for done signal from slave
        #2                                  
          address   <= 16'bx;
          writeData <= 8'bx;
        end
       
    endtask    
    
    //**************************************************************************************
    // readByte() 
    // Task for reading  data from the memory over APB stored at address addr
    // this task can be included in application top layer using APB protocol
    //IMP: replace #2 with a delay function
    //**************************************************************************************
     task readByte(input logic [15:0] addr,
                   output logic [7:0] data);
        address     <= addr;
        we          <= 0;
        @(negedge done)                     //wait for done
       #2 data      = readData;      
       //debug code
      // $display("***Data read: %h from address %h ***\n",data,addr );
    endtask    
      
      
    /*
    //**************************************************************************************
    // readInstruction() 
    // Task for reading 3 Bytes of data from the memory over APB starting at address addr
    //**************************************************************************************
    task readInstruction(input logic [15:0] addr,
                         output logic [23:0] data);
        address     = addr;
        we          = 0;                   // write disabled
        @(posedge done)                    // wait for done signal from slave
       #2 data      = readData;
       //debug code            
        $display("***Data read: %h starting address %h ***\n",data, addr);
        
    endtask    
    */
    
    
        
    //Creating apb_top module instance 'Myapb'   
    apb_top  MyApb(
            .sysclk(sysclk),
            .address(address),
            .writeData(writeData),
            .we(we),
            .readData(readData),
            .done(done)
            );
            
            
            
endmodule
