module tb_instr_mem;
    reg [31:0] addr;
    wire [31:0] data;

    instr_mem uut (.addr(addr),.data(data));

initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end


initial begin
        $display("Time Addr  Data");
               
        addr = 32'h00000000;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000001;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000002;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000003;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000004;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000005;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000006;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000007;  
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000018; 
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000111;
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h000000101; 
        #10 $display("%0t   %0d     %h", $time, addr, data);
        addr = 32'h00000024; 
        #10 $display("%0t   %0d     %h", $time, addr, data);

        #10 $finish;
    end
endmodule

