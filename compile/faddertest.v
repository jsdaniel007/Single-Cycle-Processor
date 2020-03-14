module faddertest();
//Performance Cost: #14 + 1
reg inA, inB, Cin;
wire Cout, Sout;
fadder DUT(inA, inB, Cin, Sout, Cout);
initial begin
	$display("\nTesting Fadder:");
	//test with your 0's and 1's with truth tables
	inA <= 0;
	inB <= 0;
	Cin <= 0;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);

	//test with your 0's and 1's with truth tables
	inA <= 1;
	inB <= 0;
	Cin <= 0;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);

	inA <= 0;
	inB <= 1;
	Cin <= 0;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);

	inA <= 0;
	inB <= 0;
	Cin <= 1;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);

	inA <= 1;
	inB <= 1;
	Cin <= 0;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);

	inA <= 0;
	inB <= 1;
	Cin <= 1;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);

	inA <= 1;
	inB <= 0;
	Cin <= 1;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);

	inA <= 1;
	inB <= 1;
	Cin <= 1;
	#15
	$display("inA/inB/Cin: %d/%d/%d", inA, inB, Cin);
	$display("Cout/Sout %d/%d\n", Cout, Sout);
end

endmodule //faddertest
