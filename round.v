/* one AES round for every two clock cycles */
module one_round (clk, state_in, key, state_out);
    input      clk;
    input      [127:0] state_in, key;
    output    [127:0] state_out;
    wire  leakage_trigger;
    //Temp wire for the one round
    wire [127:0] afterSubBytes;
    wire [127:0] shiftRows;
    wire [127:0] afterMixColumns;
    /*SubBytes*/
    SubBytes sbox(.clk(clk), .state_in(state_in), .state_out(afterSubBytes));
    /*ShiftRows*/
    ShiftRows SR(.state_in(afterSubBytes), .state_out(shiftRows));
    /*MixColumns*/
    MixColumns MC(.clk(clk), .state_in(shiftRows), .state_out(afterMixColumns));
    /*AddRoundKeys*/
    AddRoundKey ARK(.state_in(afterMixColumns), .state_out(state_out), .key(key));
endmodule

/* AES final round for every two clock cycles */
module final_round (clk, state_in, key_in, state_out);
    input              clk;
    input      [127:0] state_in;
    input      [127:0] key_in;
    output     [127:0] state_out;
    //Temp wire for the one round
    wire [127:0] afterSubBytes_final;
    wire [127:0] shiftRows_final;
    wire leakage_trigger;
    /*SubBytes*/
    SubBytes sbox(.clk(clk), .state_in(state_in), .state_out(afterSubBytes_final));
    /*ShiftRows*/
    ShiftRows SR(.state_in(afterSubBytes_final), .state_out(shiftRows_final));
    /*AddRoundKeys*/
    AddRoundKey ARK(.state_in(shiftRows_final), .state_out(state_out), .key(key_in));
    
endmodule