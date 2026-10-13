module counter (intff vif);
  always_ff @(posedge vif.clk) begin
    if(vif.rst)
      vif.count<=0;
    else  begin
      if(vif.mode) 
        vif.count<=vif.count+1;
      else
        vif.count<=vif.count-1;
    end
  end
endmodule
