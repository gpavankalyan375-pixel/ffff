class rd_monitor extends uvm_monitor;
	`uvm_component_utils(rd_monitor)
	`NEW_COMP
	virtual intf vif;
	rd_tx tx;
	uvm_analysis_port#(rd_tx) ap_port;

	function void build();
		ap_port=new("ap_port",this);
	endfunction

	task run();
		uvm_resource_db#(virtual intf)::read_by_name("FIFO","VIF",vif,this);
		forever begin
			tx=new("tx");
			@(vif.rd_mon_cb);
			if(vif.rd_mon_cb.rd_en==1)begin
				tx.rd_en     =vif.rd_mon_cb.rd_en;
				tx.rdata     =vif.rd_mon_cb.rdata;
				tx.empty     =vif.rd_mon_cb.empty;
				tx.underflow =vif.rd_mon_cb.underflow;
				tx.print();
				ap_port.write(tx);
			end
		end
	endtask
endclass
