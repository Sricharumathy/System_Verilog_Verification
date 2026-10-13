class monitor;
  transaction trans;
  virtual intff vif;
  mailbox mon2scb;
  function new(virtual intff vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat(10) begin
      trans=new();
      @(posedge vif.clk);
      trans.rst=vif.rst;
      trans.mode=vif.mode;
      #1;
      trans.count=vif.count;
      $display("[Mon]-->rst=%b,mode=%b,count=%b",trans.rst,trans.mode,trans.count);
      mon2scb.put(trans);
    end
  endtask
endclass
      
