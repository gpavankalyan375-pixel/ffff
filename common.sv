`define WIDTH 8
`define DEPTH 8
`define PTR_WIDTH $clog2(`DEPTH)
`define NEW_COMP function new(input string name="",uvm_component parent); \
					super.new(name,parent); \
				endfunction 

`define NEW_OBJ function new(input string name=""); \
					super.new(name); \
				endfunction 
