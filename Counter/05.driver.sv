class driver;
  transaction trans;
  virtual intff vif;
  mailbox gen2drive;

  function new(mailbox gen2drive, virtual intff vif);
    this.gen2drive = gen2drive;
    this.vif = vif;
  endfunction

  task run();
    repeat (10) begin
      gen2drive.get(trans);

      @(negedge vif.clk);
      vif.rst  <= trans.rst;
      vif.mode <= trans.mode;
    end
  endtask
endclass
