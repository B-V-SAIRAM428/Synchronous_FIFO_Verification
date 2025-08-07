`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 11:33:49
// Design Name: 
// Module Name: test
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


class test;
    environment env;
    virtual intf vif;
    
    function new(virtual intf vif);
        this.vif = vif;
        env = new(vif);
    endfunction
    
    task run();
        env.run();
    endtask
endclass