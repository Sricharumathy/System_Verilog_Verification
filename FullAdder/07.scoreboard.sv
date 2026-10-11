class scoreboard;
  bit esum,ecarry;
  transaction trans;
  mailbox m2s;
  function new(mailbox m2s);
    this.m2s=m2s;
  endfunction
  task run();
    repeat(2) begin
      m2s.get(trans);
      esum=trans.a^trans.b^trans.c;
      ecarry=(trans.a&trans.b|trans.b&trans.c|trans.c&trans.a);
      if(esum==trans.sum && ecarry==trans.carry) begin
        $display("Verification Passed!");
        trans.display("ScoreBoard");
      end
      else begin
        $display("Verification Failed!");
        trans.display("ScoreBoard");
      end
    end
  endtask
endclass
     
      
      
      
    
