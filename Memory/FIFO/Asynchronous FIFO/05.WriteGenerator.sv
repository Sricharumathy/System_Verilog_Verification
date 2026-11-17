class WriteGenerator;
  transaction trans;
  mailbox #(transaction) wg2drvr;
  function new(mailbox #(transaction) wg2drvr);
    this.wg2drvr=wg2drvr;
  endfunction
  task run();
    repeat(20) begin
      trans=new();
      if(trans.randomize()) begin
        $display("-----Randomization Successful-----");
        $display("wenb=%b,data_in=%h",trans.wenb,trans.data_in);
        wg2drvr.put(trans);
      end
      else begin
        $display("Randomization Failed");
      end
      
    end
  endtask
endclass
      
