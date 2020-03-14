module datamemorytest();
//Performance Cost: #20 + 1
reg [31:0] Ina;
reg [31:0] Inb;
reg enable;
reg readwrite;
reg clk;
reg rst; //reset
reg [31:0] memory[0:65535];
output wire [31:0] dataOut;
integer i;

//for testing:
//no assembly required
//once rst is 1 everything is 0'd, you will use a load word Instruction
//and then do a store word instruction on that, and load to see if the store worked
//correctly

datamem DUT(Ina, Inb, enable, readwrite, dataOut, clk, rst);
initial begin
	rst <= 1;
	#21
	//Load word instruction
	$display("Load word for address 32'd1");
	clk <= 0;
	#21 //initiate our clock at the low flatline, or "a"

	clk <= 1;
	enable <= 1;
	readwrite <= 0;
	Ina <= 32'b00000000000000000000000000000001;
	Inb <= 32'd5;
	#21 //end of label b
	$display("dataOut result: %b", dataOut);
	/*for (i = 0; i <= 10; i= i + 1) begin
		$display("first 10 datmem entries : %b", memory[i]);
	end*/
	//CLOCK CYCLE ENDS

	//store word instruction
	$display ("Store word for address 32'd1");
	clk <= 0;
	#21 //initiate our clock at the low flatline, or "a"

	clk <= 1;
	enable <= 1;
	readwrite <= 1; //write mode
	Ina <= 32'b00000000000000000000000000000001;
	Inb <= 32'b11111111111111111111111111111111;
	#21
	$display("dataOut result: %b", dataOut);
	/*for (i = 0; i <= 10; i= i + 1) begin
		$display("first 10 datmem entries : %b", memory[i]);
	end*/
	//CLOCK CYCLE ENDS

	//Load word instruction
	$display("Load word for address 32'd1");
	clk <= 0;
	#21 //initiate our clock at the low flatline, or "a"

	clk <= 1;
	enable <= 1;
	readwrite <= 0;
	Ina <= 32'b00000000000000000000000000000001;
	Inb <= 32'b00000000000000000000000000000001;
	#21 //end of label b
	$display("dataOut result: %b", dataOut);
	for (i = 0; i <= 10; i= i + 1) begin
		$display("first 10 datmem entries : %b", memory[i]);
	end
	//CLOCK CYCLE ENDS


end
endmodule
