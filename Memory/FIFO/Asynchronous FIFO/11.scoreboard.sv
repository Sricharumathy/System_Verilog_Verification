class scoreboard;
  transaction wtrans,rtrans;
  mailbox #(transaction)wmon2scb;
  mailbox #(transaction)rmon2scb;
  bit [7:0] expected_queue[$];
  bit [7:0] expected;
  function new (mailbox #(transaction) wmon2scb,mailbox #(transaction)rmon2scb);
    this.wmon2scb=wmon2scb;
    this.rmon2scb=rmon2scb;
  endfunction
  task collect_writes();
    forever begin
       wmon2scb.get(wtrans);
      expected_queue.push_back(wtrans.data_in);
      $display("Write Stored data= %h",wtrans.data_in);
    end
  endtask
  task collect_reads();
    forever begin
       rmon2scb.get(rtrans);
      if(expected_queue.size()>0) begin
        expected=expected_queue.pop_front();
      if(expected==rtrans.data_out)
        $display("PASS ---> data_in=%h,data_out=%h", expected,rtrans.data_out);
      else
        $display("FAIL ---> data_in=%h,data_out=%h", expected,rtrans.data_out);
      end
      else 
        $display("Expected Queue is Empty");
    end
  endtask
 
  task run();
    fork 
      collect_writes();
      collect_reads();
    join
   
  endtask
endclass
