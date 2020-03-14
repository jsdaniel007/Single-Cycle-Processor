module mux21 (inA, inB, inS, outO);
//Performance Cost: #9

input wire inA, //data wire A
	inB, //data wire B
	inS; //selector wire
wire Snot; //transition from not to in1 input
wire T1, T2; //transition wires from nand to or gate
output wire outO;
	//O = A if S = 0
	//O = B if S = 1
not #1 (Snot, inS);
and #4 (T1, inA, Snot); //inA nand
and #4 (T2, inB, inS); //inB nand
or #4 (outO, T1, T2); //outO or

endmodule //mux21
