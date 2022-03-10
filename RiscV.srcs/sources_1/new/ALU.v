`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2022 01:17:38 AM
// Design Name: 
// Module Name: ALU
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


module ALU #(
    parameter BUS_WIDTH = 1,
    parameter CTRL_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] rs1_i,
    input [BUS_WIDTH - 1:0] rs2_i,
    input [CTRL_WIDTH - 1:0] ctrl_i,
    input sub_i,
    output [BUS_WIDTH - 1:0] rd_o,
    output carry_o
);
    wire [BUS_WIDTH - 1:0]
        adderValue, andValue, xorValue, orValue,
        notRs2, rs2Sel;
        
    // Subtract
    NotGate #(.BUS_WIDTH(BUS_WIDTH))
        not1(.a_i(rs2_i), .b_o(notRs2));
    Multiplexer #(.BUS_WIDTH(BUS_WIDTH), .ADDR_WIDTH(1))
        mux1(
            .inputVector_i({
                notRs2, // 1'b1
                rs2_i   // 1'b0
            }),
            .sel_i(sub_i),
            .output_o(rs2Sel)
        );
    
    // Adder
    RippleAdder #(.BUS_WIDTH(BUS_WIDTH))
        rippleAdder1(
            .a_i(rs1_i), .b_i(rs2Sel), .carry_i(sub_i),
            .sum_o(adderValue), .carry_o(carry_o)
        );
    
    // Boolean Logic
    AndGate #(.BUS_WIDTH(BUS_WIDTH))
        and1(.a_i(rs1_i), .b_i(rs2_i), .c_o(andValue));
    XorGate #(.BUS_WIDTH(BUS_WIDTH))
        xor1(.a_i(rs1_i), .b_i(rs2_i), .c_o(xorValue));
    OrGate #(.BUS_WIDTH(BUS_WIDTH))
        or1(.a_i(rs1_i), .b_i(rs2_i), .c_o(orValue));
        
    // Set less than / compare
    // shift
    
    Multiplexer #(.BUS_WIDTH(BUS_WIDTH), .ADDR_WIDTH(CTRL_WIDTH))
        mux2(
            .inputVector_i({
                orValue,    // 2'b11
                xorValue,   // 2'b10
                andValue,   // 2'b01
                adderValue  // 2'b00
            }),
            .sel_i(ctrl_i),
            .output_o(rd_o)
        );
endmodule
