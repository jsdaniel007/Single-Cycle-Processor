// Data memory
// NOTICE: data memory reads from prg.bin!
module datamem(Ina, Inb, enable, readwrite, dataOut, clk, rst);
    //Performance Cost: #20 + 1
    //slide labels
    input [31:0] Ina; //Addr- ALU input
    input [31:0] Inb; //DataIn- register file input
    input enable; //WrE
    input readwrite; //R/W
    input clk; //start of the clock, rising edge triggered
    input rst; //reset line

    reg [31:0] memory[0:65535]; //memory to be written to

    output reg [31:0] dataOut;

//TODO: Finish datamem

    /*
    clk- start of the clock
    rst- reset line, everything needs to be reset to 0 "on reset" until we have our assembly file
     */
    integer i;
    always @(posedge clk, posedge rst) begin
    if (rst == 1) begin //at the falling edge of the clock
        //this will be the assembly file that will read from to initialize values
        //"For now until we have our assembly"

        /*TODO: Without this, my register won't output correctly, but the contents are being written
        to my datamemory, what could be causing this?*/
        //$readmemh ("compile/halt/prg.bin", memory);
        //$readmemh ("compile/loadword/prg.bin", memory);
        $readmemh ("compile/storeword/prg.bin", memory);
        //$readmemh("compile/addnornoop/prg.bin", memory);
    end else begin
    #498 //THIS is catching the input in between the wire reaching datamemory and exiting ALU
    if (enable == 1) begin
        $display("DataMemory InA: %b", Ina);
        $display("DataMemory InB: %b", Inb);
    if (readwrite == 0) begin
    //when read is enabled...output our data @ our ina address to DataOut
    dataOut <= memory[Ina];
    #1
    $display("datamemory Dataout: %b", dataOut);
    //the idea is that since we can hold what's stored, we can also access initial begin
    //during the lw instruction
    end

    //if write mode is enabled
    if (readwrite == 1) begin
    //write our "word" at the Address
    memory[Ina] <= Inb;
    //Do we even do anything with dataOut?
    //dataOut <= 32'd0;
    //outputs datamem at the correct timing
    for (i = 0; i <= 8; i = i + 1) begin
    $display("Datamem contents %d: %b", i,  memory[i]);
    end
    end


    end //else end

    //if the memory write is enabled, have two cases for when read or write is enabled
        /*
        $display("\nThis is for the next cycle:");
        $display("DataMemory InA: %b", Ina);
        $display("DataMemory InB: %b", Inb);
        $display("datamemory Dataout: %b", dataOut);
        */
    end //if enable == 1 end

    end // always@ end

endmodule
