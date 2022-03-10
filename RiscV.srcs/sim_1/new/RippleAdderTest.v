`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2022 03:01:02 PM
// Design Name: 
// Module Name: RippleAdderTest
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


module RippleAdderTest;
    // Inputs
    reg [3:0] a_i = 4'b0000;
    reg [3:0] b_i = 4'b0000;
    reg carry_i = 0;
    
    // Outputs
    wire [3:0] sum_o;
    wire carry_o;
    
    // UUT
    RippleAdder #(.BUS_WIDTH(4)) rippleAdder1 (
        .a_i(a_i), .b_i(b_i), .carry_i(carry_i),
        .sum_o(sum_o), .carry_o(carry_o)
    );
    
    // Test
    integer i = 0;
    integer j = 0;
    integer k = 0;
    
    initial begin
        for (i = 0; i < 2; i = i + 1) begin
            carry_i = i;
            
            for (j = 0; j < 16; j = j + 1) begin
                a_i = j;
                
                for (k = 0; k < 16; k = k + 1) begin
                    b_i = k;
                    #5;
                end
            end
        end
        
        $finish;
    end
endmodule
