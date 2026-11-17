class ReadGenerator;
  transaction trans;
  mailbox #(transaction) rg2drvr;
  function new(mailbox #(transaction) rg2drvr);
    this.rg2drvr=rg2drvr;
  endfunction
  task run();
    repeat(20) begin
      trans=new();
      if(!trans.randomize())
        $display("-----Randomization Failed-----");
      else begin
        $display("-----Randomization Success -----");
        $display("renb=%b",trans.renb);
        rg2drvr.put(trans);
      end
    end
  endtask
endclass
