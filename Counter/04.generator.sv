class generator;
  transaction trans;
  mailbox gen2drive;
  function new(mailbox gen2drive);
    this.gen2drive=gen2drive;
  endfunction
  task run();
    repeat (10) begin
    trans=new();
    if(!trans.randomize())
      $display("Randomization Failed");
    else begin
      $display("Randomization Passed");
      $display("[GEN]-->rst=%b,mode=%b",trans.rst,trans.mode);    
      gen2drive.put(trans);
    end
    end
  endtask
endclass
