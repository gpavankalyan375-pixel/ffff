class wr_coverage extends uvm_subscriber #(wr_tx);
	`uvm_component_utils(wr_coverage)
	uvm_analysis_imp#(wr_tx,wr_coverage) ap_export;
	wr_tx tx;


	covergroup CG1;
		coverpoint tx.wr_en{
			bins zero={0};
			bins one={1};
		}
	endgroup
	function new(input string name="",uvm_component parent);
		super.new(name,parent);
		CG1=new();
		ap_export=new("ap_export",this);
	endfunction

	function void write(wr_tx t);
		tx=new t;
	 	CG1.sample();
	endfunction

endclass

