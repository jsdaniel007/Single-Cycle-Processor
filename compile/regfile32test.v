module regfile32test ();
//Performance Cost: 5 + 1
reg [4:0] read1;
reg [4:0] read2;
reg [4:0] writeto; //register # to write to
reg [31:0] writedat; //data to be written to writeto register
reg writeenable, clock, reset;
wire [31:0] out1, out2;
// 32 bit registers x 32, do not use register 0
reg [31:0] RF [31:0];

regfile32 DUT(read1, read2, writeto, writedat, writeenable, out1, out2, clock, reset);
initial begin
    $dumpfile("gtk/regfile32-gtkwave.vcd");
    $dumpvars(0, DUT);

    $display("\nInitialize Values with reset");
    //Initialize our Registers with our 0's
    reset <= 0;
    #6
    reset <= 1;
    #6
    reset <= 0;
    #6
    //$display("RegOut1: %b", out1);
    //$display("RegOut2: %b", out2);

    //Tests for writeenable being off, meaning nothing should occur
    $display("\nFirst Test with write enable 0");
    clock <= 0;
    writeenable <= 0;
    read1 <= 5'd0;
    read2 <= 5'd0;
    writeto <= 5'd1;
    writedat <= 32'd200;
    clock <= 1;
    #6
    $display("read1: %b", read1);
    $display("read2: %b", read2);
    $display("writeto (regAddress): %b", writeto);
    $display("writedat: %b", writedat);
    $display("Output====");
    //$display("RegOut1: %b", out1);
    //$display("RegOut2: %b", out2);

    $display("\nWrite Enable--> 200 to regAddr1");
    clock <= 0;
    writeenable <= 1;
    read1 <= 5'd0;
    read2 <= 5'd0;
    writeto <= 5'd1;
    writedat <= 32'd200;
    clock <= 1;
    #6
    $display("read1: %b", read1);
    $display("read2: %b", read2);
    $display("writeto (regAddress): %b", writeto);
    $display("writedat: %b", writedat);
    $display("Outputs=========");
    //$display("RegOut1: %b", out1);
    //$display("RegOut2: %b", out2);
    //The problem with this is that we don't have permission to write to the register
    //So we have to test this within our regfile32
    //$display("Register File Out %b\n", RF[writeto]);

    $display("\nWrite Enable--> 300 to regAddr2");
    clock <= 0;
    #6
    clock <= 1;
    writeenable <= 1;
    read1 <= 5'd5;
    read2 <= 5'd6;
    writeto <= 5'd2;
    writedat <= 32'd300; //W1 should be 2 in binary, works
    clock <= 1;
    #6
    $display("read1: %b", read1);
    $display("read2: %b", read2);
    $display("writeto (regAddress): %b", writeto);
    $display("writedat: %b", writedat);
    $display("Outputs=========");
    //$display("RegOut1: %b", out1);
    //$display("RegOut2: %b", out2);


    $display("\nRead from our previously written registers");
    clock <= 0;
    #6
    clock <= 1;
    writeenable <= 1;
    read1 <= 5'd1;
    read2 <= 5'd2;
    writeto <= 5'd3;
    writedat <= 32'd3; //should be 3 in binary, is
    clock <= 1;
    #6
    $display("read1: %b", read1);
    $display("read2: %b", read2);
    $display("writeto (regAddress): %b", writeto);
    $display("writedat: %b", writedat);
    $display("Outputs=========");
    //$display("RegOut1: %b", out1);
    //$display("RegOut2: %b", out2);
end
endmodule // regfile32test
