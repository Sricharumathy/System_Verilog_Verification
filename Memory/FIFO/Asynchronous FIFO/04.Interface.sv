interface intfifo;
  logic wclk,rclk,rst_n,wenb,renb;
  logic [7:0] data_in;
  logic [7:0] data_out;
  logic full, empty;
endinterface
