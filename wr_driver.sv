class wr_driver extends uvm_driver#(wr_tx);
	`uvm_component_utils(wr_driver);
	`NEW_COMP
	virtual intf vif;
	task run();
		uvm_resource_db#(virtual intf)::read_by_name("FIFO","VIF",vif,this);
	forever begin
		seq_item_port.get_next_item(req);
		drive(req);
	//	req.print();
		seq_item_port.item_done();
	end
	endtask
	task drive(wr_tx tx);
		wait(vif.rst==0);
		@(vif.wr_drv_cb);
			vif.wr_drv_cb.wr_en   <= tx.wr_en;
			vif.wr_drv_cb.wdata   <= tx.wdata;
			tx.full    		  <= vif.wr_drv_cb.full;
			tx.overflow		  <= vif.wr_drv_cb.overflow;
		@(vif.wr_drv_cb);
			vif.wr_drv_cb.wr_en   <=0;
			vif.wr_drv_cb.wdata   <=0;
	endtask
endclass
