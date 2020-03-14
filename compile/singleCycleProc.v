module singleCycleProc (clk, rst);

	//Wires
	input wire clk, rst;
	wire pcMuxSelect;
	wire [31:00] pcMuxOut;
	wire eq;
	wire [6:00] cromWire;
	wire [31:00] iMemWireIn;
	wire [31:00] iMemWireOut; //PC Counter input, instruction wire output
	wire [31:00] signextWireIn;
	wire [31:00] signextWireOut;
	wire [31:00] regfileoutTop, regfileoutBot;
	wire [31:00] regfileData;
	wire [4:00] regfileWriteTo;
	wire [31:00] ALUinTop, ALUinBot, ALUout;
	wire [31:00] datamemAddr, datamemData, datamemOut;
	wire [63:00] cromIn;

	//PC + 1 Hardware
	//registers can be used as input wires
	reg [31:00] PC;
	wire [31:00] fadderWire1, fadderWire2;

	//beq Hardware
	wire beqANDOut;
	wire opcodeNOT0, opcodeNOT1, opcodeNOT2, opcodeNOT4, opcodeNOT5;

	wire carryIn;
	assign carryIn = 0;
	wire [31:00] sum;
	wire [31:00] plusone;

	always @ (posedge clk, posedge rst) begin
		if (rst == 1) begin
			PC <= 32'd0;
		end else begin
		//PC being wired to the PC+1 leftmost mux
			//rollback code
			//PC <= fadderWire1;
			//This makes the pcMuxOut wire the INPUT to our PC reg
			PC <= pcMuxOut;
		end
	end

	integer one = 32'd1;
	integer zero = 32'd0;

	ripcarryadder pcadder1(one, PC, 1'b0, fadderWire1, carryIn);
	//pass in PC as an input for the first parameter
	instructionmem iMem(PC, iMemWireOut, clk, rst);
	//for these 7 instructions we only have the top selected, with BEQ hardware
	not #1(opcodeNOT0, iMemWireOut[31]);
	not #1(opcodeNOT1, iMemWireOut[30]);
	not #1(opcodeNOT2, iMemWireOut[29]);
	not #1(opcodeNOT4, iMemWireOut[27]);
	not #1(opcodeNOT5, iMemWireOut[26]);
	and #4(beqANDOut, eq, opcodeNOT0, opcodeNOT1, opcodeNOT2, iMemWireOut[28], opcodeNOT4, opcodeNOT5);
	mux32 muxFarLeft(fadderWire1, fadderWire2, beqANDOut, pcMuxOut);
	ripcarryadder PCadd2(fadderWire1, signextWireIn, carryIn, fadderWire2, carryIn);


	//you can specify a range for the instructionmem[15:20]
	//mux21 depend(inA, inB, inS, outO);
	mux51 muxCenterLeft(iMemWireOut[20:16], iMemWireOut[15:11], cromWire[6], regfileWriteTo); //input from imem
	mux32 muxCenterMiddle(datamemOut, ALUout, cromWire[5], regfileData); //CROM and Datamem/ALU
	mux32 muxCenterRight(signextWireIn, regfileoutBot, cromWire[3], ALUinBot); //CROM and Register File
	signextend32 extender(iMemWireOut[15:0], signextWireIn);
	//module regfile32 (read1, read2, writeto, writedat, writeenable, out1, out2, clock, reset);
	regfile32 regFile(iMemWireOut[25:21], iMemWireOut[20:16], regfileWriteTo, regfileData, cromWire[4], regfileoutTop, regfileoutBot, clk, rst);
	//module ALU (inA, inB, inOP, cin, out, eq);
	ALU theALU(regfileoutTop, ALUinBot, cromWire[2], carryIn, ALUout, eq); //ALU is not outputting
	//module datamem(Ina, Inb, enable, readwrite, dataOut, clk, rst);
	datamem dataMemory(ALUout, regfileoutBot, cromWire[1], cromWire[0], datamemOut, clk, rst);
	decoder6x64 decoder(iMemWireOut[31], iMemWireOut[30], iMemWireOut[29], iMemWireOut[28], iMemWireOut[27], iMemWireOut[26], cromIn);
	controlrom CROM(cromIn, cromWire);

	//REMEMBER THESE DISPLAYS OCCUR AT THE POSITIVE EDGE OF THE CLOCK
	always @(posedge clk)
	begin
		//This needs to be changed to be more accurate, or may not be needed, bc of the clock
		//#452
		$display("\nSCP DataPath Report: ");
		//$display("Clock status: %b", clk);
		#21 //PC + InstrMem Duration + 1
		$display("BEQ Output: %b", beqANDOut);
		$display("PC %d", PC);
		$display("Instruction Memory Output: %b", iMemWireOut);
		$display("Opcode: %b\n", iMemWireOut[31:26]);
		#19 //decoder travel time + 1
		$display("CROM Input: %b", cromIn); //input from decoder
		#9 //CROM Sending bit timing + 1
		$display("\nCROM Output: %b", cromWire);
		$display("W1 Mux: %b", cromWire[6]);
		$display("D1 Mux: %b", cromWire[5]);
		$display("Register File Enable: %b", cromWire[4]);
		$display("ALUinBot Mux: %b", cromWire[3]);
		$display("ALU Function bit: %b", cromWire[2]);
		$display("DataMemory Enable: %b", cromWire[1]);
		$display("DataMemory R/W mode: %b", cromWire[0]);

		$display("\nRegister File Status: ");
		$display("R1: %b", iMemWireOut[25:21]);
		$display("R2: %b", iMemWireOut[20:16]);
		$display("Register File regfileWriteTo (W1): %b", regfileWriteTo);
		$display("Register File outTop: %b", regfileoutTop);
		$display("Register File outBot: %b\n", regfileoutBot);
		#1 //CenterRight Mux wire
		$display("ALUmuxIn: %b", regfileoutBot);
		#10 //CenterRightMux pass in to ALU
		$display("ALUmuxOut: %b", ALUinBot);

		#1 //sign extend duration + 1
		$display("Sign extender:");
		$display("Sign extend input: %b", iMemWireOut[15:0]);
		$display("Sign extend out: %b", signextWireIn);


		#445 //ALU + 1
		$display("\nALU Status: ");
		$display("Input from regFileTop: %b", regfileoutTop);
		$display("Input from regFileBot: %b", ALUinBot);
		$display("Output of ALU: %b", ALUout);
		$display("EQ output: %b", eq);
		//#20
		//$display("\nDataMemory AddrtoRead: %b", ALUout);
		//$display("DataMemory Datain: %b", regfileoutBot);
		//$display("DataMemory Dataout: %b", datamemOut);
		#25
		$display("Register File regfileData (D1): %b", regfileData);
		$display("\nRegfileDataMux out:(Bottom) %b", regfileData);
		#1
		$display("PC + 1 Status:");
		$display("PC Adder Outputs for \n1:%b and \n2:%b", fadderWire1, fadderWire2);
		$display("pcMuxOut and Select: %b and %b\n", pcMuxOut, beqANDOut);
		$display("Clock status: %b\n", clk);

		//Total Timing: 532
		/*if (iMemWireOut[31:26] == 6'b111111) begin
			$finish();
		end*/

	end


endmodule // singleCycleProc
