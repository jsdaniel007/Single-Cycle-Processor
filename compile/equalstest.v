module equalstest();
//Performance Cost: 9
reg [31:0] inA, inB;
wire outC;

equals DUT(inA, inB, outC);

initial begin
	//$dumpfile("gtk/equalstest-gtkwave.vcd");
	//$dumpvars(0, DUT);
	//I have a 32 bit array, and I want to store the decimal value of 0 into it
	//inA <= 32'd0
	$display("\nTest Start with 12 Tick Intervals:");
	$display("A/B is 0/0:");
	inA <= 0;
	inB <= 0;
	#12
	$display("outC = %d\n", outC);

	$display("A/B is 1/0:");
	inA <= 1;
	inB <= 0;
	#12
	$display("outC = %d\n", outC);

	$display("A/B is 0/1:");
	inA <= 0;
	inB <= 1;
	#12
	$display("outC = %d\n", outC);

	$display("A/B is 1/1:");
	inA <= 1;
	inB <= 1;
	#12
	$display("outC = %d\n", outC);
end
endmodule
