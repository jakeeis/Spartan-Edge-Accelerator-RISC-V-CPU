`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 07:29:44 AM
// Design Name: 
// Module Name: XorGate
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


module XorGate #(
    parameter BUS_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] a_i,
    input [BUS_WIDTH - 1:0] b_i,
    output [BUS_WIDTH - 1:0] c_o
);
    wire [BUS_WIDTH - 1:0] orOutput, nandOutput;
    
    OrGate #(.BUS_WIDTH(BUS_WIDTH)) or1(.a_i(a_i), .b_i(b_i), .c_o(orOutput));
    NandGate #(.BUS_WIDTH(BUS_WIDTH)) nand1(.a_i(a_i), .b_i(b_i), .c_o(nandOutput));
    
    AndGate #(.BUS_WIDTH(BUS_WIDTH)) and1(.a_i(orOutput), .b_i(nandOutput), .c_o(c_o));
endmodule
