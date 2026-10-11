class generator;
  transaction trans;
  mailbox gen2drive;
  function new(mailbox gen2drive);
    this.gen2drive=gen2drive;
  endfunction
  task run();
    repeat(10) begin
      trans=new();
      if(trans.randomize()) begin
        $display("Randomization Passed!");
        $display("[GEN] rst=%b,d=%b,q=%b",trans.rst,trans.d,trans.q);
        gen2drive.put(trans);
      end
      else
        $display("Randomization Failed");
    end
  endtask
endclass
