`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2022 02:25:11 PM
// Design Name: 
// Module Name: RippleAdder
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


module RippleAdder #(
    BUS_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] a_i,
    input [BUS_WIDTH - 1:0] b_i,
    input carry_i,
    output [BUS_WIDTH - 1:0] sum_o,
    output carry_o
);
    generate
        wire carry;
        
        if (BUS_WIDTH === 1) begin
            assign carry = carry_i;
        end else begin
            RippleAdder #(.BUS_WIDTH(BUS_WIDTH - 1)) rippleAdder1(
                .a_i(a_i[BUS_WIDTH - 2:0]), .b_i(b_i[BUS_WIDTH - 2:0]), .carry_i(carry_i),
                .sum_o(sum_o[BUS_WIDTH - 2:0]), .carry_o(carry)
            );
        end
        
        FullAdder fullAdder1(
            .a_i(a_i[BUS_WIDTH - 1]), .b_i(b_i[BUS_WIDTH - 1]), .carry_i(carry),
            .sum_o(sum_o[BUS_WIDTH - 1]), .carry_o(carry_o)
        );
    endgenerate 
endmodule
