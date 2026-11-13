class monitor;
  transaction trans;
  virtual intfifo vif;
  mailbox mon2scb;
  function new(virtual intfifo vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat(10) begin
      trans=new();
      @(posedge vif.clk);
      trans.rst=vif.rst;
      trans.re=vif.re;
      trans.we=vif.we;
      trans.data_in=vif.data_in;
      #1;
      trans.full=vif.full;
      trans.empty=vif.empty;
      trans.data_out=vif.data_out;
      mon2scb.put(trans);
    end
  endtask
endclass
  
