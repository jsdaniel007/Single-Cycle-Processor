module ALU (inA, inB, inOP, cin, out, eq);
input [31:00] inA, inB;
input cin, inOP; //opcode
wire [31:00] norOut, raddOut; //output from the nor/add
output [31:00] out; // output
output cout, eq; // equality bit



//if opcode is 0 then out = A + B-- use muxes to choose
//if opcode is 1 then out = A NOR B
//module NOR32bit(outC, inA, inB);
NOR32bit nortoMux(norOut, inA, inB);
//module ripcarryadder(inA, inB, Cin, Sout, Cout);
ripcarryadder riptoMux(inA, inB, cin, raddOut, cout); //replace o's with a test wire
mux32 mux(raddOut, norOut, inOP, out);

//if A==B then eq is 1
equals eqSet(inA, inB, eq);


//if A!=B then eq is 0

endmodule //ALU
