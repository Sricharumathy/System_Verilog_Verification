`include "transaction.sv"
`include "interface.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
module testbench;
  intff vif();
  fulladder dut(.a(vif.a),.b(vif.b),.c(vif.c),.sum(vif.sum),.carry(vif.carry));
  environment env;
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
  end
  initial begin
    env=new(vif);
    env.test_run();
    $finish;
  end
endmodule
