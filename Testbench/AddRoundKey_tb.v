`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2024 10:35:33 AM
// Design Name: 
// Module Name: AddRoundKey_tb
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


module AddRoundKey_tb();
reg [127:0] state_in;
reg [127:0] key;
wire [127:0] state_out;

AddRoundKey ARK(.state_in(state_in), .state_out(state_out), .key(key));

initial begin
	$monitor("input= %H, output= %h, key = %h", state_in, state_out, key);
	state_in = 128'h_046681e5_e0cb199a_48f8d37a_2806264c;
	key = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
end
endmodule
