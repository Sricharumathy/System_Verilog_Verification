// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"
module testbench;
  intf vif();
  dualport #(8,8) dut (
    .clk       (vif.clk),
    .rst       (vif.rst),
    .we_a      (vif.we_a),
    .we_b      (vif.we_b),
    .data_inA  (vif.data_inA),
    .data_inB  (vif.data_inB),
    .addrA     (vif.addrA),
    .addrB     (vif.addrB),
    .data_outA (vif.data_outA),
    .data_outB (vif.data_outB)
);
  environment env;
  initial vif.clk=1;
  always #5 vif.clk=~vif.clk;
 
    initial begin
      $dumpfile("dualport.vcd");
    $dumpvars;
  end
  initial begin
    env = new(vif);
    env.run();
    $finish;
  end
endmodule
