module shift_register (
    input clk,reset,
    input [7:0] Din,
    output reg [7:0] Dout0,Dout1,Dout2,Dout3);

 always @(posedge clk or posedge reset) 
   begin
        if (reset)
         begin
            Dout0 <= 0;
            Dout1 <= 0;
            Dout2 <= 0;
            Dout3 <= 0;
         end 
        else
          begin
            Dout0 <= Din;
            Dout1 <= Dout0;
            Dout2 <= Dout1;
            Dout3 <= Dout2;
         end
    end

endmodule
    
