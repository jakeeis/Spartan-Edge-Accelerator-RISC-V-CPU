`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 03:24:03 PM
// Design Name: 
// Module Name: InstructionDecoder
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


module InstructionDecoder #(
    parameter BUS_WIDTH = 32,
    parameter CTRL_WIDTH = 2
)(
    input [BUS_WIDTH - 1:0] inst_i,
    output [BUS_WIDTH - 1:0] rs1Addr_o,
    output [BUS_WIDTH - 1:0] rs2Addr_o,
    output [BUS_WIDTH - 1:0] rdAddr_o,
    output [CTRL_WIDTH - 1:0] ctrl_o,
    output sub_o,
    output writeEnable_o
);
    wire [1:0] preable = inst_i[1:0];
    wire [4:0] opcode = inst_i[6:2];
    
    assign sub = inst_i[30];
    assign rs1Addr_o = inst_i[19:15];
    assign rs1Addr_o = inst_i[24:20];
    assign rdAddr_o = inst_i[7:11];
    // Change to 14:12 later
    assign ctrl_o = inst_i[13:12];
    
    assign writeEnable_o = 1;
endmodule
