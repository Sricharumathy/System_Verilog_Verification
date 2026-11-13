interface intfifo;
  logic clk,rst,re,we;
  logic [7:0] data_in;
  logic full,empty;
  logic [7:0] data_out;
endinterface
