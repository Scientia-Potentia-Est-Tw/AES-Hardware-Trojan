`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 07:03:30 PM
// Design Name: 
// Module Name: AES_encrypt_tb
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


module AES_encrypt_tb();
    parameter SYS_PERIOD = 5;    //clk 100M, 10ns (fixed)
    
    reg clk, rst;
    reg [127:0] state;
    reg [127:0] key;
    wire [127:0] out;
    
    //clock generation (fixed)
    initial begin
        clk = 0;
        forever begin
        #(SYS_PERIOD/2) clk = ~clk;
        end
    end
    
     AES_top DUT(.clk(clk), .rst(rst), .state(state), .key(key), .out(out));
    
    initial begin
        rst = 0;
        #10;
    end
    
    initial begin
        $monitor("state= %h, key= %h ,out= %h in the AES_encrypt_tb",state, key, out);
        state = 128'h3243f6a8_885a308d_313198a2_e0370734;
        key = 128'h2b7e1516_28aed2a6_abf71588_09cf4f3c;
    end
endmodule
