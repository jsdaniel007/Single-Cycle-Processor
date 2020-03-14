module mux32 (inA, inB, inS, outO);
    input wire [31:0] inA;
    input wire [31:0] inB;
    input wire inS;
    output wire [31:0] outO;

    initial begin
    //#460
    //$display("Output of Mux: %b", outO);
    end

    mux21 mux0(inA[0], inB[0], inS, outO[0]);
    mux21 mux1(inA[1], inB[1], inS, outO[1]);
    mux21 mux2(inA[2], inB[2], inS, outO[2]);
    mux21 mux3(inA[3], inB[3], inS, outO[3]);
    mux21 mux4(inA[4], inB[4], inS, outO[4]);
    mux21 mux5(inA[5], inB[5], inS, outO[5]);
    mux21 mux6(inA[6], inB[6], inS, outO[6]);
    mux21 mux7(inA[7], inB[7], inS, outO[7]);
    mux21 mux8(inA[8], inB[8], inS, outO[8]);
    mux21 mux9(inA[9], inB[9], inS, outO[9]);
    mux21 mux10(inA[10], inB[10], inS, outO[10]);
    mux21 mux11(inA[11], inB[11], inS, outO[11]);
    mux21 mux12(inA[12], inB[12], inS, outO[12]);
    mux21 mux13(inA[13], inB[13], inS, outO[13]);
    mux21 mux14(inA[14], inB[14], inS, outO[14]);
    mux21 mux15(inA[15], inB[15], inS, outO[15]);
    mux21 mux16(inA[16], inB[16], inS, outO[16]);
    mux21 mux17(inA[17], inB[17], inS, outO[17]);
    mux21 mux18(inA[18], inB[18], inS, outO[18]);
    mux21 mux19(inA[19], inB[19], inS, outO[19]);
    mux21 mux20(inA[20], inB[20], inS, outO[20]);
    mux21 mux21(inA[21], inB[21], inS, outO[21]);
    mux21 mux22(inA[22], inB[22], inS, outO[22]);
    mux21 mux23(inA[23], inB[23], inS, outO[23]);
    mux21 mux24(inA[24], inB[24], inS, outO[24]);
    mux21 mux25(inA[25], inB[25], inS, outO[25]);
    mux21 mux26(inA[26], inB[26], inS, outO[26]);
    mux21 mux27(inA[27], inB[27], inS, outO[27]);
    mux21 mux28(inA[28], inB[28], inS, outO[28]);
    mux21 mux29(inA[29], inB[29], inS, outO[29]);
    mux21 mux30(inA[30], inB[30], inS, outO[30]);
    mux21 mux31(inA[31], inB[31], inS, outO[31]);

endmodule //mux32
