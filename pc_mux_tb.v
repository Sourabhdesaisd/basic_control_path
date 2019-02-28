module tb_pc_mux;
    reg        pcsrc;
    reg  [31:0] pc_plus4, pc_target;
    wire [31:0] pc_next;

    pc_mux uut(.pcsrc(pcsrc), .pc_plus4(pc_plus4), .pc_target(pc_target), .pc_next(pc_next));

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        $display("PCSrc | PC+4 (hex)   | PC_Target (hex) | PC_Next (hex) | PC_Next (binary)");

        pc_plus4 = 32'h00000014; pc_target = 32'h00000028;
        pcsrc = 0; 
        #10 $display("%b     | %h     | %h |            %h | %b", pcsrc, pc_plus4, pc_target, pc_next, pc_next);

        pcsrc = 1; #5;
        #10 $display("%b     | %h     | %h |            %h | %b", pcsrc, pc_plus4, pc_target, pc_next, pc_next);

        pc_plus4 = 32'h00000100; pc_target = 32'h000000F0;
        pcsrc = 1; 
        #10 $display("%b     | %h     | %h |            %h | %b", pcsrc, pc_plus4, pc_target, pc_next, pc_next);
         
        pc_plus4 = 32'h00000001; pc_target = 32'h0000005;
        pcsrc = 0;
        #10 $display("%b     | %h     | %h |            %h | %b", pcsrc, pc_plus4, pc_target, pc_next, pc_next);
        
        #10 $finish;
    end
endmodule

