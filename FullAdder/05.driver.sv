class driver;
  transaction trans;
  mailbox g2d;
  virtual intff vif;
  function new(mailbox g2d,virtual intff vif);
    this.g2d=g2d;
    this.vif=vif;
  endfunction
  task run();
    repeat(2) 
      begin
        g2d.get(trans);
        vif.a=trans.a;
        vif.b=trans.b;
        vif.c=trans.c;
        trans.display("Driver");
        #1;
      end
  endtask
endclass
