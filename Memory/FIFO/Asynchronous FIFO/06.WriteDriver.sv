class WriteDriver;
  transaction trans;
  mailbox #(transaction) wg2drvr;
  virtual intfifo vif;
  function new(mailbox #(transaction) wg2drvr,virtual intfifo vif);
    this.wg2drvr=wg2drvr;
    this.vif=vif;
  endfunction
  task run();
    repeat(20) begin
      wg2drvr.get(trans);
      @( negedge vif.wclk);
      if(vif.rst_n) begin
        vif.wenb=trans.wenb;
        vif.data_in=trans.data_in;
      end
      @(negedge vif.wclk);
      vif.wenb=0;
    end
  endtask
endclass
      
