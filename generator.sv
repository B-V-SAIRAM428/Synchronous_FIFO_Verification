`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 20:24:56
// Design Name: 
// Module Name: generator
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
class generator;
    mailbox gen2dri;
    transaction trans;
    int wr_count =520 ;
    int rd_count =0 ;
    int total= wr_count + rd_count;
    function new(mailbox gen2dri);
        this.gen2dri = gen2dri;
    endfunction
    
    task run();
        int j, s;
        for(int i=0; i<total; i++) begin            
            trans = new();
            if (j < wr_count) begin
                trans.randomize() with {wr_en == 1 && rd_en ==0;};
               j=j+1;
            end    
            
            else if ( s<rd_count) begin
                trans.wr_data = 0;
                trans.rd_en = 1;
                trans.wr_en = 0;
                s=s+1;
            end
            gen2dri.put(trans);
            trans.display();
        end
    endtask
endclass