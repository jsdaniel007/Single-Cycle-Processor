# Single-Cycle-Processor
Single-Cycle Processor Implemented with iVerilog in CSCI 330: Computer Architecture with Dr. Paul West

Processor based on MIPS-32 Design below:

![MIPS 32 Datapath](pics/07-datapathdiagram.pdf)

The entire processor with modules can be seen in the compile/SingleCycleProc.v testfile

Example: Our SingleCycleProccessor is running a "load word Instruction" so here is our assembly instructions sent to the processor

Assembly File instruction (compile/loadword/loadword.s)

    lw 1 0 three
done halt
three .fill 3

Hexadecimal Machine Language Translation (compile/loadword/prg.bin)

8C010002
FC000000
00000003
00000000
00000000

And here is the result of our running our instruction through our processor:
Use this to follow the values along:

![Load Word Guide](pics/loadwordguide.pdf)

Note: This is a lot of output

[Single Cycle Processor Ouput](pics/loadwordout.txt)

