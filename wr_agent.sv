class wr_agent extends uvm_agent;
	`uvm_component_utils(wr_agent)
	`NEW_COMP
	wr_sequencer sqr;
	wr_driver dri;
	wr_monitor wm;
	wr_coverage wc;
	
	function void build();
		sqr=wr_sequencer::type_id::create("sqr",this);
		dri=wr_driver::type_id::create("dri",this);
		wm=wr_monitor::type_id::create("wm",this);
		wc=wr_coverage::type_id::create("wc",this);
	endfunction

	function void connect();
		dri.seq_item_port.connect(sqr.seq_item_export); 
		wm.ap_port.connect(wc.ap_export); 
	endfunction
endclass
