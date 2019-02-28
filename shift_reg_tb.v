module tb_shift_register;
    reg clk, reset;
    reg [7:0] Din;
    wire [7:0] Dout0, Dout1, Dout2, Dout3;

 shift_register uut (.clk(clk),.reset(reset),.Din(Din),.Dout0(Dout0),.Dout1(Dout1),.Dout2(Dout2),.Dout3(Dout3) );

  initial clk = 0;
  always #5 clk = ~clk;
  
initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

 initial begin
        
   reset = 1; Din = 0;
   #10 reset = 0;
   
   Din = 8'h11;    
   #10 $display("Time=%0t Din=%h Dout0=%h Dout1=%h Dout2=%h Dout3=%h", $time, Din, Dout0, Dout1, Dout2, Dout3);
   
   Din = 8'h12; 
   #10 $display("Time=%0t Din=%h Dout0=%h Dout1=%h Dout2=%h Dout3=%h", $time, Din, Dout0, Dout1, Dout2, Dout3);
   
   Din = 8'h13; 
   #10 $display("Time=%0t Din=%h Dout0=%h Dout1=%h Dout2=%h Dout3=%h", $time, Din, Dout0, Dout1, Dout2, Dout3);
   
   Din = 8'h14; 
   #10 $display("Time=%0t Din=%h Dout0=%h Dout1=%h Dout2=%h Dout3=%h", $time, Din, Dout0, Dout1, Dout2, Dout3);
   
   Din = 8'h15; 
   #10 $display("Time=%0t Din=%h Dout0=%h Dout1=%h Dout2=%h Dout3=%h", $time, Din, Dout0, Dout1, Dout2, Dout3);
   
   #10 $finish;
    end
endmodule

