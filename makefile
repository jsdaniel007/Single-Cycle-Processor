singleCyclebeq:
	iverilog compile/ALU.v compile/32bitNOR.v compile/controlrom.v compile/beq/datamemBEQ.v compile/decoder6x64.v compile/equals.v compile/fadder.v compile/beq/instructionmemBEQ.v compile/mux21.v compile/mux32.v compile/mux51.v compile/regfile32.v compile/ripadder32.v compile/signextender.v compile/singleCycleProc.v compile/beq/singleCycleProctest.v -o compile/beq/singleCyclebeqrun
beqrun:
	compile/beq/./singleCyclebeqrun

singleCycleaddnornoop:
	iverilog compile/ALU.v compile/32bitNOR.v compile/controlrom.v compile/addnornoop/datamemANN.v compile/decoder6x64.v compile/equals.v compile/fadder.v compile/addnornoop/instructionmemANN.v compile/mux21.v compile/mux32.v compile/mux51.v compile/regfile32.v compile/ripadder32.v compile/signextender.v compile/singleCycleProc.v compile/addnornoop/singleCycleProctest.v -o compile/addnornoop/singleCycleaddnornooprun

addnornooprun:
	compile/addnornoop/./singleCycleaddnornooprun

addnornoopassemble:
	./a.out compile/addnornoop/addnornoop.s compile/addnornoop/prg.bin

singleCyclesw:
	iverilog compile/ALU.v compile/32bitNOR.v compile/controlrom.v compile/datamem.v compile/decoder6x64.v compile/equals.v compile/fadder.v compile/instructionmem.v compile/mux21.v compile/mux32.v compile/mux51.v compile/regfile32.v compile/ripadder32.v compile/signextender.v compile/singleCycleProc.v compile/storeword/singleCycleProctest.v -o compile/storeword/singleCycleswrun
storewordtest:
	compile/storeword/./singleCycleswrun
storeassemble:
	./a.out compile/storeword/storeword.s compile/storeword/prg.bin

datamemSW:
	iverilog compile/storeword/datamemSW.v compile/storeword/datamemSWtest.v -o testrun/datamemSWtest
	testrun/./datamemSWtest

singleCyclelw:
	iverilog compile/ALU.v compile/32bitNOR.v compile/controlrom.v compile/loadword/datamemLW.v compile/decoder6x64.v compile/equals.v compile/fadder.v compile/loadword/instructionmemLW.v compile/mux21.v compile/mux32.v compile/mux51.v compile/regfile32.v compile/ripadder32.v compile/signextender.v compile/singleCycleProc.v compile/loadword/singleCycleProctest.v -o compile/loadword/singleCyclelwrun
loadwordtest:
	compile/loadword/./singleCyclelwrun

singleCyclehalt:
	iverilog compile/ALU.v compile/32bitNOR.v compile/controlrom.v compile/datamem.v compile/decoder6x64.v compile/equals.v compile/fadder.v compile/instructionmem.v compile/mux21.v compile/mux32.v compile/mux51.v compile/regfile32.v compile/ripadder32.v compile/signextender.v compile/singleCycleProc.v compile/halt/singleCycleProctest.v -o compile/halt/singleCyclehaltrun
halttest:
	compile/halt/./singleCyclehaltrun

regfile32:
	iverilog compile/regfile32.v compile/regfile32test.v -o testrun/regfilerun
	testrun/./regfilerun

controlrom:
	iverilog compile/controlrom.v compile/controlromtest.v -o testrun/controlromrun
	testrun/./controlromrun

instructionmem:
	iverilog compile/instructionmem.v compile/instructionmemtest.v -o testrun/imemrun
	testrun/./imemrun

decoder6x64:
	iverilog compile/decoder6x64.v compile/decoder6x64test.v -o testrun/decoderrun
	testrun/./decoderrun

datamem:
	iverilog compile/datamem.v compile/datamemtest.v -o testrun/datamemtest
	testrun/./datamemtest
ALU:
	iverilog compile/ALU.v compile/ALUtest.v compile/32bitNOR.v compile/ripadder32.v compile/fadder.v compile/mux32.v compile/mux21.v compile/equals.v -o testrun/ALUrun
	testrun/./ALUrun

32bitNOR:
	iverilog compile/32bitNOR.v compile/32bitNORtest.v -o testrun/32bitNORrun
	testrun/./32bitNORrun

signextend:
	iverilog compile/signextender.v compile/signextendertest.v -o testrun/signextendrun
	testrun/./signextendrun
ripcarryadder:
	iverilog compile/ripadder32.v compile/ripadder32test.v compile/fadder.v -o testrun/ripcarryadderrun
	testrun/./ripcarryadderrun

adder:
	iverilog compile/fadder.v compile/faddertest.v -o testrun/fadderrun
	testrun/./fadderrun
mux32:
	iverilog compile/mux32.v compile/mux32test.v compile/mux51.v compile/mux21.v -o testrun/mux32run
	testrun/./mux32run
equals:
	iverilog compile/equals.v compile/equalstest.v -o testrun/equals32run
	testrun/./equals32run
mux51:
	iverilog compile/mux51.v compile/mux51test.v compile/mux21.v -o testrun/mux51run
	testrun/./mux51run

mux21:
	iverilog compile/mux21.v compile/mux21test.v -o testrun/mux21run
	testrun/./mux21run

gtkproc:
	export DISPLAY=:0
	gtkwave gtk/singleCycle-gtkwave.vcd
setup:
	mkdir compile
	mkdir testrun
	mkdir gtk
	mv *.v compile
clean:
	mv *.v compile

git:
	git add . && git commit
