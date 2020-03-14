module controlromtest ();
	//Performance Cost: #8 gates deep + 1 for wire saturation
	reg [63:00] decoderIn;
	wire [6:00] controlLines;

	controlrom DUT(decoderIn, controlLines);

	initial begin
	$display("Control Rom test");
	$display("ADD Instruction Output");
	decoderIn <= 64'b0100000000000000000000000000000000000000000000000000000000000000;
	#9
	$display("controlLines output: %b\n", controlLines);

	$display("NOR Instruction Output");
	decoderIn <= 64'b0000000000000000000000000000000000000000000000000000000001000000;
	#9
	$display("controlLines output: %b\n", controlLines);

	$display("LW Instruction Output");
	decoderIn <= 64'b0000000000000000000000000000000000000000000000000100000000000000;
	#9
	$display("controlLines output: %b\n", controlLines);

	$display("SW Instruction Output");
	decoderIn <= 64'b0000000000000000000000000000000000000000000000000000010000000000;
	#9
	$display("controlLines output: %b\n", controlLines);

	$display("BEQ Instruction Output");
	decoderIn <= 64'b0000000010000000000000000000000000000000000000000000000000000000;
	#9
	$display("controlLines output: %b", controlLines);
	end
endmodule //controlromtest
