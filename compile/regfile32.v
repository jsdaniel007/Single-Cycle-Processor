module regfile32 (read1, read2, writeto, writedat, writeenable, out1, out2, clock, reset);
//Performance Cost: 5 + 1
input [4:0] read1; //Register to check
input [4:0] read2; //Register to check
input [4:0] writeto; //register # to write to
input [31:0] writedat; //data to be written to writeto register
input writeenable, clock, reset;
wire [31:0] Y0, Y1, Y2;
output reg [31:0] out1, out2;
// 32 bit registers x 32, do not use register 0
reg [31:0] RF [31:0];

integer signextendbit = 0;
//Makes read1 and read2 compatible with our RF 32 bit register, sign extending this
//in the process
assign Y0 = {{27{signextendbit}}, read1};
assign Y1 = {{27{signextendbit}}, read2};
//assign Y2 = {{27{signextendbit}}, writeto};

integer i;
always @ (posedge clock, posedge reset)
begin

	if (reset == 1)
	begin
		for (i = 0; i <= 31; i = i + 1)
		begin
			//zero out RF
			RF[i] = 32'd0;
		end
	end
		if (writeenable == 1)
		begin
			//#420 Trial 1
			//assign writeto = {{28{writeto[4]}}, writeto};
			//#471 //#530 - 29
			RF[writeto] <= writedat;
			$display("RF[writeto] <= writedat is here!!!");
		end

		//#400 //Don't change unless it bleeds into another cycle
		//$display("Register[writeto] %b", RF[writeto]);
		//$display("Register File out1: %b", out1);
		//$display("Register File out2: %b", out2);
		for (i = 0; i < 32; i = i + 1) begin
		$display("register%d: %b", i, RF[i]);
		end

		out1 <= RF[Y0];
		out2 <= RF[Y1];
		$display("out1: %b", out1);
		$display("out2: %b", out2);
	end
		//Under the always block

endmodule //regfile32
