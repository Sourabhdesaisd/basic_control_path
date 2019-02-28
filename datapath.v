module datapath(
    input clk, reset, ldA, ldB, ldP, clrP, decB, add,
    input [7:0] data_in,
    output zero,
    output [15:0] product
);
    reg [7:0] A, B;
    reg [15:0] P;

  always @(posedge clk or posedge reset)
     begin
        if (reset) 
          begin
            A <= 0; B <= 0; P <= 0;
          end 
         else 
           begin
            if (ldA) A <= data_in;
            if (ldB) B <= data_in;
            if (clrP) P <= 0;
            if (add)  P <= P + A;
            if (decB) B <= B - 1;
         end
     end

    assign zero = (B == 0);
    assign product = P;
endmodule

