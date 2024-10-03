`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2024 07:10:57 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory
#(  
    parameter ADDR_BUS_WIDTH = 32,
    parameter DATA_BUS_WIDTH = 32)
(
    input clk,
    input [ADDR_BUS_WIDTH - 1:0] A,
    input [DATA_BUS_WIDTH - 1:0] WD,
    input WE,
    input [DATA_BUS_WIDTH - 1:0] RD
);
    
    
endmodule
