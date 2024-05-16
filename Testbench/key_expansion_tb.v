`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 07:13:31 PM
// Design Name: 
// Module Name: key_expansion_tb
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


module key_expansion_tb();
    parameter SYS_PERIOD = 10;    //clk 100M, 10ns (fixed)
    
    reg clk;
    reg [127:0] state_in, key_in;
    wire [127:0] state_out;
    reg    [127:0] s0, k0;
    wire   [127:0] s1, s2, s3, s4, s5, s6, s7, s8, s9,
                   k1, k2, k3, k4, k5, k6, k7, k8, k9, k10,
                   k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b, k8b, k9b;
    
    //clock generation (fixed)
    initial begin
        clk = 0;
        forever
        #(SYS_PERIOD/2) clk = ~clk;
    end





    expand_key_128 a1 (.clk(clk), .in(key_in), .out_1(k1), .out_2(k0b), .rcon(8'h1));
    expand_key_128 a2 (.clk(clk), .in(k1), .out_1(k2), .out_2(k1b), .rcon(8'h2));
    expand_key_128 a3 (.clk(clk), .in(k2), .out_1(k3), .out_2(k2b), .rcon(8'h4));
    expand_key_128 a4 (.clk(clk), .in(k3), .out_1(k4), .out_2(k3b), .rcon(8'h8));
    expand_key_128 a5 (.clk(clk), .in(k4), .out_1(k5), .out_2(k4b), .rcon(8'h10));
    expand_key_128 a6 (.clk(clk), .in(k5), .out_1(k6), .out_2(k5b), .rcon(8'h20));
    expand_key_128 a7 (.clk(clk), .in(k6), .out_1(k7), .out_2(k6b), .rcon(8'h40));
    expand_key_128 a8 (.clk(clk), .in(k7), .out_1(k8), .out_2(k7b), .rcon(8'h80));
    expand_key_128 a9 (.clk(clk), .in(k8), .out_1(k9), .out_2(k8b), .rcon(8'h1b));
    expand_key_128 a10 (.clk(clk), .in(k9), .out_1(k10), .out_2(k9b), .rcon(8'h36));
    
    initial begin
        $monitor("key = %h, out=%h", key_in, k0b);
        key_in = 128'h_00010203_04050607_08090a0b_0c0d0e0f;
    end

    
endmodule
