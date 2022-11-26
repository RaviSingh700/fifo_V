/*`define VW_CLK clk
interface fifo_if (input logic `VW_CLK);
  logic  [7:0] data_in;
  logic   pop;
  logic   push;
  logic   rst_n;
  logic  [7:0] data_out;
  logic   empty;
  logic   full;
  logic   pop_err_on_empty;
  logic   push_err_on_full;
  // End of interface signals 


  // Start of clocking block definition 
  clocking cb @(posedge `VW_CLK);
    output data_in;
    output pop;
    output push;
    output rst_n;
    input data_out;
    input empty;
    input full;
    input pop_err_on_empty;
    input push_err_on_full;
  endclocking : cb
  // End of clocking block definition 

endinterface : fifo_if
*/
`define DATA_WIDTH 8
`define ADDR_WIDTH 4
interface fifo_if(input clk);
  logic [`DATA_WIDTH-1:0] data_in;
  logic rst_n,push,pop;
  logic [`DATA_WIDTH-1:0] data_out;
  logic push_err_on_full,pop_err_on_empty, full,empty;
endinterface
  