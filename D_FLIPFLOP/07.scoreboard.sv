class scoreboard;
  transaction trans;
  mailbox mon2scb;
  bit exp_q;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat(10) begin
      mon2scb.get(trans);
      exp_q = trans.rst ? 1'b0 : trans.d;
      if(exp_q==trans.q) begin
        $display("Scoreboard Passed!");
        $display("[SCB]:PASS => rst=%b,d=%b,q=%b",trans.rst,trans.d,trans.q);
      end
      else begin
        $display("[SCB]:FAIL => rst=%b,d=%b,q=%b",trans.rst,trans.d,trans.q);
      end
    end
  endtask
endclass
      
