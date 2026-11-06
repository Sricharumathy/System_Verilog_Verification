class agent;
  generator gen;
  driver drv;
  monitor mon;
  mailbox gen2drive;
  mailbox mon2scb;
  virtual intf vif;
  function new(virtual intf vif,mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
    gen2drive=new();
    gen=new(gen2drive);
    drv=new(vif,gen2drive);
    mon=new(vif,mon2scb);
  endfunction
  task run();
    fork 
      gen.run();
      drv.run();
      mon.run();
    join
  endtask
endclass
    
    
    
  
