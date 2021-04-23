testbench = regfile_TestBench

vsrc = $(filter-out $(testbench)%,$(wildcard *.v))

all : regfile_TestBench.out

$(testbench).out : $(testbench).v $(vsrc) 
	@echo "COMPILE $(vsrc)"
	@iverilog -s $(testbench) -o $@ $^
	@echo "COMPILE Done"
	
.PHONY : clean emulate wave

clean : 
	@rm -f $(testbench).out
	
emulate : $(testbench).out
	vvp $^ -lxt2
