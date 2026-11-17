class WriteMonitor;
  transaction trans;
  mailbox #(transaction) wmon2scb;
  virtual intfifo vif;
  function new(virtual intfifo vif,mailbox #(transaction)wmon2scb);
    this.vif=vif;
    this.wmon2scb=wmon2scb;
  endfunction
  task run();
    repeat(20) begin     
      @(posedge vif.wclk);
      if(vif.rst_n && vif. wenb && !vif.full) begin
        trans=new();
        trans.wenb=vif.wenb;
        trans.data_in=vif.data_in;
         wmon2scb.put(trans);
        end     
    end
  endtask
endclass
