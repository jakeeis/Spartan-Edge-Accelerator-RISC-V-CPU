`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 08:00:02 AM
// Design Name: 
// Module Name: Demultiplexer
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

`define OUTPUT_WIDTH (BUS_WIDTH * (1 << ADDR_WIDTH))
`define HALF_WIDTH (`OUTPUT_WIDTH / 2)

module Demultiplexer #(
    parameter BUS_WIDTH = 1,
    parameter ADDR_WIDTH = 1
)(
    input [BUS_WIDTH - 1:0] input_i,
    input [ADDR_WIDTH - 1:0] sel_i,
    output [`OUTPUT_WIDTH - 1:0] outputVector_o
);
    wire [`HALF_WIDTH - 1:0] 
        upper, lower,
        upperOut, lowerOut,
        sel, notSel;
        
    assign sel = {`HALF_WIDTH{sel_i[ADDR_WIDTH - 1]}};
    NotGate #(.BUS_WIDTH(`HALF_WIDTH)) not1(.a_i(sel), .b_o(notSel));
    
    AndGate #(.BUS_WIDTH(`HALF_WIDTH)) 
        and1(.a_i(input_i), .b_i(sel), .c_o(upper));
    AndGate #(.BUS_WIDTH(`HALF_WIDTH)) 
        and2(.a_i(input_i), .b_i(notSel), .c_o(lower));
        
    assign outputVector_o = { upperOut, lowerOut };
        
    generate
        if (ADDR_WIDTH === 1) begin
            assign upperOut = upper;
            assign lowerOut = lower;
        end else begin
            Demultiplexer #(.BUS_WIDTH(BUS_WIDTH), .ADDR_WIDTH(ADDR_WIDTH - 1))
                dux1(
                    .input_i(upper), .sel_i(sel_i[ADDR_WIDTH - 2:0]),
                    .outputVector_o(upperOut)
                );
            Demultiplexer #(.BUS_WIDTH(BUS_WIDTH), .ADDR_WIDTH(ADDR_WIDTH - 1))
                dux2(
                    .input_i(lower), .sel_i(sel_i[ADDR_WIDTH - 2:0]),
                    .outputVector_o(lowerOut)
                );
        end
    endgenerate
endmodule
