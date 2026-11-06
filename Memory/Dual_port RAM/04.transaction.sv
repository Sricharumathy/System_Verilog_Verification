class transaction #(parameter width=8, parameter depth=8); 
  rand bit rst,we_a,we_b;
  rand bit [width-1:0] data_inA,data_inB;
  rand bit [$clog2(depth)-1:0] addrA,addrB;
   bit [width-1:0] data_outA,data_outB;
endclass
