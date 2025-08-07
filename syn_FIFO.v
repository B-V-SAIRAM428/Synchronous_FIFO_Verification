`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2024 15:53:04
// Design Name: 
// Module Name: syn_FIFO
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


module syn_FIFO(
    input clk,
    input rst,
    input [7:0] wr_data,
    input wr_en,
    input rd_en,
    output reg full,
    output reg empty,
    output reg[7:0] rd_data,
    output reg rd_valid
    );
reg [7:0] FIFO_data[0:511];
reg [8:0] wr_ptr,rd_ptr;
integer i;
always @(posedge clk ) begin
    if (rst) begin
        wr_ptr<=9'b0;
        full<=1'b0;
        for (i=0; i<512; i=i+1) begin
            FIFO_data[i]=8'd0;
        end
    end else if (wr_ptr-rd_ptr==511 && wr_en==1'b1) begin
        FIFO_data[wr_ptr]<=wr_data;
        wr_ptr<=wr_ptr+1;
        full<=1;
    end else if (rd_ptr-wr_ptr==1 && wr_en==1) begin
        FIFO_data[wr_ptr]<=wr_data;
        wr_ptr<=wr_ptr+1;
        full<=1;
    end else if (wr_en==1 && !full) begin
        FIFO_data[wr_ptr]=wr_data;
        wr_ptr<=wr_ptr+1;
        full<=0;
    end else if (rd_ptr==wr_ptr && rd_en==1) 
        full<=0;
   
end
always @(posedge clk) begin
    if (rst) begin 
        rd_ptr<=9'd0;
        rd_valid<=1'b0;
        rd_data<=8'd0;
        empty<=1;
    end else if (rd_en==1 && rd_ptr-wr_ptr==511) begin 
        rd_data<= FIFO_data[rd_ptr];
        rd_ptr<=rd_ptr+1; 
        rd_valid<=1;
        empty<=1;
    end else if (rd_en==1 && wr_ptr-rd_ptr==1 ) begin 
        rd_data<= FIFO_data[rd_ptr];
        rd_ptr<=rd_ptr+1; 
        rd_valid<=1;
        empty<=1;
    end else if (rd_en==1 && !empty) begin
        rd_data<= FIFO_data[rd_ptr];
        rd_ptr<=rd_ptr+1; 
        rd_valid<=1;
        empty<=0;
    end else if ((wr_ptr == rd_ptr) && wr_en==1) 
        empty<=0;
    
        
end
endmodule
