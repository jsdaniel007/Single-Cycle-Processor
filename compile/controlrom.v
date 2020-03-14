module controlrom (decoderIn, controlLines);
//Performance cost: #8 gates deep + 1 for wire saturation
	input [63:00] decoderIn;
	output reg [6:00] controlLines;

//whenever the decoderIn variable changes, do this
always @ (decoderIn) begin
	case (decoderIn)
	//ADD Instruction
		64'b0100000000000000000000000000000000000000000000000000000000000000:controlLines <= 7'b111000x;
	//NOR Instruction
		64'b0000000000000000000000000000000000000000000000000000000001000000:controlLines <= 7'b111110x;
	//LW Instruction
		64'b0000000000000000000000000000000000000000000000000100000000000000:controlLines <= 7'b0010010;
	//SW Instruction
		64'b0000000000000000000000000000000000000000000000000000010000000000:controlLines <= 7'bxx00011;
	//BEQ Instruction
		64'b0000000010000000000000000000000000000000000000000000000000000000:controlLines <= 7'bxx01x0x;

		default: controlLines <= 7'b0000000;
	endcase
end
endmodule // controlrom
