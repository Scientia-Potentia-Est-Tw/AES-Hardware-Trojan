`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2024 10:23:46 AM
// Design Name: 
// Module Name: ShiftRows_tb
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


module ShiftRows_tb();
reg [127:0] in;
wire [127:0] out;

ShiftRows SR(.state_in(in), .state_out(out));

initial begin
$monitor("input= %H , output= %h",in,out);
	in = 128'h_d42711ae_e0bf98f1_b8b45de5_1e415230;
	#10;
	in = 128'h_49ded289_45db96f1_7f39871a_7702533b;
	#10;
	in = 128'h_ac73cf7b_efc111df_13b5d6b5_45235ab8;
end
endmodule
