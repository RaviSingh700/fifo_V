`define number 190
//`define number_1 5
int error;
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "fifo_if.sv"
`include "fifo_trans.sv"
`include "fifo_sequence.sv"
`include "fifo_sequencer.sv"
`include "fifo_dri.sv"
`include "fifo_monitor_act.sv"
`include "fifo_monitor_pas.sv"
`include "fifo_agent_act.sv"
`include "fifo_agent_pas.sv"
`include "fifo_score.sv"
`include "fifo_enviro.sv"
`include "fifo_tb.sv"

module uvm_top;
  bit clk;
  always #5 clk=~clk;
  fifo_if inter(clk);
  //flow fsm(.in(i.in),.reset(i.reset),.out(i.out),.sysclk(sysclk));
  fifo fifi(.data_in(inter.data_in),.clk(clk),.rst_n(inter.rst_n),.push(inter.push),.pop(inter.pop),.push_err_on_full(inter.push_err_on_full),.pop_err_on_empty(inter.pop_err_on_empty),.full(inter.full),.empty(inter.empty),.data_out(inter.data_out));
  
  
  initial
    begin
      uvm_config_db#(virtual fifo_if)::set(null,"*","iface",inter);
    end
  initial
    begin
      run_test("fifo_tb");
    end
  
    
initial begin //to create vcd file for waveform viewing
  $dumpfile("fifo.vcd");
  $dumpvars;
end
endmodule
