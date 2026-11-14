module synchronizer(input clk,rst_n,input [3:0] din,output reg [3:0] qout);
reg [3:0] q1;
always @(posedge clk or negedge rst_n) begin
if(!rst_n) begin
q1<=4'b0000;
qout<=4'b0000;
end
else begin
q1<=din;
qout<=q1;
end
end
endmodule
