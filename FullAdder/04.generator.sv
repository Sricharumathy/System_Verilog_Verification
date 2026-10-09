class generator;
  transaction trans;
  mailbox  gen2drive;
  function new (mailbox gen2drive);
    this.gen2drive=gen2drive;
  endfunction
  task run();
    repeat(8) begin
      #1;
      trans=new();
      if(!trans.randomize())
        $display("Randomization Failed");
      else begin
        $display("Randomization Passed");
        $display("[GEN] a=%0b b=%0b c=%0b", trans.a, trans.b, trans.c);
        gen2drive.put(trans);
      end
    end
  endtask
endclass
      
