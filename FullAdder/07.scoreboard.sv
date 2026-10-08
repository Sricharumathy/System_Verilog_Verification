class scoreboard;
  bit exp_sum;
  bit exp_carry;
  mailbox mon2scb;
  transaction trans;
  function new (mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  task run();
    forever begin
      mon2scb.get(trans);
      exp_sum=trans.a^trans.b^trans.c;
      exp_carry=((trans.a & trans.b)|(trans.b & trans.c)|(trans.c & trans.a));
      if(trans.sum ==exp_sum && trans.carry == exp_carry) begin
        $display("Verification Passed");
      end
      else begin
        $display("Verification Failed");
      end
    end
  endtask
endclass
