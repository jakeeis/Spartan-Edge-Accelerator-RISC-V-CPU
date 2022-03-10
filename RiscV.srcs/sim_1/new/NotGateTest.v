`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2022 07:38:00 AM
// Design Name: 
// Module Name: NotGateTest
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


module NotGateTest;
    // Input
    reg [1:0] a_i = 2'b00;
    
    // Output
    wire [1:0] b_o;
    
    // UUT
    NotGate #(.BUS_WIDTH(2))
        not1(.a_i(a_i), .b_o(b_o));
        
    integer i = 0;
    
    // Test
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            #5 a_i = i;
        end
        
        #5 $finish;
    end
    
endmodule