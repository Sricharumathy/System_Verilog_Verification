// Code your design here
module sys_fifo(
  input clk,rst,re,we,
  input [7:0] data_in,
  output full,
  output empty,
  output reg [7:0] data_out);
  reg [7:0]mem[7:0];
  reg [3:0] wr_ptr=4'b0000;
  reg [3:0] rd_ptr=4'b0000;
  integer i;
  always @(posedge clk)begin
    if(rst) begin
      for(i=0;i<8;i=i+1)
        mem[i]<=0;
      wr_ptr <= 4'b0000;
    end
    else if(we && !full) begin
      mem[wr_ptr[2:0]]<=data_in;   // Write Operation
      wr_ptr<=wr_ptr+1;
    end
  end
  always @(posedge clk) begin
    if(rst) begin
      data_out<=0;
      rd_ptr <= 4'b0000;
    end
    else if(re && !empty ) begin
      data_out<=mem[rd_ptr[2:0]];
      rd_ptr<=rd_ptr+1;
    end
  end
  assign full=(wr_ptr[3]!=rd_ptr[3] && wr_ptr[2:0]==rd_ptr[2:0]) ? 1:0;
  assign empty=(wr_ptr==rd_ptr) ? 1:0;
endmodule
