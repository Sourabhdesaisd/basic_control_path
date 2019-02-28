module tb_main_decoder;
    reg  [6:0] op;
    wire       RegWrite, ALUSrc, MemWrite, Branch, Jump;
    wire [1:0] ImmSrc, ResultSrc, ALUop;

    main_decoder uut(.op(op), .RegWrite(RegWrite), .ImmSrc(ImmSrc), .ALUSrc(ALUSrc),
                     .MemWrite(MemWrite), .ResultSrc(ResultSrc),
                     .Branch(Branch), .ALUop(ALUop), .Jump(Jump));

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end
    
initial begin

        $display("Opcode  | RegWrite ImmSrc ALUSrc MemWrite ResultSrc Branch ALUop Jump");
        
        op = 7'b0000000; 
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b0000011; 
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b0100011; 
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b0110011;  
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b0010011;  
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b1100011; 
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b1101111;  
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b1100111;  
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b0110111; 
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b0010111; 
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);

        op = 7'b1111111; 
        #10 $display("%b |    %b      %02b     %b      %b       %02b      %b     %02b   %b",
                 op, RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUop, Jump);
        
        #10 $finish;
    end
endmodule

