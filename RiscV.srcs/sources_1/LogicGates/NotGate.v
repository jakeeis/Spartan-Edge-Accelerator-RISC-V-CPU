`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 07:29:42 AM
// Design Name: 
// Module Name: NotGate
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


module NotGate#(
    parameter BUS_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] a_i,
    output [BUS_WIDTH - 1:0] b_o
);
    NandGate #(.BUS_WIDTH(BUS_WIDTH)) nand1(.a_i(a_i), .b_i(a_i), .c_o(b_o));
endmodule
