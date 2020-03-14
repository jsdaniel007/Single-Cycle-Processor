module ALUtest ();
//Performance Cost: #397 + 1? when taking the 32bitNOR, 32bitMux, and the Ripple Carry Adder
	reg [31:00] inA;
	reg [31:00] inB;
	reg cin, inOP; //opcode
	wire [31:00] norOut, raddOut; //output from the
	wire [31:00] out; // output
	wire cout, eq; // equality bit

//only print out what is here, nothing else
ALU DUT(inA, inB, inOP, cin, out, eq);

	initial begin
	$display("Output for ripcarryadder \n");
	$display("Adding one and one together");
	cin <= 0;
	inOP <= 0; //add if 0
	inA <= 32'b00000000000000000000000000000001;
	inB <= 32'b00000000000000000000000000000001;
	#398
	//Timings for: ripcarry32, mux32
	$display("out: %b\n", out);
	$display("eq? %b\n", eq);

	$display("NOR Testing\n");
	cin <= 0;
	inOP <= 1; //add if 0
	inA <= 32'b00000000000000000000000000000000;
	inB <= 32'b00000000000000000000000000000011;
	#397
	$display("out: %b\n", out);
	$display("eq? %b\n", eq);

	end
endmodule //ALUtest
