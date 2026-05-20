`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "common.sv"
`include "fifo.v"
`include "interface.sv"
`include "wr_tx.sv"
`include "rd_tx.sv"
`include "wr_seq.sv"
`include "rd_seq.sv"
`include "wr_sqr.sv"
`include "rd_sqr.sv"
`include "wr_driver.sv"
`include "rd_driver.sv"
`include "wr_monitor.sv"
`include "rd_monitor.sv"
`include "wr_coverage.sv"
`include "rd_coverage.sv"
`include "wr_agent.sv"
`include "rd_agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;
   
   	bit wr_clk,rd_clk,rst;

    intf pif(wr_clk,rd_clk,rst);

    fifo dut(.wr_clk(pif.wr_clk),
			 .rd_clk(pif.rd_clk),
			 .rst(pif.rst),
			 .wr_en(pif.wr_en),
			 .wdata(pif.wdata),
			 .full(pif.full),
			 .overflow(pif.overflow),
			 .rd_en(pif.rd_en),
			 .rdata(pif.rdata),
			 .empty(pif.empty),
			 .underflow(pif.underflow));

	initial begin
		run_test("test1");
	end
	initial begin
		wr_clk=0;
		rd_clk=0;
		rst=1;
		repeat(2)@(posedge wr_clk);
		rst=0;
	end
	always #5 wr_clk=~wr_clk;
	always #5 rd_clk=~rd_clk;

	initial begin
		uvm_resource_db#(virtual intf)::set("FIFO","VIF",pif,null);
	end
endmodule

