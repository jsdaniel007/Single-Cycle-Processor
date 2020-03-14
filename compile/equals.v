module equals(inA, inB, outC);
//Performance Cost: 9
/*So these are similar to arrays, in the sense that we have made
32 input wires and called them inA, which can be referred to as such */
input wire [31:0] inA, inB;
wire [31:0] Y0, Y1;
output wire outC;

//32 bits
xor #6 (Y0[0], inA[0], inB[0]);
not #1 (Y1[0], Y0[0]);

xor #6 (Y0[1], inA[1], inB[1]);
not #1 (Y1[1], Y0[1]);

xor #6 (Y0[2], inA[2], inB[2]);
not #1 (Y1[2], Y0[2]);

xor #6 (Y0[3], inA[3], inB[3]);
not #1 (Y1[3], Y0[3]);

xor #6 (Y0[4], inA[4], inB[4]);
not #1 (Y1[4], Y0[4]);

xor #6 (Y0[5], inA[5], inB[5]);
not #1 (Y1[5], Y0[5]);

xor #6 (Y0[6], inA[6], inB[6]);
not #1 (Y1[6], Y0[6]);

xor #6 (Y0[7], inA[7], inB[7]);
not #1 (Y1[7], Y0[7]);

xor #6 (Y0[8], inA[8], inB[8]);
not #1 (Y1[8], Y0[8]);

xor #6 (Y0[9], inA[9], inB[9]);
not #1 (Y1[9], Y0[9]);

xor #6 (Y0[10], inA[10], inB[10]);
not #1 (Y1[10], Y0[10]);

xor #6 (Y0[11], inA[11], inB[11]);
not #1 (Y1[11], Y0[11]);

xor #6 (Y0[12], inA[12], inB[12]);
not #1 (Y1[12], Y0[12]);

xor #6 (Y0[13], inA[13], inB[13]);
not #1 (Y1[13], Y0[13]);

xor #6 (Y0[14], inA[14], inB[14]);
not #1 (Y1[14], Y0[14]);

xor #6 (Y0[15], inA[15], inB[15]);
not #1 (Y1[15], Y0[15]);

xor #6 (Y0[16], inA[16], inB[16]);
not #1 (Y1[16], Y0[16]);

xor #6 (Y0[17], inA[17], inB[17]);
not #1 (Y1[17], Y0[17]);

xor #6 (Y0[18], inA[18], inB[18]);
not #1 (Y1[18], Y0[18]);

xor #6 (Y0[19], inA[19], inB[19]);
not #1 (Y1[19], Y0[19]);

xor #6 (Y0[20], inA[20], inB[20]);
not #1 (Y1[20], Y0[20]);

xor #6 (Y0[21], inA[21], inB[21]);
not #1 (Y1[21], Y0[21]);

xor #6 (Y0[22], inA[22], inB[22]);
not #1 (Y1[22], Y0[22]);

xor #6 (Y0[23], inA[23], inB[23]);
not #1 (Y1[23], Y0[23]);

xor #6 (Y0[24], inA[24], inB[24]);
not #1 (Y1[24], Y0[24]);

xor #6 (Y0[25], inA[25], inB[25]);
not #1 (Y1[25], Y0[25]);

xor #6 (Y0[26], inA[26], inB[26]);
not #1 (Y1[26], Y0[26]);

xor #6 (Y0[27], inA[27], inB[27]);
not #1 (Y1[27], Y0[27]);

xor #6 (Y0[28], inA[28], inB[28]);
not #1 (Y1[28], Y0[28]);

xor #6 (Y0[29], inA[29], inB[29]);
not #1 (Y1[29], Y0[29]);

xor #6 (Y0[30], inA[30], inB[30]);
not #1 (Y1[30], Y0[30]);

xor #6 (Y0[31], inA[31], inB[31]);
not #1 (Y1[31], Y0[31]);

and #2 (outC,
	Y1[0], Y1[1], Y1[2], Y1[3], Y1[4], Y1[5], Y1[6], Y1[7], Y1[8], Y1[9],
	Y1[10], Y1[11], Y1[12], Y1[13], Y1[14], Y1[15], Y1[16], Y1[17], Y1[18],
	Y1[19], Y1[20], Y1[21], Y1[22], Y1[23], Y1[24], Y1[25], Y1[26], Y1[27],
	Y1[28], Y1[29], Y1[30], Y1[31]
	);

endmodule
