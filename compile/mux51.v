module mux51 (inA, inB, inS, outO);

//an array of 5 wires to use for each of the muxes
input wire [4:0] inA;
input wire [4:0] inB;
input wire inS;
output wire [4:0] outO;
mux21 mux0(inA[0], inB[0], inS, outO[0]);
mux21 mux1(inA[1], inB[1], inS, outO[1]);
mux21 mux2(inA[2], inB[2], inS, outO[2]);
mux21 mux3(inA[3], inB[3], inS, outO[3]);
mux21 mux4(inA[4], inB[4], inS, outO[4]);

endmodule //mux51
