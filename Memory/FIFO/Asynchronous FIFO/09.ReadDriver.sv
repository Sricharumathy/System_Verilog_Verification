class ReadDriver;
  transaction trans;
  mailbox #(transaction) rg2drvr;
  virtual intfifo vif;
  function new(mailbox #(transaction) rg2drvr,virtual intfifo  vif);
    this.rg2drvr=rg2drvr;
    this.vif=vif;
  endfunction
  task run();
    repeat (20) begin
      rg2drvr.get(trans);
      @(negedge vif.rclk);
      if(vif.rst_n)begin
        vif.renb=trans.renb;
      end
      @(negedge vif.rclk);
      vif.renb=0;
    end
  endtask
endclass
