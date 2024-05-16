`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2024 08:32:30 PM
// Design Name: 
// Module Name: SubBytes
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


module SubBytes(clk, state_in, state_out);
    input     [127:0] state_in;
    input     clk;
    output    [127:0] state_out;
//    output leakage_trigger;
    
    genvar i;
    generate
    for(i=0;i<128;i=i+8) 
    begin
        S sbox(.clk(clk), .in(state_in[i +: 8]), .out(state_out[i +: 8]));
    end
    endgenerate
endmodule
