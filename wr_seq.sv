class wr_seq extends uvm_sequence#(wr_tx);
	`uvm_object_utils(wr_seq)
	`NEW_OBJ
endclass

class full_write extends wr_seq;
	`uvm_object_utils(full_write)
	`NEW_OBJ
	task body();
		repeat(`DEPTH)begin
			`uvm_do(req)
		end
	endtask
endclass

