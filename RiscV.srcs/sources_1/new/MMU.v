`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 03:24:03 PM
// Design Name: 
// Module Name: MMU
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


module MMU #(
    parameter BUS_WIDTH = 32
)(
    input [BUS_WIDTH - 1:0] inst_i,
    output [BUS_WIDTH - 1:0] rs1_o,
    output [BUS_WIDTH - 1:0] rs2_o,
    output sub_o,
    output ctrl_o
);
    
endmodule
