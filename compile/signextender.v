module signextend32 (inA, outA);
//Performance Cost: 0 due to no gates
	input wire [15:00] inA;
	output wire [31:00] outA;

	//Assumption: acts as an append onto inA, with 16 bits of inA[15]
	//pay attention to the brackets, its like parenthesis
	assign outA = {{16{inA[15]}}, inA};

endmodule //signextend32
