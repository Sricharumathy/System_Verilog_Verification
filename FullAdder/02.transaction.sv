class transaction;
  rand bit a,b,c;
  bit sum,carry;
  function void display(string name);
    $display("----------%s----------",name);
    $display("a=%b,b=%b,c=%b,sum=%b,carry=%b",a,b,c,sum,carry);
    $display("------------------------------------------------");
  endfunction
endclass
