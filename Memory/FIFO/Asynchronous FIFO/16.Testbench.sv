`include "transaction.sv"
`include "interface.sv"
`include "WriteGenerator.sv"
`include "WriteDriver.sv"
`include "WriteMonitor.sv"
`include "ReadGenerator.sv"
`include "ReadDriver.sv"
`include "ReadMonitor.sv"
`include "WriteAgent.sv"
`include "ReadAgent.sv"
`include "scoreboard.sv"
`include "Environment.sv"
`include "Test.sv"
module tb;

  intfifo vif();

  topmodule dut(
    .wclk(vif.wclk),
    .rclk(vif.rclk),
    .rst_n(vif.rst_n),
    .wenb(vif.wenb),
    .renb(vif.renb),
    .data_in(vif.data_in),
    .data_out(vif.data_out),
    .full(vif.full),
    .empty(vif.empty)
  );

  test t;

  initial begin
    vif.wclk = 0;
    forever #5 vif.wclk = ~vif.wclk;
  end

  initial begin
    vif.rclk = 0;
    forever #7 vif.rclk = ~vif.rclk;
  end

  initial begin
    vif.rst_n = 0;
    vif.wenb = 0;
    vif.renb = 0;
    vif.data_in = 0;

    repeat(3) @(posedge vif.wclk);
    vif.rst_n = 1;

    t = new(vif);
    fork
      t.run();
    join_none

    #500;
    $display("SIMULATION COMPLETED");
    $finish;
  end

endmodule
