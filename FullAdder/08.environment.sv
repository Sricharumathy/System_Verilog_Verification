class environment;
  transaction trans;
  generator gen;
  driver drive;
  monitor mon;
  scoreboard scb;
  mailbox g2d;
  mailbox m2s;
  virtual intff vif;
  
  function new( virtual intff vif);
    this.vif=vif;
    g2d=new();
    m2s=new();
    gen=new(g2d);
    drive=new(g2d,vif);
    mon=new(vif,m2s);
    scb=new(m2s);
  endfunction
  
  task test_run();
    fork 
      gen.run();
      drive.run();
      mon.run();
      scb.run();
    join
  endtask
endclass
