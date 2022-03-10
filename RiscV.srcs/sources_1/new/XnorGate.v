`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 03:48:52 PM
// Design Name: 
// Module Name: XnorGate
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


module XnorGate #(
    parameter BUS_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] a_i,
    input [BUS_WIDTH - 1:0] b_i,
    output [BUS_WIDTH - 1:0] c_o
);
    wire [BUS_WIDTH - 1:0] xorValue;
    
    XorGate #(.BUS_WIDTH(BUS_WIDTH)) xor1(.a_i(a_i), .b_i(b_i), .c_o(xorValue));
    NotGate #(.BUS_WIDTH(BUS_WIDTH)) not1(.a_i(xorValue), .b_o(c_o));
endmodule
