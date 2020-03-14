module mux51test();
//Performance Cost: 9 + 1?
reg [4:0] inA, inB;
reg inS;
wire [4:0] outO;

mux51 DUT(inA, inB, inS, outO);
initial
begin
	$dumpfile("gtk/mux51-gtkwave.vcd");
	$dumpvars(0, DUT);

	$display("Test Start");
	inA <= 5'b01110;
	inB <= 5'b10001;
	inS <= 0;
	#10
	$display("inA = %b\ninB = %b\ninS = %b", inA, inB, inS);
	$display("outO is = %b\n", outO);

	inA <= 5'b01110;
	inB <= 5'b10001;
	inS <= 1;
	#10
	$display("inA = %b\ninB = %b\ninS = %b", inA, inB, inS);
	$display("outO is = %b\n", outO);

	inA <= 5'b10001;
	inB <= 5'b01110;
	inS <= 0;
	#10
	$display("inA = %b\ninB = %b\ninS = %b", inA, inB, inS);
	$display("outO is = %b\n", outO);

	inA <= 5'b10001;
	inB <= 5'b01110;
	inS <= 1;
	#10
	$display("inA = %b\ninB = %b\ninS = %b", inA, inB, inS);
	$display("outO is = %b\n", outO);
end
endmodule
