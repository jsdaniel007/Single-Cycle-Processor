module singleCycleProctest ();

	reg clk = 0, rst = 0;

	always
	begin
	    //Half the clock cycle time goes here, this will change depending on
	    //what the slowest path in the instruction is, will change depending on
	    //which instruction
	    #605
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
	// reset cycle + init of instruction memory
	// 1 cycle
	//#70 $finish();
	// 2 cycles
	#2420 $finish();
	//#210 $finish();

	end



endmodule // singleCycleProctest
