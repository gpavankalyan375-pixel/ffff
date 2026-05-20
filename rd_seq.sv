class rd_seq extends uvm_sequence#(rd_tx);
	`uvm_object_utils(rd_seq)
	`NEW_OBJ
endclass
class full_read extends rd_seq;
	`uvm_object_utils(full_read)
	`NEW_OBJ
	task body();
		repeat(`DEPTH)begin
			`uvm_do(req)
		end
	endtask
endclass
