class scoreboard #(parameter width=8, parameter depth=8);
  transaction #(8,8) trans;
  mailbox mon2scb;
  logic [width-1:0] refmem [depth-1:0];
  logic [width-1:0] expected_A, expected_B;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat (10) begin
      mon2scb.get(trans);
      if(trans.rst) begin
        for(int i=0;i<depth;i++) begin
          refmem[i]='0;
        end
          expected_A = '0;
          expected_B = '0;
      end
      else  begin
        if(!trans.we_a) begin
          expected_A=refmem[trans.addrA];
        end 
        if(!trans.we_b) begin
         expected_B=refmem[trans.addrB];
        end
        if(trans.we_a && trans.we_b) begin
          if(trans.addrA != trans.addrB) begin
            refmem[trans.addrA]=trans.data_inA;
            refmem[trans.addrB]=trans.data_inB;
          end
        end
        else if(trans.we_a) begin
          refmem[trans.addrA]=trans.data_inA;
        end
        else if(trans.we_b) begin
          refmem[trans.addrB]=trans.data_inB;
        end
      end 
      if (expected_A === trans.data_outA)
        $display("[PASS] Port A Expected=%h Actual=%h",
                 expected_A, trans.data_outA);
      else
        $display("[FAIL] Port A Expected=%h Actual=%h",
                 expected_A, trans.data_outA);

      if (expected_B === trans.data_outB)
        $display("[PASS] Port B Expected=%h Actual=%h",
                 expected_B, trans.data_outB);
      else
        $display("[FAIL] Port B Expected=%h Actual=%h",
                 expected_B, trans.data_outB);
    end
  endtask
endclass
     
      
   
      
      
  
