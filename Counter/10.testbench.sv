`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "environment.sv"

module testbench;
    intff vif();
    counter dut(vif);
    environment env;
    initial vif.clk=0;
    always #5 vif.clk=~vif.clk;
  
  initial begin
    vif.rst  = 1;
    vif.mode = 0;
    repeat (2) @(posedge vif.clk);         
    #1;                             
    env=new(vif);
    env.run();
    $finish;
  end
  initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars;
  end
endmodule
