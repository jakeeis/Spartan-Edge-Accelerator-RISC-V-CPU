`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 07:29:44 AM
// Design Name: 
// Module Name: AndGate
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


module AndGate #(
    parameter BUS_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] a_i,
    input [BUS_WIDTH - 1:0] b_i,
    output [BUS_WIDTH - 1:0] c_o
);
    wire [BUS_WIDTH - 1:0] nandOutput;
    
    NandGate #(.BUS_WIDTH(BUS_WIDTH)) nand1(.a_i(a_i), .b_i(b_i), .c_o(nandOutput));
    NotGate #(.BUS_WIDTH(BUS_WIDTH)) not1(.a_i(nandOutput), .b_o(c_o));
endmodule
