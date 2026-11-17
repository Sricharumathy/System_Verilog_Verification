class test;
  environment env;

  function new(virtual intfifo vif);
    env = new(vif);
  endfunction

  task run();
    env.run();
  endtask
endclass
