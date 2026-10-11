class driver;
  transaction trans;
  virtual intfdff vif;
  mailbox gen2drive;
  function new(virtual intfdff vif,mailbox gen2drive);
    this.vif=vif;
    this.gen2drive=gen2drive;
  endfunction
  task run();
    repeat(10) begin
      @(posedge vif.clk);
      gen2drive.get(trans);
      vif.rst=trans.rst;
      vif.d=trans.d;
      #1;
    end
  endtask
endclass
