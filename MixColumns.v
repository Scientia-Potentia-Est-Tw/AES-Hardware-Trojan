`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2024 10:26:03 AM
// Design Name: 
// Module Name: MixColumns
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


module MixColumns(clk, state_in, state_out);
input clk;
input [127:0] state_in;
output [127:0] state_out;

genvar j;
generate
for (j=0;j<128;j=j+8) begin
    xS MixColumns(.clk(clk), .in(state_in[j +: 8]), .out(state_out[j +: 8]));
end
endgenerate
endmodule
