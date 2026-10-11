`include "transaction.sv"
`include "interface.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
module testbench;
  intfdff vif();
  dff dut(.clk(vif.clk),.rst(vif.rst),.d(vif.d),.q(vif.q));
  environment env;
  initial vif.clk=0;
  always #5 vif.clk=~vif.clk;
  initial begin
    env=new(vif);
    env.run();
    $finish;
  end
endmodule
