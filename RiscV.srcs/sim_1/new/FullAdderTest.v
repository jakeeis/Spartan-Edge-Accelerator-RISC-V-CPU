`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2022 01:06:00 PM
// Design Name: 
// Module Name: FullAdderTest
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


module FullAdderTest;
    // Inputs
    reg a_i = 1'b0;
    reg b_i = 1'b0;
    reg carry_i = 1'b0;
    
    // Outputs
    wire sum_o;
    wire carry_o;
    
    // UUT
    FullAdder fullAdder1(.a_i(a_i), .b_i(b_i), .carry_i(carry_i), .sum_o(sum_o), .carry_o(carry_o));
    
    // Test
    integer i = 0;
    integer j = 0;
    integer k = 0;
    
    initial begin
        for (i = 0; i < 2; i = i + 1) begin
            carry_i = i;
            
            for (j = 0; j < 2; j = j + 1) begin
                a_i = j;
                
                for (k = 0; k < 2; k = k + 1) begin
                    b_i = k;
                    #5;
                end
            end
        end
        
        #5 $finish;
    end
endmodule
