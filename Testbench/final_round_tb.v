`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 04:29:21 PM
// Design Name: 
// Module Name: final_round_tb
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


module final_round_tb();
parameter SYS_PERIOD = 10;    //clk 100M, 10ns (fixed)
    
    reg clk;
    reg [127:0] state_in, key_in;
    wire [127:0] state_out;
    
    //clock generation (fixed)
    initial begin
        clk = 0;
        forever
        #(SYS_PERIOD/2) clk = ~clk;
    end
    
    final_round b (.clk(clk), .state_in(state_in), .key_in(key_in), .state_out(state_out));
    
    initial begin
    $monitor("state_in=%h, key_in=%h, state_out=%h", state_in, key_in, state_out);
    state_in=128'h3243f6a8_885a308d_313198a2_e0370734;
    key_in=128'h2b7e1516_28aed2a6_abf71588_09cf4f3c;
    end
endmodule
