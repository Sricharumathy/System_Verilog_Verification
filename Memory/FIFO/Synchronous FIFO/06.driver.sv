class driver;
  transaction trans;
  virtual intfifo vif;
  mailbox gen2drive;
  function new (mailbox gen2drive,virtual intfifo vif);
    this.gen2drive=gen2drive;
    this.vif=vif;
  endfunction
  task run();
    repeat (10) begin
      gen2drive.get(trans);
      @(negedge vif.clk);
      vif.rst = trans.rst;
      vif.re = trans.re;
      vif.we = trans.we;
      vif.data_in = trans.data_in;
    end
  endtask
endclass
