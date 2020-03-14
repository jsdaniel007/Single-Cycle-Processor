module fadder(inA, inB, Cin, Sout, Cout);
//Performance Cost: #14 + 1

input wire inA, inB, Cin;
wire Y0, Y1, Y2;
output wire Cout, Sout;

//half adder section
xor #6 (Y0, inA, inB);
and #4 (Y1, inA, inB);

//rest of the adder
xor #6 (Sout, Y0, Cin);
or #4 (Cout, Y1, Y2);
and #4 (Y2, Cin, Y0);

endmodule //fadder
