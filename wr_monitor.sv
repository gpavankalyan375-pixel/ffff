class wr_monitor extends uvm_monitor;
	`uvm_component_utils(wr_monitor)
	`NEW_COMP
	virtual intf vif;
	wr_tx tx;
	uvm_analysis_port#(wr_tx) ap_port;

	function void build();
		ap_port=new("ap_port",this);
	endfunction

	task run();
		uvm_resource_db#(virtual intf)::read_by_name("FIFO","VIF",vif,this);
		forever begin
			tx=new("tx");
			@(vif.wr_mon_cb);
			if(vif.wr_mon_cb.wr_en==1)begin
				tx.wr_en    =vif.wr_mon_cb.wr_en;
				tx.wdata    =vif.wr_mon_cb.wdata;
				tx.full     =vif.wr_mon_cb.full;
				tx.overflow =vif.wr_mon_cb.overflow;
				tx.print();
				ap_port.write(tx);
			end
		end
	endtask
endclass
