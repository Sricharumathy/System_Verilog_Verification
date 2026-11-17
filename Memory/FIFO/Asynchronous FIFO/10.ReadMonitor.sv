class ReadMonitor;
  transaction trans;
  mailbox #(transaction) rmon2scb;
  virtual intfifo vif;
  function new(virtual intfifo vif,mailbox #(transaction) rmon2scb);
    this.vif=vif;
    this.rmon2scb=rmon2scb;
  endfunction
  task run();
    repeat (20) begin
      @(posedge vif.rclk);
      if(vif.rst_n && vif.renb && !vif.empty) begin
        trans=new();
        trans.renb=vif.renb;
        #1;
        trans.data_out=vif.data_out;
        rmon2scb.put(trans);
      end
    end
  endtask
endclass
