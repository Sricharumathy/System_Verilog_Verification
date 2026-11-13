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
        $display("Randomization Success");
        $display("[GEN] : rst=%b,re=%b,we=%b,data_in=%b", trans.rst,trans.re,trans.we,trans.data_in);
        gen2drive.put(trans);
      end
      
    end
  endtask
endclass
   
      
