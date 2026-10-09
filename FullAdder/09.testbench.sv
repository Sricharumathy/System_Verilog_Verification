`include "transaction.sv"
`include "interface.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module testbench;
  intf vif();
  fulladder dut1(.a(vif.a),.b(vif.b),.c(vif.c),.sum(vif.sum),.carry(vif.carry));
  environment env;
  initial begin
    env=new(vif);
    env.run();
  end
endmodule
