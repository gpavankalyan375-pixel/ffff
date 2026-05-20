class test extends uvm_test;
	`uvm_component_utils(test)
	`NEW_COMP
	env e;
	function void build();
		e=env::type_id::create("e",this);
	endfunction
	function void end_of_elaboration();
		uvm_top.print_topology();
	endfunction
endclass
class test1 extends test;
	`uvm_component_utils(test1)
	`NEW_COMP
		full_write fw;
		full_read fr;
	task run_phase(uvm_phase phase);
		fw=new("fw");
		fr=new("fr");
		phase.raise_objection(this);
		fw.start(e.wa.sqr);
		fr.start(e.ra.sqr);
		phase.phase_done.set_drain_time(this,100);
		phase.drop_objection(this);
	endtask
endclass
