
module tb_alu_decoder;
    reg  [1:0] ALUOp;
    reg  [2:0] funct3;
    reg        funct7b5;
    reg        opb5;
    wire [3:0] ALUControl;

    alu_decoder dut (
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7b5(funct7b5),
        .opb5(opb5),
        .ALUControl(ALUControl)
    );

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end


initial begin
        $display("ALUOp funct3 f7b5 opb5 | ALUControl ");
        
        ALUOp = 2'b00; funct3 = 3'b000; 
        funct7b5 = 0; opb5 = 0; 
        #10 $display("%b     %b     %b    %b  |   %b", ALUOp, funct3, funct7b5, opb5, ALUControl);
        
        ALUOp = 2'b01; funct3 = 3'b000; 
        funct7b5 = 0; opb5 = 0; 
        #10 $display("%b     %b     %b    %b  |   %b", ALUOp, funct3, funct7b5, opb5, ALUControl);

       
        ALUOp = 2'b10;      
        funct3 = 3'b000; funct7b5 = 0; opb5 = 0;
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b000; funct7b5 = 1; opb5 = 1; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        
        funct3 = 3'b001; funct7b5 = 0; opb5 = 0; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b010; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b011; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b100; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b101; funct7b5 = 0; opb5 = 0;  
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b101; funct7b5 = 1; opb5 = 0;
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b110; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b111;
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        ALUOp = 2'b11;
        funct3 = 3'b000; funct7b5 = 0; opb5 = 0; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b001; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        funct3 = 3'b010; 
        #10 $display("%b     %b     %b    %b  |   %b  ", ALUOp, funct3, funct7b5, opb5, ALUControl);

        ALUOp = 2'b00;
        funct3 = 3'b00; funct7b5 = 1'b0; opb5 = 1'b0; 
        #10 $display("00     000     0    0  |   %b  ", ALUControl);

        #10 $finish;
    end
endmodule
