module signextend32test ();
	reg [15:00] inA;
	wire [31:00] outA;

	signextend32 DUT(inA, outA);

initial begin

	inA <= 16'b0111111111111111;
	#1
	$display("inA is %b", inA);
	$display("outA is %b\n", outA);

	inA <= 16'b1000000000000000;
	#1
	$display("inA is %b", inA);
	$display("outA is %b\n", outA);
end
endmodule //signextend32test
