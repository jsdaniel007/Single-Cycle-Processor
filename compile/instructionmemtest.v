module instructionmemtest ();
//Performance Cost: #20 + 1
reg clk, rst;
reg [31:0] addr; //PC Counter input, treat as address
reg [31:0] memory[0:65535];
output wire [31:0] instr;

instructionmem DUT(addr, instr, clk, rst);

initial begin
	rst <= 1;
	clk <= 0;
	#21 //initiate our clock at the low flatline, or "a"

	clk <= 1;
	addr <= 32'b00000000000000000000000000000001;
	#21 //end of label b
	$display("instruction result: %b", instr);
	//CLOCK CYCLE ENDS
end

endmodule // instructionmemtest
