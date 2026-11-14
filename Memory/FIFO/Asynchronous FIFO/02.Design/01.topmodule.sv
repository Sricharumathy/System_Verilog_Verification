`include "wrpointer.sv"
`include "rdpointer.sv"
`include "synchronizer.sv"
`include "fifomem.sv"
module topmodule(
  input wclk,rclk,rst_n,wenb,renb,
  input [7:0] data_in,
  output  [7:0] data_out,
  output  full,empty);
  wire [3:0] Bwptr;
  wire [3:0] Brptr;
  wire [3:0] Gwptr1;
  wire [3:0] Gwptr2;
  wire [3:0] Grptr1;
  wire [3:0] Grptr2;
  
  wire write_enable;
  wire read_enable;
  //Qualify memory enables---Currently, your memory receives raw wenb and renb.
  assign write_enable = wenb && !full;
  assign read_enable  = renb && !empty;
  
  wrpointer dut(.wclk(wclk),.rst_n(rst_n),.wenb(wenb),.gptr_syn(Grptr2),.bwptr(Bwptr),.gwptr(Gwptr1),.full(full));
  rdpointer dut1(.rclk(rclk),.rst_n(rst_n),.renb(renb),.gptr_syn(Gwptr2),.brptr(Brptr),.grptr(Grptr1),.empty(empty));
  synchronizer dut2(.clk(wclk),.rst_n(rst_n),.din(Grptr1),.qout(Grptr2));
  synchronizer dut3(.clk(rclk),.rst_n(rst_n),.din(Gwptr1),.qout(Gwptr2));
  fifomem dut4(.wclk(wclk),.rclk(rclk),.rst_n(rst_n),.wenb(write_enable),.renb(read_enable),.data_in(data_in),.wbptr(Bwptr),.rbptr(Brptr),.data_out(data_out));
endmodule
  
