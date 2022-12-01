class fifo_monitor_pas extends uvm_monitor;
  `uvm_component_utils(fifo_monitor_pas)
  
  virtual fifo_if inter;
  fifo_trans tns;
  
  uvm_analysis_port#(fifo_trans) mon_aport;
  function new(string name="", uvm_component parent);
    super.new(name, parent);
    if(!uvm_config_db#(virtual fifo_if)::get(this,"","iface",inter))
      `uvm_fatal(get_type_name(),"interface not set monitor");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    @(negedge inter.clk);
    repeat(`number)
      begin
        @(negedge inter.push or negedge inter.pop);
       // @(negedge vif.clk);
        //@(posedge vif.push or posedge vif.pop);
      tns=new("tns");
        //@(posedge vif.sysclk);
        tns.full=inter.full;
        `uvm_info(get_type_name(),$sformatf("input value monitor  FULL=%d",inter.full),UVM_LOW);
        tns.empty=inter.empty;
        `uvm_info(get_type_name(),$sformatf("input value monitor  EMPTY=%d",inter.empty),UVM_LOW);
        tns.push_err_on_full=inter.push_err_on_full;
       `uvm_info(get_type_name(),$sformatf("input value monitor  PUSH_ERR_ON_FULL=%d",inter.push_err_on_full),UVM_LOW);
        tns.pop_err_on_empty=inter.pop_err_on_empty;
       `uvm_info(get_type_name(),$sformatf("input value monitor  PUSH_ERR_ON_EMPTY=%d",inter.pop_err_on_empty),UVM_LOW);
        //@(posedge vif.push or vif.pop);
      tns.data_out=inter.data_out;
        `uvm_info(get_type_name(),$sformatf("input value monitor  DATA_OUT=%d",inter.data_out),UVM_LOW);
  
      
      mon_aport.write(tns);
      //  @(negedge vif.clk);
      //`uvm_info(get_type_name(),"monitor",UVM_LOW);
    end
  endtask
endclass
