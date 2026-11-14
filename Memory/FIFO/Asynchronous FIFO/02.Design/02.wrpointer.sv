module wrpointer(
  input wclk,rst_n,wenb,
  input [3:0] gptr_syn,
  output reg [3:0] bwptr,
  output reg [3:0]gwptr,
  output reg full);
  
  reg [3:0] bwptr_next;
  reg [3:0] gwptr_next;
  reg full_next;
  // binary to gray of current pointer
  always @(*) begin
    gwptr[3] = bwptr[3];
    gwptr[2] = bwptr[3] ^ bwptr[2];
    gwptr[1] = bwptr[2] ^ bwptr[1];
    gwptr[0] = bwptr[1] ^ bwptr[0];
end

  assign bwptr_next=bwptr+(wenb && !full);
  // binary to gray of next pointer
  always @(*) begin
    gwptr_next[3]=bwptr_next[3];
    gwptr_next[2]=bwptr_next[3]^bwptr_next[2];
    gwptr_next[1]=bwptr_next[3]^bwptr_next[2]^bwptr_next[1];
    gwptr_next[0]=bwptr_next[3]^bwptr_next[2]^bwptr_next[1]^bwptr_next[0];
  end
  
   assign full_next=(gwptr_next[3:2]== ~gptr_syn[3:2])&&(gwptr_next[1:0]==gptr_syn[1:0]);
  
  always @(posedge wclk or negedge rst_n) begin
    if(!rst_n) begin
      bwptr<=4'b0000;
      full<=1'b0;
    end
    else begin
      if(wenb && !full)
        bwptr<=bwptr_next;
      full<=full_next;
            
    end
  end
endmodule
 
  
