`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
module testbench;
  intfifo vif();
  sys_fifo dut (
    .clk(vif.clk),
    .rst(vif.rst),
    .we(vif.we),
    .re(vif.re),
    .data_in(vif.data_in),
    .full(vif.full),
    .empty(vif.empty),
    .data_out (vif.data_out)
);
  environment env;
  initial vif.clk=0;
  always #5 vif.clk=~vif.clk;
 
    initial begin
      $dumpfile("syn_fifo.vcd");
    $dumpvars;
  end
  initial begin
    env = new(vif);
    env.run();
    $finish;
  end
endmodule
