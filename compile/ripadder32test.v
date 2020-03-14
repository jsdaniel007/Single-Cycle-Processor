module ripadder32test ();
//Performance Cost: #384 for 32bit + 1?
reg [31:0] inA, inB;
reg Cin;
reg [31:0] YCarryin, YCarryout;
wire [31:00] Sout;
wire Cout;

ripcarryadder DUT(inA, inB, Cin, Sout, Cout);
initial begin
	//since we are making a 32-bit ripcarryadder, we have a 32 bit input
	$display("1 + 1 = 2 Binary test");
	inA <= 32'b00000000000000000000000000000001;
	inB <= 32'b00000000000000000000000000000001;
	Cin <= 0;
	#384 //double check your timing with the + 1
	$display("Sout is: %b", Sout);
	$display("Cout is: %b", Cout);

	$display("0 + 1 = 1 Binary test");
	inA <= 32'b00000000000000000000000000000000;
	inB <= 32'b00000000000000000000000000000001;
	Cin <= 0;
	#384
	$display("Sout is: %b", Sout);
	$display("Cout is: %b", Cout);

	$display("Binary test");
	inA <= 32'b00000000000000000000000000000000;
	inB <= 32'b00000000000000000000000000000011;
	Cin <= 0;
	#384
	$display("Sout is: %b", Sout);
	$display("Cout is: %b", Cout);


end
endmodule // ripadder32test
