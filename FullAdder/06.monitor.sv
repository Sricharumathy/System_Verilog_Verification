class monitor;
  transaction trans;
  virtual intf vif;
  mailbox mon2scb;
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat(8) begin
     @(vif.transaction_driven);
      trans=new();
      trans.a=vif.a;
      trans.b=vif.b;
      trans.c=vif.c;
      trans.sum=vif.sum;
      trans.carry=vif.carry;
      mon2scb.put(trans);
      
    end
  endtask
endclass
