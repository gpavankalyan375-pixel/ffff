class env extends uvm_env;
	`uvm_component_utils(env)
	`NEW_COMP
	wr_agent wa;
	rd_agent ra;
	scoreboard sbd;

	function void build();
		wa=wr_agent::type_id::create("wa",this);
		ra=rd_agent::type_id::create("ra",this);
		sbd=scoreboard::type_id::create("sbd",this);
	endfunction
	function void connect();
		wa.wm.ap_port.connect(sbd.wr_export);
		ra.rm.ap_port.connect(sbd.rd_export);
	endfunction
endclass
