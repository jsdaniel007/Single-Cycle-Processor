module ripcarryadder(inA, inB, Cin, Sout, Cout);
//Performance Cost: #384 for 32bit
	input wire [31:0] inA, inB;
	input wire Cin;
	wire [31:0] YCarryin, YCarryout;
	output wire [31:00] Sout;
	output wire Cout;

	//change YCarryout as the Cin of the previous
	fadder fad0(inA[0], inB[0], Cin, Sout[0], YCarryout[0]);
	fadder fad1(inA[1], inB[1], YCarryout[0], Sout[1], YCarryout[1]);
	fadder fad2(inA[2], inB[2], YCarryout[1], Sout[2], YCarryout[2]);
	fadder fad3(inA[3], inB[3], YCarryout[2], Sout[3], YCarryout[3]);
	fadder fad4(inA[4], inB[4], YCarryout[3], Sout[4], YCarryout[4]);
	fadder fad5(inA[5], inB[5], YCarryout[4], Sout[5], YCarryout[5]);
	fadder fad6(inA[6], inB[6], YCarryout[5], Sout[6], YCarryout[6]);
	fadder fad7(inA[7], inB[7], YCarryout[6], Sout[7], YCarryout[7]);
	fadder fad8(inA[8], inB[8], YCarryout[7], Sout[8], YCarryout[8]);
	fadder fad9(inA[9], inB[9], YCarryout[8], Sout[9], YCarryout[9]);
	fadder fad10(inA[10], inB[10], YCarryout[9], Sout[10], YCarryout[10]);
	fadder fad11(inA[11], inB[11], YCarryout[10], Sout[11], YCarryout[11]);
	fadder fad12(inA[12], inB[12], YCarryout[11], Sout[12], YCarryout[12]);
	fadder fad13(inA[13], inB[13], YCarryout[12], Sout[13], YCarryout[13]);
	fadder fad14(inA[14], inB[14], YCarryout[13], Sout[14], YCarryout[14]);
	fadder fad15(inA[15], inB[15], YCarryout[14], Sout[15], YCarryout[15]);
	fadder fad16(inA[16], inB[16], YCarryout[15], Sout[16], YCarryout[16]);
	fadder fad17(inA[17], inB[17], YCarryout[16], Sout[17], YCarryout[17]);
	fadder fad18(inA[18], inB[18], YCarryout[17], Sout[18], YCarryout[18]);
	fadder fad19(inA[19], inB[19], YCarryout[18], Sout[19], YCarryout[19]);
	fadder fad20(inA[20], inB[20], YCarryout[19], Sout[20], YCarryout[20]);
	fadder fad21(inA[21], inB[21], YCarryout[20], Sout[21], YCarryout[21]);
	fadder fad22(inA[22], inB[22], YCarryout[21], Sout[22], YCarryout[22]);
	fadder fad23(inA[23], inB[23], YCarryout[22], Sout[23], YCarryout[23]);
	fadder fad24(inA[24], inB[24], YCarryout[23], Sout[24], YCarryout[24]);
	fadder fad25(inA[25], inB[25], YCarryout[24], Sout[25], YCarryout[25]);
	fadder fad26(inA[26], inB[26], YCarryout[25], Sout[26], YCarryout[26]);
	fadder fad27(inA[27], inB[27], YCarryout[26], Sout[27], YCarryout[27]);
	fadder fad28(inA[28], inB[28], YCarryout[27], Sout[28], YCarryout[28]);
	fadder fad29(inA[29], inB[29], YCarryout[28], Sout[29], YCarryout[29]);
	fadder fad30(inA[30], inB[30], YCarryout[29], Sout[30], YCarryout[30]);
	fadder fad31(inA[31], inB[31], YCarryout[30], Sout[31], Cout);
endmodule //ripcarryadder
