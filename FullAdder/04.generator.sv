class generator;
  transaction trans;
  mailbox g2d;
  function new(mailbox g2d);
    this.g2d=g2d;
  endfunction
  task run();
    repeat(2) begin
      trans=new();
      if(!trans.randomize())
        $display("Randomization Failed");
      else begin
        trans.display("Generator");
        g2d.put(trans);
        #3;
      end
      end
  endtask
endclass
