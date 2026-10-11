class monitor;
  transaction trans;
  virtual intff vif;
  mailbox m2s;
  function new(virtual intff vif,mailbox m2s);
    this.vif=vif;
    this.m2s=m2s;
  endfunction
  task run();
    #1;
    repeat(2) 
    begin
      trans=new();
      trans.a= vif.a;
      trans.b=vif.b;
      trans.c=vif.c;
      trans.sum=vif.sum;
      trans.carry=vif.carry;
      m2s.put(trans);
      trans.display("Monitor");
      #2;
    end
  endtask
endclass
      
      
      
