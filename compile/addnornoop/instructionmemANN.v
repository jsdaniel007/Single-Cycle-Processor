module instructionmem(addr, instr, clk, rst);
//Performance Cost: #20 + 1
    input wire clk, rst;
    input wire [31:0] addr; //PC Counter input, treat as address
    output reg [31:0] instr;

    reg [31:0] mem[0:65535]; //holds your instructions from memory

    always @(posedge clk, posedge rst) begin
        if (rst == 1) begin
	        instr <= 32'h00000000; //noop- outputs nothing
            //$readmemh ("compile/halt/prg.bin", mem);
            //$readmemh ("compile/loadword/prg.bin", mem);
            //$readmemh ("compile/storeword/prg.bin", mem);
            $readmemh("compile/addnornoop/prg.bin", mem);
		end

        if (rst == 0) begin
            //prg.bin content is sent to mem[addr]
            //instr is set as said prg.bin content
			instr <= mem[addr];
            //#600
            //$display("IM: Moving instr to: %h, %h", instr, mem[addr]);
            //$display("IM Output: %h", instr);
        end
    end


endmodule
