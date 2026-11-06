class generator;
  transaction #(8,8) trans;
  mailbox gen2drive;

  function new(mailbox gen2drive);
    this.gen2drive = gen2drive;
  endfunction

  task run();
    for (int i = 0; i < 10; i++) begin
      trans = new();

      if (!trans.randomize())
        $display("Randomization Failed");

      else begin
        // First transaction: Reset
        if (i == 0)
          trans.rst = 1;
        else
          trans.rst = 0;

        $display("Randomization Success");
        $display("-----Generator-----");

        $display("[GEN] rst=%b, we_a=%b, we_b=%b, addrA=%b, addrB=%b, data_inA=%b, data_inB=%b",
          trans.rst, trans.we_a, trans.we_b,
          trans.addrA, trans.addrB,
          trans.data_inA, trans.data_inB);

        gen2drive.put(trans);
      end
    end
  endtask
endclass
