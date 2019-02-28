module tb_data_mem;
    reg [31:0] addr, wd;
    reg we, clk;
    wire [31:0] rd;

    data_mem uut (.addr(addr),.wd(wd),.we(we),.clk(clk),.rd(rd) );

  always #5 clk = ~clk;

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin
        clk = 0; we = 0; wd= 0; addr = 0;
        $display("Time   Addr     WE      WD       rd");

        addr = 32'h0; 
        #10 $display("%0t   %h   %b    %h   %h", $time, addr, we, wd, rd);

        clk = 1; 
        we = 1; 
        addr = 32'h0; wd= 32'hAAAABBBB;        
        #10 $display("%0t   %h   %b    %h  ", $time, addr, we, wd);
        
        addr = 32'h1; wd= 32'h12345678; 
        #10 $display("%0t   %h   %b    %h  ", $time, addr, we, wd);
        
        addr = 32'h2; wd= 32'h00001133;
        #10 $display("%0t   %h   %b    %h  ", $time, addr, we, wd);
        
        addr = 32'h3; wd= 32'h11223344;    
        #10 $display("%0t   %h   %b    %h  ", $time, addr, we, wd);
        
        addr = 32'h4; wd= 32'h55667788; 
        #10 $display("%0t   %h   %b    %h  ", $time, addr, we, wd);
        
        we = 0; wd= 0; addr = 0; 
        
        
        addr = 32'h0; 
        #10 $display("%0t   %h   %b    %h   %h", $time, addr, we, wd, rd);

        
         addr = 32'h1; 
         #10 $display("%0t   %h   %b    %h   %h", $time, addr, we, wd, rd);
         
         addr = 32'h2; 
         #10 $display("%0t   %h   %b    %h   %h", $time, addr, we, wd, rd);
         
         addr = 32'h3;
         #10 $display("%0t   %h   %b    %h   %h", $time, addr, we, wd, rd);  

         addr = 32'h4;  
         #10 $display("%0t   %h   %b    %h   %h", $time, addr, we, wd, rd);

        $finish;
    end
endmodule

