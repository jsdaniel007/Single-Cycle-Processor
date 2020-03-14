module mux21test();
//Performance Cost: #9 for single bit, so why 14 down in the test?
reg inA, inB, inS;
wire outO;

mux21 DUT(inA, inB, inS, outO);
initial
begin
	$dumpfile("gtk/mux21-gtkwave.vcd");
	$dumpvars(0, DUT);

    //with inS = 0, inA will be chosen
	$display("Test Start");
	inA <= 0;
	inB <= 0;
	inS <= 0;
	#14
	$display("A/B/S is 0/0/0");
	$display("outO = %d\n", outO);

	inA <= 1;
	inB <= 0;
	inS <= 0;
	#14
	$display("A/B/S is 1/0/0");
	$display("outO = %d\n", outO);

	inA <= 0;
	inB <= 1;
	inS <= 0;
	#14
	$display("A/B/S is 0/1/0");
	$display("outO = %d\n", outO);

	inA <= 1;
	inB <= 1;
	inS <= 0;
	#14
	$display("A/B/S is 1/1/0");
	$display("outO = %d\n", outO);

	inA <= 0;
	inB <= 0;
	inS <= 1;
	#14
	$display("A/B/S is 0/0/1");
	$display("outO = %d\n", outO);

	inA <= 0;
	inB <= 1;
	inS <= 1;
	#14
	$display("A/B/S is 0/1/1");
	$display("outO = %d\n", outO);

	inA <= 1;
	inB <= 0;
	inS <= 1;
	#14
	$display("A/B/S is 1/0/1");
	$display("outO = %d\n", outO);

	inA <= 1;
	inB <= 1;
	inS <= 1;
	#14
	$display("A/B/S is 1/1/1");
	$display("outO = %d\n", outO);
end
endmodule
