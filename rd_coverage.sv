class rd_coverage extends uvm_subscriber#(rd_tx);
	`uvm_component_utils(rd_coverage)
	uvm_analysis_imp#(rd_tx,rd_coverage) ap_export;
	rd_tx tx;
	covergroup CG2;
	coverpoint tx.rd_en{
			bins zero={0};
			bins one={1};
		}
	endgroup
	function new(input string name="",uvm_component parent);
		super.new(name,parent);
		CG2=new();
		ap_export=new("ap_export",this);
	endfunction

	function void write(rd_tx t);
		tx=new t;
	 	CG2.sample();	
	endfunction

endclass

