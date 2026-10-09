class environment;
  generator gen;
  driver drive;
  monitor mon;
  scoreboard scb;
  mailbox gen2drive;
  mailbox mon2scb;
  virtual intf vif;
  
  function new( virtual intf vif);
    this.vif=vif;
    gen2drive=new();
    mon2scb=new();
    gen=new(gen2drive);
    drive=new(gen2drive,vif);
    mon=new(vif,mon2scb);
    scb=new(mon2scb);
  endfunction
  
  task run();
    fork 
      gen.run();
      drive.run();
      mon.run();
      scb.run();
    join_any
  endtask
endclass
