module tb;

    reg  [31:0] A, B;
    reg  [3:0]  ALUCtrl;
    wire [31:0] Result;

alu uut (.A(A), .B(B), .ALUCtrl(ALUCtrl), .Result(Result));

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        
        ALUCtrl=4'b0000; A=10; B=3;       
        #10 $display("ADD  A=%b B=%b  Result=%b", A, B, Result);
        ALUCtrl=4'b0001; A=5;  B=10;      
        #10 $display("SUB A=%b (0x%h) B=%b (0x%h) => Result(hex)=0x%h  Result(signed)=%b",
                      A, A, B, B, Result, $signed(Result));      
        ALUCtrl=4'b0010; A=32'hF0F0F0F0; 
        B=32'h0F0F0F0F; #10 $display("AND  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0011; A=32'hAAAA0000; B=32'h0000AAAA; 
        #10 $display("OR   A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0100; A=32'hAAAAAAAA; B=32'h55555555; 
        #10 $display("XOR  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0101; A=-1; B=5;       
        #10 $display("SLT  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0110; A=32'hFFFFFFFF; B=5; 
        #10 $display("SLTU A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0111; A=32'h12345ABC; B=0; 
        #10 $display("LUI  A=%b Result=%b", A, Result);
        ALUCtrl=4'b1000; A=32'h1000; B=32'h00045ABC; 
        #10 $display("ADDU A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1001; A=0; B=32'hABCDEFFF; 
        #10 $display("UPB  B=%b Result=%b", B, Result);
        ALUCtrl=4'b1010; A=1; B=1;       
        #10 $display("SLL  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1011; A=32'h80000000; B=1; 
        #10 $display("SRA  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1100; A=32'h80000000; B=1; 
        #10 $display("SRL  A=%b B=%b Result=%b", A, B, Result);

        /*ALUCtrl=4'b0000; A=100; B=200;   
        #10 $display("ADD  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0001; A=50;  B=20;   
        #10 $display("SUB A=%b (0x%b) B=%b (0x%b) => Result(hex)=0x%b  Result(signed)=%b",
                      A, A, B, B, Result, $signed(Result)); 
        ALUCtrl=4'b0010; A=32'hAAAAAAAA; B=32'h55555555; 
        #10 $display("AND  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0011; A=32'h12340000; B=32'h0000ABCD;
        #10 $display("OR   A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0100; A=32'h12345678; B=32'h87654321; 
        #10 $display("XOR  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0101; A=10; B=20;     
        #10 $display("SLT  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0110; A=10; B=20;     
        #10 $display("SLTU A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0111; A=32'hABCDEFFF; B=0; 
        #10 $display("LUI  A=%b Result=%b", A, Result);
        ALUCtrl=4'b1000; A=32'h2000; B=32'hFFFF8000; 
        #10 $display("ADDU A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1001; A=0; B=32'h12345ABC; 
        #10 $display("UPB  B=%b Result=%b", B, Result);
        ALUCtrl=4'b1010; A=1; B=4;      
        #10 $display("SLL  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1011; A=-16; B=2;    
        #10 $display("SRA  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1100; A=32'hF0000000; B=4; 
        #10 $display("SRL  A=%b B=%b Result=%b", A, B, Result);

        ALUCtrl=4'b0000; A=-5; B=2;     
        #10 $display("ADD  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0001; A=-8; B=-3;    
        #10 $display("SUB A=%b (0x%b) B=%b (0x%b) => Result(hex)=0x%b  Result(signed)=%b",
                      A, A, B, B, Result, $signed(Result)); 
        ALUCtrl=4'b0010; A=32'hFFFFFFFF; B=32'h12345678;
        #10 $display("AND  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0011; A=32'hF0F0F0F0; B=32'h0F0F0F0F; 
        #10 $display("OR   A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0100; A=32'hFFFFFFFF; B=32'h00000000; 
        #10 $display("XOR  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0101; A=-10; B=-20; 
        #10 $display("SLT  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0110; A=30; B=20;    
        #10 $display("SLTU A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b0111; A=32'h0000FFFF; B=0; 
        #10 $display("LUI  A=%b Result=%b", A, Result);
        ALUCtrl=4'b1000; A=32'h3000; B=32'h12345000; 
        #10 $display("ADDU A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1001; A=0; B=32'h0000FFFF; 
        #10 $display("UPB  B=%b Result=%b", B, Result);
        ALUCtrl=4'b1010; A=16; B=2;     
        #10 $display("SLL  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1011; A=32'hF0000000; B=4; 
        #10 $display("SRA  A=%b B=%b Result=%b", A, B, Result);
        ALUCtrl=4'b1100; A=32'h12345678; B=8; 
        #10 $display("SRL  A=%b B=%b Result=%b", A, B, Result);*/

        #10 $finish;
    end
endmodule

