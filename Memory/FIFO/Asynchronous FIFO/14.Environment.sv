class environment;
  write_agent wa;
  read_agent ra;
  scoreboard scb;

  mailbox #(transaction) wmon2scb;
  mailbox #(transaction) rmon2scb;

  function new(virtual intfifo vif);
    wmon2scb = new();
    rmon2scb = new();

    wa = new(vif, wmon2scb);
    ra = new(vif, rmon2scb);

    scb = new(wmon2scb, rmon2scb);
  endfunction

  task run();
    fork
      wa.run();
      ra.run();
      scb.run();
    join
  endtask
endclass
