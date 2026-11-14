module fifomem(
  input wclk,rclk,rst_n,wenb,renb,
  input [7:0] data_in,
  input [3:0] wbptr,
  input [3:0] rbptr,
  output reg [7:0]data_out);
  reg [7:0] fifo[7:0];
  
  always @(posedge wclk) begin
      if(wenb && rst_n)
        fifo[wbptr[2:0]]<=data_in;
  end
  always @(posedge rclk or negedge rst_n) begin
    if(!rst_n)  begin
      data_out<=8'b0;
    end
    else begin
      if(renb)
        data_out<=fifo[rbptr[2:0]];
    end
  end
endmodule
  
