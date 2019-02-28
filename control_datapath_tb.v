module tb_multiplier;
    reg clk, reset, start;
    reg [7:0] data_in;
    wire [15:0] product;
    wire done;

  top uut (.clk(clk),.reset(reset),.start(start),.data_in(data_in), 
            .product(product), .done(done));

 initial clk = 0;
 always #5 clk = ~clk;
 
initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

 initial begin
        reset = 1; start = 0; data_in = 0;
        #10 reset = 0;

        start = 1; data_in = 8'd5; 
        #10 $display("Time=%0t Load A=%0d | product=%0d | done=%b",$time, data_in, product, done);

        start = 0; data_in = 8'd3; 
        #10 $display("Time=%0t Load A=%0d | product=%0d | done=%b",$time, data_in, product, done);
        

        #50;
        $display("Result: 5 * 3 = %0d | done=%b", product, done);

        reset = 1; #10; reset = 0;

        start = 1; data_in = 8'd7; 
        #10 $display("Time=%0t Load A=%0d | product=%0d | done=%b",$time, data_in, product, done);
        
        start = 0; data_in = 8'd4; 
        #10 $display("Time=%0t Load A=%0d | product=%0d | done=%b",$time, data_in, product, done);
        

        #50;
        $display("Result: 7 * 4 = %0d | done=%b", product, done);

        reset = 1; #10; reset = 0;

        start = 1; data_in = 8'd9;
        #10 $display("Time=%0t Load A=%0d | product=%0d | done=%b",$time, data_in, product, done);
        
        start = 0; data_in = 8'd6; #10;
        #10 $display("Time=%0t Load A=%0d | product=%0d | done=%b",$time, data_in, product, done);
        
        #60;
        $display("Result: 9 * 6 = %0d | done=%b", product, done);

        $finish;
    end
endmodule

