class driver;
  transaction #(8,8) trans;
  virtual intf vif;
  mailbox gen2drive;
  function new(virtual intf vif,mailbox gen2drive);
    this.vif=vif;
    this.gen2drive=gen2drive;
  endfunction
  task run();
    repeat(10)begin
      @(negedge vif.clk);
      gen2drive.get(trans);
      vif.rst=trans.rst;
      vif.we_a=trans.we_a;
      vif.we_b=trans.we_b;
      vif.addrA=trans.addrA;
      vif.addrB=trans.addrB;
      vif.data_inA=trans.data_inA;
      vif.data_inB=trans.data_inB;
      #1;
    end
  endtask
endclass
