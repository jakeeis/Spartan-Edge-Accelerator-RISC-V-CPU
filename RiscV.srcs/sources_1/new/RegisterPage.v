`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2022 01:10:00 PM
// Design Name: 
// Module Name: RegisterPage
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


module RegisterPage #(
    parameter BUS_WIDTH = 32,
    parameter ADDR_WIDTH = 5,
    parameter INIT_F = "MemInit.mem"
)(
    input clk_i,
    input writeEnable_i,
    input [ADDR_WIDTH - 1:0] rdAddr_i,
    input [ADDR_WIDTH - 1:0] rs1Addr_i,
    input [ADDR_WIDTH - 1:0] rs2Addr_i,
    input [BUS_WIDTH - 1:0] dataIn_i,
    output [BUS_WIDTH - 1:0] rs1_o,
    output [BUS_WIDTH - 1:0] rs2_o
);
    reg [BUS_WIDTH-1:0] memory [(2 << ADDR_WIDTH) - 1:0];
    reg [BUS_WIDTH-1:0] rs1 = 0, rs2 = 0;
    
    assign rs1_o = rs1;
    assign rs2_o = rs2;

    initial begin
        if (INIT_F != "") begin
            $readmemh(INIT_F, memory);
        end
    end

    // rs1 & rs2 - Read
    always @(posedge clk_i) begin
        rs1 <= rs1Addr_i == 0 ? 0 : memory[rs1Addr_i];
        rs2 <= rs2Addr_i == 0 ? 0 : memory[rs2Addr_i];
    end
    
    // rd - Write
    always @(negedge clk_i) begin
        if (writeEnable_i) begin
            memory[rdAddr_i] <= dataIn_i;
        end
    end
endmodule

