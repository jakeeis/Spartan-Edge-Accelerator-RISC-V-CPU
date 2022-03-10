`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2022 10:47:50 AM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder (
    input a_i,
    input b_i,
    input carry_i,
    output sum_o,
    output carry_o
);
    wire abSum, abCarry, abcCarry;
    
    XorGate xor1(.a_i(a_i), .b_i(b_i), .c_o(abSum));
    AndGate and1(.a_i(a_i), .b_i(b_i), .c_o(abCarry));
    
    XorGate xor2(.a_i(abSum), .b_i(carry_i), .c_o(sum_o));
    AndGate and2(.a_i(abSum), .b_i(carry_i), .c_o(abcCarry));
    
    OrGate or1(.a_i(abCarry), .b_i(abcCarry), .c_o(carry_o));
endmodule
