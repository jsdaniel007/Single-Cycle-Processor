module decoder6x64test ();
	//Perf Cost: #18 + 1
	reg in0, in1, in2, in3, in4, in5;
    wire [63:00] out;

	decoder6x64 DUT(in0, in1, in2, in3, in4, in5, out);

	initial begin
	//This is our opcode coming from instruction memory
	$display("Decoder Testing \n");
	in0 <= 0;
	in1 <= 0;
	in2 <= 0;
	in3 <= 0;
	in4 <= 0;
	in5 <= 0;
	#19
	$display("output: %b", out);

	in0 <= 1;
	in1 <= 0;
	in2 <= 0;
	in3 <= 0;
	in4 <= 0;
	in5 <= 0;
	#19
	$display("output: %b", out);

	in0 <= 1;
	in1 <= 1;
	in2 <= 0;
	in3 <= 0;
	in4 <= 0;
	in5 <= 0;
	#19
	$display("output: %b", out);

	in0 <= 1;
	in1 <= 1;
	in2 <= 1;
	in3 <= 0;
	in4 <= 0;
	in5 <= 0;
	#19
	$display("output: %b", out);

	in0 <= 0;
	in1 <= 0;
	in2 <= 0;
	in3 <= 1;
	in4 <= 0;
	in5 <= 0;
	#19
	$display("output: %b", out);

	in0 <= 0;
	in1 <= 0;
	in2 <= 0;
	in3 <= 0;
	in4 <= 1;
	in5 <= 0;
	#19
	$display("output: %b", out);

	in0 <= 0;
	in1 <= 0;
	in2 <= 0;
	in3 <= 0;
	in4 <= 0;
	in5 <= 1;
	#19
	$display("output: %b", out);

	in0 <= 0;
	in1 <= 1;
	in2 <= 1;
	in3 <= 1;
	in4 <= 1;
	in5 <= 1;
	#19
	$display("output: %b\n", out);

	$display("ADD Instruction (100000)");
	in0 <= 1;
	in1 <= 0;
	in2 <= 0;
	in3 <= 0;
	in4 <= 0;
	in5 <= 0;
	#19
	$display("output: %b", out);

	$display("NOR Instruction (100111)");
	in0 <= 1;
	in1 <= 0;
	in2 <= 0;
	in3 <= 1;
	in4 <= 1;
	in5 <= 1;
	#19
	$display("output: %b", out);

	$display("LW Instruction (100011)");
	in0 <= 1;
	in1 <= 0;
	in2 <= 0;
	in3 <= 0;
	in4 <= 1;
	in5 <= 1;
	#19
	$display("output: %b", out);

	$display("SW Instruction (101011)");
	in0 <= 1;
	in1 <= 0;
	in2 <= 1;
	in3 <= 0;
	in4 <= 1;
	in5 <= 1;
	#19
	$display("output: %b", out);

	$display("BEQ Instruction (000100)");
	in0 <= 0;
	in1 <= 0;
	in2 <= 0;
	in3 <= 1;
	in4 <= 0;
	in5 <= 0;
	#19
	$display("output: %b", out);
	end
endmodule // decoder6x64test
