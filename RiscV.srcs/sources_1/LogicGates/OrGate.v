`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 07:29:43 AM
// Design Name: 
// Module Name: OrGate
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


module OrGate#(
    parameter BUS_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] a_i,
    input [BUS_WIDTH - 1:0] b_i,
    output [BUS_WIDTH - 1:0] c_o
);
    wire [BUS_WIDTH - 1:0] notA, notB;
    
    NotGate #(.BUS_WIDTH(BUS_WIDTH)) not1(.a_i(a_i), .b_o(notA));
    NotGate #(.BUS_WIDTH(BUS_WIDTH)) not2(.a_i(b_i), .b_o(notB));
    
    NandGate #(.BUS_WIDTH(BUS_WIDTH)) nand1(.a_i(notA), .b_i(notB), .c_o(c_o));
endmodule
