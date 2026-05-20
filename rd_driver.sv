class rd_driver extends uvm_driver#(rd_tx);
	`uvm_component_utils(rd_driver)
	`NEW_COMP
    virtual intf vif;

	 task run();
		uvm_resource_db#(virtual intf)::read_by_name("FIFO","VIF",vif,this);
		forever begin
	 	seq_item_port.get_next_item(req);
		drive(req);
//		req.print();
	 	seq_item_port.item_done();
		end
	 endtask
	task drive(rd_tx tx);
		@(vif.rd_drv_cb);
			vif.rd_drv_cb.rd_en    <= tx.rd_en;
			tx.rdata     <= vif.rd_drv_cb.rdata;
			tx.empty     <= vif.rd_drv_cb.empty;
			tx.underflow <= vif.rd_drv_cb.underflow;
		@(vif.rd_drv_cb);
			vif.rd_drv_cb.rd_en   <=0;
	endtask
endclass
