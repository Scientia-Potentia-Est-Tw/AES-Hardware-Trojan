`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2024 10:19:05 AM
// Design Name: 
// Module Name: ShiftRows
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


module ShiftRows(state_in, state_out);
    input [127:0] state_in;
    output [127:0] state_out;

     //row 0 not shifted
     assign state_out[120 +: 8] = state_in[120 +: 8];
     assign state_out[88 +: 8] = state_in[88 +: 8];
     assign state_out[56 +: 8] = state_in[56 +: 8];
     assign state_out[24 +: 8] = state_in[24 +: 8];
     //row 1 shift 1 left offset
     assign state_out[112 +: 8] = state_in[80 +: 8];
     assign state_out[80 +: 8] = state_in[48 +: 8];
     assign state_out[48 +: 8] = state_in[16 +: 8];
     assign state_out[16 +: 8] = state_in[112 +: 8];
     //row 2 shift 2 left offset
     assign state_out[104 +: 8] = state_in[40 +: 8];
     assign state_out[72 +: 8] = state_in[8 +: 8];
     assign state_out[40 +: 8] = state_in[104 +: 8];
     assign state_out[8 +: 8] = state_in[72 +: 8];
     //row 3 shift 3 left offset
     assign state_out[96 +: 8] = state_in[0 +: 8];
     assign state_out[64 +: 8] = state_in[96 +: 8];
     assign state_out[32 +: 8] = state_in[64 +: 8];
     assign state_out[0 +: 8] = state_in[32 +: 8];
endmodule
