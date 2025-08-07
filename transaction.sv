`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 20:19:52
// Design Name: 
// Module Name: transaction
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


class transaction;
    rand bit [7:0] wr_data;
    rand bit wr_en;
    rand bit rd_en;
    bit full;
    bit empty;
    bit [7:0] rd_data;
    bit rd_valid; 
    
    function void display();
        $display("The wr_data:%0d, wr_en:%0d, rd_en:%0d", wr_data,wr_en,rd_en);
    endfunction
endclass
