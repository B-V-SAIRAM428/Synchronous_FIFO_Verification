`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 11:25:21
// Design Name: 
// Module Name: environment
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


class environment;
    generator gen;
    driver dri;
    mailbox gen2dri;
    virtual intf vif;
    
    function new(virtual intf vif);
          this.vif = vif;
          gen2dri = new();
           gen = new(gen2dri);
           dri = new(gen2dri,vif);
    endfunction  
    
    task run();
        fork
            gen.run();
            dri.run();
        join_none
    endtask
        
endclass

