class write_agent;
  WriteGenerator wg;
  WriteDriver wd;
  WriteMonitor wm;

  mailbox #(transaction) wg2drvr;
  mailbox #(transaction) wmon2scb;

  function new(virtual intfifo vif,
               mailbox #(transaction) wmon2scb);

    wg2drvr = new();

    this.wmon2scb = wmon2scb;

    wg = new(wg2drvr);
    wd = new(wg2drvr, vif);
    wm = new(vif, wmon2scb);
  endfunction

  task run();
    fork
      wg.run();
      wd.run();
      wm.run();
    join
  endtask
endclass
