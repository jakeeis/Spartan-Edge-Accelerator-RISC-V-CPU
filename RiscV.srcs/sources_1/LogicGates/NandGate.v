`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 07:29:43 AM
// Design Name: 
// Module Name: NandGate
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


module NandGate#(
    parameter BUS_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] a_i,
    input [BUS_WIDTH - 1:0] b_i,
    output [BUS_WIDTH - 1:0] c_o
);
    assign c_o = ~(a_i & b_i);
endmodule
