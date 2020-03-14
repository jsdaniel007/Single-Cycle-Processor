module mux32test();
//Performance Cost: #9 + 1
reg [31:0] inA, inB;
reg inS;
wire [31:0] outO;

mux32 DUT(inA, inB, inS, outO);
initial
begin
	$dumpfile("gtk/mux32-gtkwave.vcd");
	$dumpvars(0, DUT);

	$display("Test Start");
	//there's a better way to do this.
	inA <= 32'b00000000000000000000000000000001;
	inB <= 32'b10000000000000000000000000000000;
	inS <= 0;
	#10
	$display("inA: %b\ninB: %b\ninS: %b", inA, inB, inS);
	$display("outO is = %b\n", outO);

	inA <= 32'b00000000000000000000000000000001;
	inB <= 32'b10000000000000000000000000000000;
	inS <= 1;
	#10
	$display("inA: %b\ninB: %b\ninS: %b", inA, inB, inS);
	$display("outO is = %b\n", outO);

	inA <= 32'b10000000000000000000000000000000;
	inB <= 32'b00000000000000000000000000000001;
	inS <= 0;
	#10
	$display("inA: %b\ninB: %b\ninS: %b", inA, inB, inS);
	$display("outO is = %b\n", outO);

	inA <= 32'b10000000000000000000000000000000;
	inB <= 32'b00000000000000000000000000000001;
	inS <= 1;
	#10
	$display("inA: %b\ninB: %b\ninS: %b", inA, inB, inS);
	$display("outO is = %b\n", outO);
end
endmodule
