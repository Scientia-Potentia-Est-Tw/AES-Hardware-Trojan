`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2024 10:30:21 AM
// Design Name: 
// Module Name: MixColumns_tb
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


module MixColumns_tb();
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

MixColumns MC(.clk(clk), .state_in(state_in), .state_out(state_out));
initial begin
$monitor("input= %H , output= %h",state_in,state_out);
state_in= 128'h_d4bf5d30_e0b452ae_b84111f1_1e2798e5 ;
#10;
state_in=128'h_84e1dd69_1a41d76f_792d3897_83fbac70 ;
#10;
state_in=128'h_6353e08c_0960e104_cd70b751_bacad0e7;
#10;
end
endmodule
