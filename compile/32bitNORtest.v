module NOR32bittest();
	//#performance cost: 4 + 1
	reg [31:00] inA, inB;
	wire [31:00] outC;

	NOR32bit DUT(outC, inA, inB);

	//remember OR prefers true, so NOR would return false
	initial begin
	inA <= 32'b00000000000000000000000000000000;
	inB <= 32'b11111111111111111111111111111111;
	#5
	$display("outC is %b\n", outC);

	inA <= 32'b11111111111111111111111111111111;
	inB <= 32'b00000000000000000000000000000000;
	#5
	$display("outC is %b\n", outC);

	inA <= 32'b00000000000000000000000000000000;
	inB <= 32'b00000000000000000000000000000000;
	#5
	$display("outC is %b\n", outC);

	inA <= 32'b11111111111111111111111111111111;
	inB <= 32'b11111111111111111111111111111111;
	#5
	$display("outC is %b", outC);
	end
endmodule //32bitNORtest
