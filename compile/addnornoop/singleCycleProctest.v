module singleCycleProctest ();

	reg clk = 0, rst = 0;

	always
	begin
	    //what the slowest path in the instruction is, will change depending on
	    //which instruction, but not really
	    //#452 //calculated by hand
	    #500
	    clk = !clk;
	    rst = 0;
	end

	singleCycleProc DUT(clk, rst);
	initial begin
	$dumpfile("gtk/singleCycle-gtkwave.vcd");
    $dumpvars(0, DUT);
	// Dr. PK: start reset here
	rst <= 1;
	$display("reset is occurring:");
	$display("Instructions: lw 1 0 two, halt");
	// reset cycle + init of instruction memory
	//5 cycles
	#7000 $finish();
	//3ish cycles
	//#3500 $finish();

	end



endmodule // singleCycleProctest
