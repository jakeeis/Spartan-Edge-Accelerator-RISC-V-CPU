`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 08:41:45 PM
// Design Name: 
// Module Name: AndGateTest
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


module AndGateTest;
    // Input
    reg [1:0] a_i = 2'b00;
    reg [1:0] b_i = 2'b00;
    
    // Output
    wire [1:0] c_o;
    
    // UUT
    AndGate #(.BUS_WIDTH(2))
        and1(.a_i(a_i), .b_i(b_i), .c_o(c_o));
        
    integer i = 0;
    integer j = 0;
    
    // Test
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            #5 a_i = i;
            
            for (j = 0; j < 4; j = j + 1) begin
                #5 b_i = j;
            end
        end
        
        #5 $finish;
    end
    
endmodule