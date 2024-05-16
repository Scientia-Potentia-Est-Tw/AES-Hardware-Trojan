`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 03:59:20 PM
// Design Name: 
// Module Name: destory_HT_tb
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


module destory_HT_tb();
parameter SYS_PERIOD = 5;    //clk 100M, 10ns (fixed)
    
    reg clk, rst;
    reg [127:0] state;
    reg [127:0] key;
    wire [127:0] out;
    wire [127:0] destroy_trojan_out;
    //clock generation (fixed)
    initial begin
        clk = 0;
        forever begin
        #(SYS_PERIOD/2) clk = ~clk;
        end
    end
    
     AES_top DUT(.clk(clk), .rst(rst), .state(state), .key(key), .out(out), .destroy_trojan_out(destroy_trojan_out));
    
    initial begin
        rst = 0;
        #10;
    end
    
    initial begin
        $monitor("state= %h, key= %h ,out= %h, destroy_trojan_out=%h",state, key, out, destroy_trojan_out);
        state = 128'h3243f6a8_885a308d_313198a2_e0370734;
        key = 128'h2b7e1516_28aed2a6_abf71588_09cf4f3c;
        #100;
        state = 128'h00001111_22223333_44445555_66667777;
        key = 128'h00000000_ffff0000_0000ffff_0000ffff;
        #100;
        state = 128'h77777777_77777777_77777777_77777777;
        key = 128'h00001111_ffff0000_2222ffff_3333ffff;
        #100;
    end
endmodule
