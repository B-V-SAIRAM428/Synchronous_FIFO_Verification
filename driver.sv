`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 21:41:18
// Design Name: 
// Module Name: driver
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


class driver;
    mailbox gen2dri;
    virtual intf vif;
    transaction trans;
    event done;
    
    function new(mailbox gen2dri,virtual intf vif);
        this.gen2dri = gen2dri;
        this.vif = vif;
    endfunction
    
    task run();
        forever begin
            @(posedge vif.clk);
            if(vif.rst)begin
                vif.wr_data = 0;
                vif.wr_en = 0;
                vif.rd_en = 0;
            end else begin
                gen2dri.get(trans);
                trans.display();
                vif.wr_data = trans.wr_data;
                vif.wr_en = trans.wr_en;
                vif.rd_en = trans.rd_en;
                ->done;
            end
        end
    endtask
endclass