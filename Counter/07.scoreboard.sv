class scoreboard;
  bit [3:0]exp_count=0;
  transaction trans;
  mailbox mon2scb;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat(10) begin
      mon2scb.get(trans);
      if(trans.rst)
        exp_count=4'b0000;
      else begin
        if(trans.mode)
          exp_count=exp_count+1;
        else
          exp_count=exp_count-1;
      end
      if(exp_count==trans.count) begin
        $display("exp_count=%b",exp_count," == ","trans.count =%b",trans.count);
        $display("ScoreBoard Passed");
      end
      else begin
        $display("exp_count=%b",exp_count," != ","trans.count =%b",trans.count);
        $display("ScoreBoard Failed");
      end
    end 
  endtask
endclass
        
