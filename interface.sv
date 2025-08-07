`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 20:15:25
// Design Name: 
// Module Name: interface
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

interface intf(input clk, rst);
    logic [7:0] wr_data;
    logic wr_en;
    logic rd_en;
    logic full;
    logic empty;
    logic [7:0] rd_data;
    logic rd_valid;   
endinterface