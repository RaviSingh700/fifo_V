class fifo_monitor_act extends uvm_monitor;
  `uvm_component_utils(fifo_monitor_act)
  
  virtual fifo_if inter;
  fifo_trans tns;
  
  uvm_analysis_port#(fifo_trans) mon_act_port;
  function new(string name="", uvm_component parent);
    super.new(name, parent);
    if(!uvm_config_db#(virtual fifo_if)::get(this,"","iface",inter))
      `uvm_fatal(get_type_name(),"interface not set monitor");
  endfunction
  
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    repeat(`number)
      begin
      tns=new("tns");
        @(negedge inter.clk);
      tns.data_in<=inter.data_in;
        `uvm_info(get_type_name(),$sformatf("input value monitor    DATA_IN=%d",inter.data_in),UVM_LOW);
      tns.rst_n<=inter.rst_n;
        `uvm_info(get_type_name(),$sformatf("input value monitor   RST_N=%d",inter.rst_n),UVM_LOW);
        //@(posedge vif.clk);
        tns.push<=inter.push;
       `uvm_info(get_type_name(),$sformatf("input value monitor   PUSH=%d",inter.push),UVM_LOW);
        tns.pop<=inter.pop;
       `uvm_info(get_type_name(),$sformatf("input value monitor   POP=%d",inter.pop),UVM_LOW);
      
      mon_act_port.write(tns);
      //`uvm_info(get_type_name,"monitor writing",UVM_LOW);
    end
  endtask
endclass
