module decoder6x64 (in0, in1, in2, in3, in4, in5, out);
//with our six input wires, act like these are bits
    input in0, in1, in2, in3, in4, in5;
    wire nw0, nw1, nw2, nw3, nw4, nw5;
    output [63:00] out;

    //remember its (destination, input)
    not #1(nw0, in0);
    not #1(nw1, in1);
    not #1(nw2, in2);
    not #1(nw3, in3);
    not #1(nw4, in4);
    not #1(nw5, in5);

/*
The pattern works like binary, in a sense. Your not wires are setup such that
they can act like 0's or 1's (as long as its the same the whole way) it would account
for the 64 potential outputs that the decoder will output to the mux's
 */
//the pattern is 32, 16, 8, 4, 2, 1
//double check the 16 count column
and #4 (out[0], in5, in4, in3, in2, in1, in0);
and #4 (out[1], in5, in4, in3, in2, in1, nw0);
and #4 (out[2], in5, in4, in3, in2, nw1, in0);
and #4 (out[3], in5, in4, in3, in2, nw1, nw0);
and #4 (out[4], in5, in4, in3, nw2, in1, in0);
and #4 (out[5], in5, in4, in3, nw2, in1, nw0);
and #4 (out[6], in5, in4, in3, nw2, nw1, in0);
and #4 (out[7], in5, in4, in3, nw2, nw1, nw0);
and #4 (out[8], in5, in4, nw3, in2, in1, in0);
and #4 (out[9], in5, in4, nw3, in2, in1, nw0);
and #4 (out[10], in5, in4, nw3, in2, nw1, in0);
and #4 (out[11], in5, in4, nw3, in2, nw1, nw0);
and #4 (out[12], in5, in4, nw3, nw2, in1, in0);
and #4 (out[13], in5, in4, nw3, nw2, in1, nw0);
and #4 (out[14], in5, in4, nw3, nw2, nw1, in0);
and #4 (out[15], in5, in4, nw3, nw2, nw1, nw0);
and #4 (out[16], in4, nw4, in3, in2, in1, in0);
and #4 (out[17], in4, nw4, in3, in2, in1, nw0);
and #4 (out[18], in4, nw4, in3, in2, nw1, in0);
and #4 (out[19], in4, nw4, in3, in2, nw1, nw0);
and #4 (out[20], in4, nw4, in3, nw2, in1, in0);
and #4 (out[21], in4, nw4, in3, nw2, in1, nw0);
and #4 (out[22], in4, nw4, in3, nw2, nw1, in0);
and #4 (out[23], in4, nw4, in3, nw2, nw1, nw0);
and #4 (out[24], in4, nw4, nw3, in2, in1, in0);
and #4 (out[25], in4, nw4, nw3, in2, in1, nw0);
and #4 (out[26], in4, nw4, nw3, in2, nw1, in0);
and #4 (out[27], in4, nw4, nw3, in2, nw1, nw0);
and #4 (out[28], in4, nw4, nw3, nw2, in1, in0);
and #4 (out[29], in4, nw4, nw3, nw2, in1, nw0);
and #4 (out[30], in4, nw4, nw3, nw2, nw1, in0);
and #4 (out[31], in4, nw4, nw3, nw2, nw1, nw0);
and #4 (out[32], nw5, in4, in3, in2, in1, in0);
and #4 (out[33], nw5, in4, in3, in2, in1, nw0);
and #4 (out[34], nw5, in4, in3, in2, nw1, in0);
and #4 (out[35], nw5, in4, in3, in2, nw1, nw0);
and #4 (out[36], nw5, in4, in3, nw2, in1, in0);
and #4 (out[37], nw5, in4, in3, nw2, in1, nw0);
and #4 (out[38], nw5, in4, in3, nw2, nw1, in0);
and #4 (out[39], nw5, in4, in3, nw2, nw1, nw0);
and #4 (out[40], nw5, in4, nw3, in2, in1, in0);
and #4 (out[41], nw5, in4, nw3, in2, in1, nw0);
and #4 (out[42], nw5, in4, nw3, in2, nw1, in0);
and #4 (out[43], nw5, in4, nw3, in2, nw1, nw0);
and #4 (out[44], nw5, in4, nw3, nw2, in1, in0);
and #4 (out[45], nw5, in4, nw3, nw2, in1, nw0);
and #4 (out[46], nw5, in4, nw3, nw2, nw1, in0);
and #4 (out[47], nw5, in4, nw3, nw2, nw1, nw0);
and #4 (out[48], nw5, nw4, in3, in2, in1, in0);
and #4 (out[49], nw5, nw4, in3, in2, in1, nw0);
and #4 (out[50], nw5, nw4, in3, in2, nw1, in0);
and #4 (out[51], nw5, nw4, in3, in2, nw1, nw0);
and #4 (out[52], nw5, nw4, in3, nw2, in1, in0);
and #4 (out[53], nw5, nw4, in3, nw2, in1, nw0);
and #4 (out[54], nw5, nw4, in3, nw2, nw1, in0);
and #4 (out[55], nw5, nw4, in3, nw2, nw1, nw0);
and #4 (out[56], nw5, nw4, nw3, in2, in1, in0);
and #4 (out[57], nw5, nw4, nw3, in2, in1, nw0);
and #4 (out[58], nw5, nw4, nw3, in2, nw1, in0);
and #4 (out[59], nw5, nw4, nw3, in2, nw1, nw0);
and #4 (out[60], nw5, nw4, nw3, nw2, in1, in0);
and #4 (out[61], nw5, nw4, nw3, nw2, in1, nw0);
and #4 (out[62], nw5, nw4, nw3, nw2, nw1, in0);
and #4 (out[63], nw5, nw4, nw3, nw2, nw1, nw0);
endmodule // decoder6x64
