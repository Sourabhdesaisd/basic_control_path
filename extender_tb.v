module tb_extender;
    reg  [31:0] Instr;
    reg  [1:0]  ImmSrc;
    wire [31:0] ImmExt;

 extender uut (.Instr(Instr),.ImmSrc(ImmSrc),.ImmExt(ImmExt));

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        $display(" ImmSrc  | Instr(hex)| ImmExt(hex)| ImmExt(binary)");
        
        Instr = 32'hFFF_FF123; 
        ImmSrc = 2'b00; 
        #10 $display("  %b     | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = 32'h000_00A5; 
        ImmSrc = 2'b00;
        #10 $display("   %b    | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = {7'h7F, 5'h0, 5'h1F, 12'h000}; 
        ImmSrc = 2'b01;
        #10 $display("   %b    | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = {7'h00, 5'h0, 5'h05, 12'h000}; 
        ImmSrc = 2'b01; 
        #10 $display("   %b    | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = {1'b1, 6'b111111, 20'h0}; 
        Instr[7] = 1'b1;
        Instr[11:8] = 4'b1111;
        Instr[30:25] = 6'b111111;
        ImmSrc = 2'b10; 
        #10 $display("   %b    | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = 32'h0000_0080;
        ImmSrc = 2'b10; 
        #10 $display("   %b    | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = 32'h00000000;
        Instr[31] = 1'b1;
        Instr[19:12] = 8'h12;
        Instr[20] = 1'b1;
        Instr[30:21] = 10'h3FF;
        ImmSrc = 2'b11;
        #10 $display("   %b    | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = 32'h00F00A00; ImmSrc = 2'b11; 
        #10 $display("   %b    | %08h | %08h | %032b", ImmSrc, Instr, ImmExt, ImmExt);

        Instr = 32'h12345678; 
        ImmSrc = 2'bxx; 
        #10 $display("   xx    | %08h | %08h | %032b", Instr, ImmExt, ImmExt);

        #10 $finish;
    end
endmodule

