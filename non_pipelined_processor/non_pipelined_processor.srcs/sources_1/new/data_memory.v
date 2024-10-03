`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: RISC_Processor
// Engineer: Linuka Ratnayake
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
        input [ADDR_BUS_WIDTH - 1:0] addr,
        input [DATA_BUS_WIDTH - 1:0] write_data,
        input write_en,
        input [DATA_BUS_WIDTH - 1:0] read_data
    );
        
    localparam MEM_DEPTH = 1024;

    reg [DATA_BUS_WIDTH - 1:0] mem [0:MEM_DEPTH - 1];

    assign read_data = mem[addr];

    always @(posedge clk)
    begin
        if(write_en)
        begin
            mem[addr] <= write_data;
        end
    end
    
endmodule
