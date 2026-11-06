module dualport#(parameter width=8,parameter depth=8)
 			   (input clk,rst,we_a,we_b,
                input [width-1:0]data_inA,data_inB,
                input [$clog2(depth)-1:0]addrA,addrB,
                output logic [width-1:0]data_outA,data_outB);
  logic [width-1:0] mem [depth-1:0];


always @(posedge clk) begin
    if (rst) begin
        for (int i = 0; i < depth; i++)
            mem[i] <= 0;
    end
    else begin
        //portA
        if (we_a) begin
            if (we_b) begin
                if (addrA != addrB)
                    mem[addrA] <= data_inA;
            end
            else begin
                mem[addrA] <= data_inA;
            end
        end
      //portB
        if (we_b) begin
            if (we_a) begin
                if (addrA != addrB)
                    mem[addrB] <= data_inB;
            end
            else begin
                mem[addrB] <= data_inB;
            end
        end

    end
end
//port A reads
always @(posedge clk) begin
    if (rst) begin
        data_outA <= 0;
    end
    else begin
        if (!we_a) begin
            data_outA <= mem[addrA];
        end
    end
end
//port B reads
always @(posedge clk) begin
    if (rst) begin
        data_outB <= 0;
    end
    else begin
        if (!we_b) begin
            data_outB <= mem[addrB];
        end
    end
end
endmodule
