class driver;
  mailbox gen2drive;
  transaction trans;
  virtual intf vif;
  function new(mailbox gen2drive, virtual intf vif);
    trans=new();
    this.vif=vif;
    this.gen2drive=gen2drive;
  endfunction
  task run(); 
    forever begin
      gen2drive.get(trans);
      vif.a=trans.a;
      vif.b=trans.b;
      vif.c=trans.c;
      #1;
       -> vif.transaction_driven;
      #1;
      
    end
  endtask
endclass
