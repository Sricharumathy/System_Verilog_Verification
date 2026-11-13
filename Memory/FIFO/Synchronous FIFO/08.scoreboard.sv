class scoreboard;
  transaction trans;
  mailbox mon2scb;
  bit [7:0]refmem[7:0];
  bit [3:0] wptr;
  bit [3:0] rptr;
  integer count=0;
  bit [7:0] expected_data;
  bit dowrite,doread;
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  task run();
    repeat (10) begin
      mon2scb.get(trans);
      if(trans.rst) begin
        for(int i=0;i<8;i++)
          refmem[i]=0;
        wptr='0;
        rptr='0;
        expected_data='0;
        count=0;
      end
      
      else begin
        dowrite=trans.we && (count<8);
        doread=trans.re && (count>0);
        //read operation
        if(doread) begin
          expected_data=refmem[rptr[2:0]];
          rptr+=1;
        end
        
        //write operation
        if(dowrite) begin
          refmem[wptr[2:0]]=trans.data_in;
          wptr=wptr+1;
        end
        
        //update occupancy
        if(dowrite && !doread)
          count++;
        else if (!dowrite && doread)
          count--;
        
        // Data Comparison
        if(doread) begin
          if(expected_data == trans.data_out)
            $display("[PASS] Expected=%h Actual=%h",expected_data, trans.data_out);
          else
            $display("[FAIL] Expected=%h Actual=%h",expected_data, trans.data_out);
        end
       
        // FULL AND EMPTY CHECK
        if (trans.we || trans.re) begin
          if(trans.full == (count == 8))
            $display("[PASS] FULL");
          else
            $display("[FAIL] FULL Expected=%b Actual=%b",(count == 8), trans.full);
          if(trans.empty == (count == 0))
            $display("[PASS] EMPTY");
          else
            $display("[FAIL] EMPTY Expected=%b Actual=%b", (count == 0), trans.empty);
        end
      end
    end
  endtask
endclass
