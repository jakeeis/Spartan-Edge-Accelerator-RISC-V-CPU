`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 02:00:48 PM
// Design Name: 
// Module Name: ALUTest
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

module ALUTest;
    // Inputs
    reg [3:0] rs1_i = 4'b0001;
    reg [3:0] rs2_i = 4'b0011;
    reg [1:0] ctrl_i = 2'b00;
    reg sub_i = 0;
    
    // Outputs
    wire [3:0] rd_o;
    
    // UUT
    ALU #(.BUS_WIDTH(4), .CTRL_WIDTH(2))
        alu1(
            .rs1_i(rs1_i), .rs2_i(rs2_i), .ctrl_i(ctrl_i), .sub_i(sub_i),
            .rd_o(rd_o)
        );
    
    // Test
    initial begin
        // Add
        #5;
        
        // Subtract
        sub_i = 1;
        #5;
        
        // And
        ctrl_i = 2'b01;
        sub_i = 0;
        #5;
        
        // Or
        ctrl_i = 2'b10;
        #5;
        
        // Xor
        ctrl_i = 2'b11;
        #5;
        
        $finish;
    end
    
    
endmodule
