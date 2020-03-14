module NOR32bit(outC, inA, inB);
	input wire [31:00] inA, inB;
	output wire [31:00] outC;

	nor #4 (outC[0], inA[0], inB[0]);
	nor #4 (outC[1], inA[1], inB[1]);
	nor #4 (outC[2], inA[2], inB[2]);
	nor #4 (outC[3], inA[3], inB[3]);
	nor #4 (outC[4], inA[4], inB[4]);
	nor #4 (outC[5], inA[5], inB[5]);
	nor #4 (outC[6], inA[6], inB[6]);
	nor #4 (outC[7], inA[7], inB[7]);
	nor #4 (outC[8], inA[8], inB[8]);
	nor #4 (outC[9], inA[9], inB[9]);
	nor #4 (outC[10], inA[10], inB[10]);
	nor #4 (outC[11], inA[11], inB[11]);
	nor #4 (outC[12], inA[12], inB[12]);
	nor #4 (outC[13], inA[13], inB[13]);
	nor #4 (outC[14], inA[14], inB[14]);
	nor #4 (outC[15], inA[15], inB[15]);
	nor #4 (outC[16], inA[16], inB[16]);
	nor #4 (outC[17], inA[17], inB[17]);
	nor #4 (outC[18], inA[18], inB[18]);
	nor #4 (outC[19], inA[19], inB[19]);
	nor #4 (outC[20], inA[20], inB[20]);
	nor #4 (outC[21], inA[21], inB[21]);
	nor #4 (outC[22], inA[22], inB[22]);
	nor #4 (outC[23], inA[23], inB[23]);
	nor #4 (outC[24], inA[24], inB[24]);
	nor #4 (outC[25], inA[25], inB[25]);
	nor #4 (outC[26], inA[26], inB[26]);
	nor #4 (outC[27], inA[27], inB[27]);
	nor #4 (outC[28], inA[28], inB[28]);
	nor #4 (outC[29], inA[29], inB[29]);
	nor #4 (outC[30], inA[30], inB[30]);
	nor #4 (outC[31], inA[31], inB[31]);

endmodule //32bitNOR
