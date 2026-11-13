class environment;
  generator gen;
  driver drive;
  monitor mon;
  scoreboard scb;
  virtual intfifo vif;
  mailbox gen2drive;
  mailbox mon2scb;
  function new( virtual intfifo vif);
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
    join
  endtask
endclass
  
    
