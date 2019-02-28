module tb_pc_target;
    reg  [31:0] pc;
    reg  [31:0] imm_ext;
    wire [31:0] pc_target;

    pc_target uut(.pc(pc), .imm_ext(imm_ext), .pc_target(pc_target));

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        $display("PC (hex)      | ImmExt (hex) | PC_Target (hex) | PC_Target (binary)");

        pc = 32'h00000010; imm_ext = 32'h00000014; #5;
        #10 $display("%h   | %h   |     %h      |   %b", pc, imm_ext, pc_target, pc_target);

        pc = 32'h00000020; imm_ext = 32'h00000054; #5;
        #10 $display("%h   | %h   |     %h      |   %b", pc, imm_ext, pc_target, pc_target);

        pc = 32'h00010450; imm_ext = 32'h00000010; #5;
        #10 $display("%h   | %h   |     %h      |   %b", pc, imm_ext, pc_target, pc_target);
 
        #10 $finish;
    end
endmodule
 
