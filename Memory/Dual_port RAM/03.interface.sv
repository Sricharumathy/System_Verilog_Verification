interface  intf #(parameter width=8,parameter depth=8);
  logic clk,rst;
  logic we_a,we_b;
  logic [width-1:0]data_inA,data_inB;
  logic [$clog2(depth)-1:0]addrA,addrB;
  logic [width-1:0]data_outA,data_outB;
endinterface
