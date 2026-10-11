module dff(output logic q,input logic clk,rst,d);
  always @(posedge clk) begin
    if(rst)
      q<=0;
    else
      q<=d;
  end
endmodule
