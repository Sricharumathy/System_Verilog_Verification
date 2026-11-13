class transaction;
  rand bit rst,re,we;
  rand bit [7:0] data_in;
  bit full,empty;
  bit [7:0] data_out;
  constraint reset_c {
  rst dist {1'b1 := 1, 1'b0 := 9};
}
endclass
  
