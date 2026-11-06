class environment;
  agent agt;
  scoreboard #(8,8)scb;
  mailbox mon2scb;
  virtual intf vif;
  function new(virtual intf vif);
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
