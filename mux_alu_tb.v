module tb_alu_mux;
    reg  [31:0] wd;
    reg  [31:0] ImmExt;
    reg         ALUSrc;
    wire [31:0] B_out;

    alu_mux uut(.wd(wd), .ImmExt(ImmExt), .ALUSrc(ALUSrc), .B_out(B_out));
initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        $display("ALUSrc | wd            | ImmExt       | B_out (hex)    | B_out (bin)");

        wd  = 32'h0000000A; ImmExt = 32'hFFFF_FFF6; ALUSrc = 1'b0; #1; 
        $display("   %b   | %08h      | %08h     | %08h       | %032b", ALUSrc, wd, ImmExt, B_out, B_out);

        ALUSrc = 1'b1; #1; 
        #10 $display("   %b   | %08h      | %08h     | %08h       | %032b", ALUSrc, wd, ImmExt, B_out, B_out);

        
        wd  = 32'h0000_1234; ImmExt = 32'h0000_1000; ALUSrc = 1'b0;
        #10 $display("   %b   | %08h      | %08h     | %08h       | %032b", ALUSrc, wd, ImmExt, B_out, B_out);

        ALUSrc = 1'b1; 
        #10 $display("   %b   | %08h      | %08h     | %08h       | %032b", ALUSrc, wd, ImmExt, B_out, B_out);

        #10 $finish;
    end
endmodule

