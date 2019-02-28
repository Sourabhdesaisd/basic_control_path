module tb_reg_file;
    reg clk, we2;
    reg [4:0] ra1, ra2, wa3;
    reg [31:0] wd3;
    wire [31:0] rd1, rd2;

    reg_file uut (.clk(clk),.we2(we2),.ra1(ra1),.ra2(ra2),.wa3(wa3),.wd3(wd3),.rd1(rd1),.rd2(rd2) );

initial clk = 0;
always #5 clk = ~clk;

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

 initial begin
        we2 = 0; wa3 = 0; wd3 = 0; ra1 = 0; ra2 = 0;

        #10 we2 = 1;

        wa3 = 0; wd3 = 32'h00000000; 
        #10 $display("Time=%0t WRITE : R[%0d] = %h ", $time, wa3, wd3);

        wa3 = 1; wd3 = 32'hAAAA1111; 
        #10 $display("Time=%0t WRITE : R[%0d] = %h", $time, wa3, wd3);

        wa3 = 2; wd3 = 32'hBBBB2222; 
        #10 $display("Time=%0t WRITE : R[%0d] = %h", $time, wa3, wd3);

        wa3 = 3; wd3 = 32'hCCCC3333; 
        #10 $display("Time=%0t WRITE : R[%0d] = %h", $time, wa3, wd3);

         wa3 = 4; wd3 = 32'h11113333; 
        #10 $display("Time=%0t WRITE : R[%0d] = %h", $time, wa3, wd3);

         wa3 = 5; wd3 = 32'h22446688; 
        #10 $display("Time=%0t WRITE : R[%0d] = %h", $time, wa3, wd3);

         wa3 = 6; wd3 = 32'h12345678; 
        #10 $display("Time=%0t WRITE : R[%0d] = %h", $time, wa3, wd3);

       

        we2 = 0; 
        
        ra1 = 0; ra2 = 1; 
        #10 $display("Time=%0t READ  : R[%0d] = %h, R[%0d] = %h", $time, ra1, rd1, ra2, rd2);

        ra1 = 2; ra2 = 3; 
        #10 $display("Time=%0t READ  : R[%0d] = %h, R[%0d] = %h", $time, ra1, rd1, ra2, rd2);

        ra1 = 4; ra2 = 0; 
        #10 $display("Time=%0t READ  : R[%0d] = %h, R[%0d] = %h", $time, ra1, rd1, ra2, rd2);

        ra1 = 4; ra2 = 5; 
        #10 $display("Time=%0t READ  : R[%0d] = %h, R[%0d] = %h", $time, ra1, rd1, ra2, rd2);

        ra1 = 5; ra2 = 6; 
        #10 $display("Time=%0t READ  : R[%0d] = %h, R[%0d] = %h", $time, ra1, rd1, ra2, rd2);

        ra1 = 0; ra2 = 1; 
        #10 $display("Time=%0t READ  : R[%0d] = %h, R[%0d] = %h", $time, ra1, rd1, ra2, rd2);

        #10 $finish;
    end
endmodule

