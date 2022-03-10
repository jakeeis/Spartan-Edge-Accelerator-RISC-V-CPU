`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 03:53:25 PM
// Design Name: 
// Module Name: CPU
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


module CPU #(
    parameter BUS_WIDTH = 32,
    parameter REG_ADDR_WIDTH = 5
)(
    input clk_i
);
    wire [BUS_WIDTH - 1:0] rs1, rs2, rd;
    wire [REG_ADDR_WIDTH - 1:0] rs1Addr, rs2Addr, rdAddr;
    wire [1:0] ctrl;
    wire carry, sub, writeEnable;
    
    // Remove later
    reg [BUS_WIDTH - 1:0] inst = 32'h003100b3; 
    
    RegisterPage #(.BUS_WIDTH(BUS_WIDTH), .ADDR_WIDTH(REG_ADDR_WIDTH))
        regPage1(
            .clk_i(clk), .writeEnable_i(writeEnable),
            .rs1Addr_i(rs1Addr), .rs2Addr_i(rs2Addr), .rdAddr_i(rdAddr), .dataIn_i(rd),
            .rs1_o(rs1), .rs2_o(rs2)
        );
    
    InstructionDecoder #(.BUS_WIDTH(BUS_WIDTH), .CTRL_WIDTH(2))
        instDecoder1(
            .inst_i(inst),
            .rs1Addr_o(rs1Addr), .rs2Addr_o(rs2Addr), .rdAddr_o(rdAddr),
            .ctrl_o(ctrl), .sub_o(sub), .writeEnable_o(writeEnable)
        );
    
    ALU #(.BUS_WIDTH(BUS_WIDTH), .CTRL_WIDTH(2))
        alu1(
            .rs1_i(rs1), .rs2_i(rs2), .ctrl_i(ctrl), .sub_i(sub),
            .rd_o(rd), .carry_o(carry)
        );
endmodule
