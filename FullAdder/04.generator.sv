class generator;
  transaction trans;
  mailbox  gen2drive;
  function new (mailbox gen2drive);
    this.gen2drive=gen2drive;
  endfunction
  task run();
    repeat(8) begin
      trans=new();
      trans.randomize();
      $display("a=%0d,b=%0d,c=%0d",trans.a,trans.b,trans.c);
      gen2drive.put(trans);
    end
  endtask
endclass
