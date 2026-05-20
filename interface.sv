interface intf(input bit wr_clk,rd_clk,rst);
	bit [`WIDTH-1:0]wdata,rdata;
	bit wr_en,full,overflow,rd_en,empty,underflow;
	
	clocking wr_drv_cb@(posedge wr_clk);
		default input #0 output #0;
		input full,overflow;
		output wr_en,wdata;
	endclocking
	
	clocking rd_drv_cb@(posedge wr_clk);
		default input #0 output #0;
		input empty,underflow,rdata;
		output rd_en;
	endclocking
	
	clocking wr_mon_cb@(posedge rd_clk);
		default input #0 output #0;
		input full,overflow,wr_en,wdata;
	endclocking
	
	clocking rd_mon_cb@(posedge rd_clk);
		default input #0 output #0;
		input empty,underflow,rdata,rd_en;
	endclocking

endinterface
