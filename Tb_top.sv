`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 11:39:51
// Design Name: 
// Module Name: Tb_top
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

`include"test.sv"
`include"environment.sv"
`include"generator.sv"
`include"driver.sv"
`include"monitor.sv"
`include"scoreboard.sv"
`include"transaction.sv"
`include"interface.sv"

module Tb_top(

    );
    reg clk;
    reg rst;
     test t0;
     intf vif(clk,rst);
     syn_FIFO dut(.clk(clk),.rst(rst),.wr_data(vif.wr_data),.wr_en(vif.wr_en),.rd_en(vif.rd_en),.full(vif.full),.empty(vif.empty),.rd_data(vif.rd_data),.rd_valid(vif.rd_valid));
    
    always #5 clk = ~clk;
    
    initial begin
        clk=0; rst = 1; 
        #10 rst = 0;
        t0 = new(vif);
        t0.run();
        #200 $finish;
    end
endmodule
