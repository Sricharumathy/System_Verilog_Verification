class monitor;
  transaction #(8,8) trans;
  virtual intf vif;
  mailbox mon2scb;
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat(10) begin
      trans=new();
      @(posedge vif.clk);
      trans.rst=vif.rst;
      trans.we_a=vif.we_a;
      trans.we_b=vif.we_b;
      trans.addrA=vif.addrA;
      trans.addrB=vif.addrB;
      trans.data_inA=vif.data_inA;
      trans.data_inB=vif.data_inB;
      #1;
      trans.data_outA=vif.data_outA;
      trans.data_outB=vif.data_outB;
      mon2scb.put(trans);
    end
  endtask
endclass
