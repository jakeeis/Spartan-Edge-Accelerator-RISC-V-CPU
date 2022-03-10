`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 02:01:51 PM
// Design Name: 
// Module Name: Top
// Project Name: 
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
`define BUS_WIDTH 32

module Top();
    CPU #(.BUS_WIDTH(`BUS_WIDTH)) 
        cpu1();
//    MMU #(.BUS_WIDTH(`BUS_WIDTH))
//        mmu1();
endmodule
