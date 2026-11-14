module rdpointer (
  input rclk,rst_n,renb,
  input [3:0] gptr_syn,
  output reg [3:0] brptr,
  output reg [3:0] grptr,
  output reg empty);
  reg [3:0]brptr_next;
  reg [3:0] grptr_next;
  reg empty_next;
  assign brptr_next=brptr+(renb && !empty);
  // binary to gray of current pointer
  always @(*) begin
    grptr[3] = brptr[3];
    grptr[2] = brptr[3] ^ brptr[2];
    grptr[1] = brptr[2] ^ brptr[1];
    grptr[0] = brptr[1] ^ brptr[0];
end
  //binary to gray of next pointer
  always @(*) begin
    grptr_next[3]=brptr_next[3];
    grptr_next[2]=brptr_next[3]^brptr_next[2];
    grptr_next[1]=brptr_next[3]^brptr_next[2]^brptr_next[1];
    grptr_next[0]=brptr_next[3]^brptr_next[2]^brptr_next[1]^brptr_next[0];
  end
  assign empty_next=grptr_next==gptr_syn;
  always @(posedge rclk or negedge rst_n) begin
    if(!rst_n) begin
      brptr<=4'b0000;
      empty<=1'b1;
    end
    else begin
      if(renb && !empty) 
        brptr<=brptr_next;
      empty<=empty_next;
      
    end
  end
  
endmodule
