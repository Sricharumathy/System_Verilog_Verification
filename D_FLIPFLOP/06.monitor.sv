class monitor;
  transaction trans;
  virtual intfdff vif;
  mailbox mon2scb;
  function new(virtual intfdff vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat(10) begin
      trans=new();
      @(posedge vif.clk);
      trans.rst=vif.rst;
      trans.d=vif.d;
      #1;
      trans.q=vif.q;
      mon2scb.put(trans);
    end
  endtask
endclass
