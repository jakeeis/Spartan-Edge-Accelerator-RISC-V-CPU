`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2022 10:36:06 PM
// Design Name: 
// Module Name: DemultiplexerTest
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


module DemultiplexerTest;
    // Inputs
    reg [1:0] input_i = 2'b10;
    reg [1:0] sel_i = 2'b00;
    
    // Outputs
    wire [7:0] outputVector_o;
    
    // UUT
    Demultiplexer #(.BUS_WIDTH(2), .ADDR_WIDTH(2)) 
        dux1(.input_i(input_i), .sel_i(sel_i), .outputVector_o(outputVector_o));
        
    // Test
    integer i = 0;
    
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            sel_i = i;
            #5;
        end
        
        $finish;
    end
    
endmodule
