class rd_agent extends uvm_agent;
	`uvm_component_utils(rd_agent)
	`NEW_COMP
	rd_sequencer sqr;
	rd_driver dri;
	rd_monitor rm;
	rd_coverage rc;
	function void build();
		sqr=rd_sequencer::type_id::create("sqr",this);
		dri=rd_driver::type_id::create("dri",this);
		rm=rd_monitor::type_id::create("rm",this);
		rc=rd_coverage::type_id::create("rc",this);
	endfunction

	function void connect();
			dri.seq_item_port.connect(sqr.seq_item_export);
			rm.ap_port.connect(rc.ap_export); 
	endfunction

endclass
