`uvm_analysis_imp_decl(_wr)
`uvm_analysis_imp_decl(_rd)
class scoreboard extends uvm_component;
	`uvm_component_utils(scoreboard)
	`NEW_COMP
	uvm_analysis_imp_wr#(wr_tx,scoreboard) wr_export;
	uvm_analysis_imp_rd#(rd_tx,scoreboard) rd_export;
	int dataQ[$],value;
	int matchings,mismatching;
	 function void build();
	 	wr_export=new("wr_export",this);
	 	rd_export=new("rd_export",this);
	 endfunction
	 function void write_wr(wr_tx tx);
	 	if(tx.wr_en==1)begin
			dataQ.push_back(tx.wdata);
		end
     endfunction
	 function void write_rd(rd_tx tx);
	 	if(tx.rd_en==1)begin
			value=dataQ.pop_front();
			if(value==tx.rdata)	 matchings++;
			else mismatching++;
		end
     endfunction
	 function void check();
	 	$display("matchings=%0d",matchings);
		$display("mismatching=%0d",mismatching);
	 endfunction
endclass
