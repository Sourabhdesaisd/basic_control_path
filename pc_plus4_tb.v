module tb_pc_plus4;
    reg  [31:0] pc;
    wire [31:0] pc_plus4;

    pc_plus4 uut(.pc(pc), .pc_plus4(pc_plus4));

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        $display("PC (hex)      | PC+4 (hex)   | PC+4 (binary)");
        
        pc = 32'h00000000; 
        #10 $display("%h      | %h     | %b", pc, pc_plus4, pc_plus4);

        pc = 32'h00000010;
        #10 $display("%h      | %h     | %b", pc, pc_plus4, pc_plus4);
         
        pc = 32'h00007709; 
        #10 $display("%h      | %h     | %b", pc, pc_plus4, pc_plus4);
        #10 $finish;
    end
endmodule 
