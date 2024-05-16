`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 11:41:31 AM
// Design Name: 
// Module Name: one_round_tb
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


module one_round_tb();

    parameter SYS_PERIOD = 10;    //clk 100M, 10ns (fixed)
    
    reg clk;
    reg [127:0] state_in, key;
    wire [127:0] state_out;
    reg    [127:0] s0, k0;
    wire   [127:0] s1, s2, s3, s4, s5, s6, s7, s8, s9,
                   k1, k2, k3, k4, k5, k6, k7, k8, k9;
    
    //clock generation (fixed)
    initial begin
        clk = 0;
        forever
        #(SYS_PERIOD/2) clk = ~clk;
    end
    
    one_round r1(.clk(clk), .state_in(state_in), .key(key), .state_out(s1));
    one_round r2 (.clk(clk), .state_in(s1), .key(key), .state_out(s2));
    one_round r3 (.clk(clk), .state_in(s2), .key(key), .state_out(s3));
    one_round r4 (.clk(clk), .state_in(s3), .key(key), .state_out(s4));
    one_round r5 (.clk(clk), .state_in(s4), .key(key), .state_out(s5));
    one_round r6 (.clk(clk), .state_in(s5), .key(key), .state_out(s6));
    one_round r7 (.clk(clk), .state_in(s6), .key(key), .state_out(s7));
    one_round r8 (.clk(clk), .state_in(s7), .key(key), .state_out(s8));
    one_round r9 (.clk(clk), .state_in(s8), .key(key), .state_out(s9));
    
    initial begin
//    s0 <= state_in ^ key;
//    k0 <= key;
    $monitor("state_in1=%h, key1=%h, state_out1=%h", state_in, key, s9);
    state_in=128'h3243f6a8_885a308d_313198a2_e0370734;
    key=128'h2b7e1516_28aed2a6_abf71588_09cf4f3c;
    end
endmodule
