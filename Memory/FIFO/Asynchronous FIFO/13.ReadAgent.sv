class read_agent;
  ReadGenerator rg;
  ReadDriver rd;
  ReadMonitor rm;

  mailbox #(transaction) rg2drvr;
  mailbox #(transaction) rmon2scb;

  function new(virtual intfifo vif,
               mailbox #(transaction) rmon2scb);

    rg2drvr = new();

    this.rmon2scb = rmon2scb;

    rg = new(rg2drvr);
    rd = new(rg2drvr, vif);
    rm = new(vif, rmon2scb);
  endfunction

  task run();
    fork
      rg.run();
      rd.run();
      rm.run();
    join
  endtask
endclass
