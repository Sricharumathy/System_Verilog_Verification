class  environment;
  agent agt;
  scoreboard scb;
  
  mailbox mon2scb;
  virtual intff vif;
  
  function new(virtual intff vif);
  this.vif=vif;
    mon2scb=new();
    agt=new(vif,mon2scb);
    scb=new(mon2scb);
    
  endfunction
  
  task run();
    fork
      agt.run();
      scb.run();
    join
  endtask
endclass
