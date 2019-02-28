module tb_pc_reg;
    reg clk;
    reg [31:0] pc_next;
    wire [31:0] pc;

    pc_reg uut(.clk(clk), .pc_next(pc_next), .pc(pc));

    initial clk = 0;
    always #5 clk = ~clk;

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        
        $display("time | pc_next (hex)   |   pc (hex)  | pc (bin)");

        pc_next = 32'h00000000; 
        #10 $display("%4d | %08h        | %08h   | %032b", $time, pc_next, pc, pc);

        pc_next = 32'h00000004; 
        #10 $display("%4d | %08h        | %08h   | %032b", $time, pc_next, pc, pc);

        pc_next = 32'h00000008; 
        #10 $display("%4d | %08h        | %08h   | %032b", $time, pc_next, pc, pc);

        pc_next = 32'h0000000C; 
        #10 $display("%4d | %08h        | %08h   | %032b", $time, pc_next, pc, pc);

        pc_next = 32'h00000010; 
        #10 $display("%4d | %08h        | %08h   | %032b", $time, pc_next, pc, pc);

        #10 $finish;
    end
endmodule

