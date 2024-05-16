`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2024 08:18:39 PM
// Design Name: 
// Module Name: subBytes_tb
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


module subBytes_tb();
parameter SYS_PERIOD = 10;    //clk 100M, 10ns (fixed)
reg [127:0] state_in;
wire [127:0] state_out;
reg clk;

//clock generation (fixed)
    initial begin
        clk = 0;
        forever
        #(SYS_PERIOD/2) clk = ~clk;
    end

SubBytes sb(.clk(clk), .state_in(state_in), .state_out(state_out));

initial begin
$monitor("input= %h, output= %h", state_in, state_out);
state_in=128'h_193de3be_a0f4e22b_9ac68d2a_e9f84808;
#10;
state_in=128'h_a49c7ff2_689f352b_6b5bea43_026a5049;
#10;
state_in=128'h_aa8f5f03_61dde3ef_82d24ad2_6832469a;
#10;
$finish;
end
endmodule
