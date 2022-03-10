`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 08:00:00 AM
// Design Name: 
// Module Name: Multiplexer
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

module Multiplexer #(
    parameter BUS_WIDTH = 1,
    parameter ADDR_WIDTH = 1,
    
    parameter _INPUT_WIDTH = (BUS_WIDTH * (1 << ADDR_WIDTH)),
    parameter _HALF_WIDTH = (_INPUT_WIDTH / 2)
)(
    input [_INPUT_WIDTH - 1:0] inputVector_i,
    input [ADDR_WIDTH - 1:0] sel_i,
    output [BUS_WIDTH - 1:0] output_o
);
    wire [_HALF_WIDTH - 1:0] 
        upper = inputVector_i[
            _INPUT_WIDTH - 1
            :_HALF_WIDTH
        ], 
        lower = inputVector_i[
            _HALF_WIDTH - 1
            :0
        ];
        
    wire [BUS_WIDTH - 1:0] 
        upperOut, lowerOut, 
        sel, notSel,
        upperAndSel, lowerAndNotSel;
    
    generate
        if(ADDR_WIDTH == 1) begin
            assign upperOut = upper;
            assign lowerOut = lower;
        end else begin
            Multiplexer #(.BUS_WIDTH(BUS_WIDTH), .ADDR_WIDTH(ADDR_WIDTH - 1)) 
                mux1(.inputVector_i(upper), .sel_i(sel_i[ADDR_WIDTH - 2:0]), .output_o(upperOut));
            Multiplexer #(.BUS_WIDTH(BUS_WIDTH), .ADDR_WIDTH(ADDR_WIDTH - 1)) 
                mux2(.inputVector_i(lower), .sel_i(sel_i[ADDR_WIDTH - 2:0]), .output_o(lowerOut));
        end
    endgenerate
    
    assign sel = {BUS_WIDTH{sel_i[ADDR_WIDTH - 1]}};
    
    AndGate #(.BUS_WIDTH(BUS_WIDTH)) 
        and1(.a_i(upperOut), .b_i(sel), .c_o(upperAndSel));
    
    NotGate #(.BUS_WIDTH(BUS_WIDTH))
        not1(.a_i(sel), .b_o(notSel));
    AndGate #(.BUS_WIDTH(BUS_WIDTH))
        and2(.a_i(lowerOut), .b_i(notSel), .c_o(lowerAndNotSel));
    
    OrGate #(.BUS_WIDTH(BUS_WIDTH))
        or1(.a_i(upperAndSel), .b_i(lowerAndNotSel), .c_o(output_o));
endmodule
