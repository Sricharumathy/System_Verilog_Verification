class transaction;
  logic clk;
  rand logic rst,mode;
  logic [3:0] count;
  constraint c_rst { rst dist {0 := 8, 1 := 2}; }

endclass
