module singleCycleProctest ();

	reg clk = 0, rst = 0;
	always
	begin
	    //Half the clock cycle time goes here, this will change depending on
	    //what the slowest path in the instruction is, will change depending on
	    //which instruction
	    #550 //527 + padding = 550
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
	$display("Instruction Order: lw 1 0 two, sw 1 1 0, done halt");
	// reset cycle + init of instruction memory
	//2ish cycles
	//#2500 $finish();
	//3ish cycles
	//#5000 $finish();

	end



endmodule // singleCycleProctest
