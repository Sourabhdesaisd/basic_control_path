module controller(
    input clk, reset, start, zero,
    output reg ldA, ldB, ldP, clrP, decB, add, done
);
    reg [2:0] state, next;

    parameter S0=0, 
              S1=1, 
              S2=2, 
              S3=3, 
              S4=4;

   always @(posedge clk or posedge reset)
        begin
             if (reset) 
                 state <= S0;
             else 
                 state <= next;
         end
         
    always @(*) begin
        ldA=0; ldB=0; ldP=0; clrP=0; decB=0; add=0; done=0;
        case(state)
            S0: if(start) next = S1; 
                else next = S0;
            S1: begin ldA=1; next=S2; end
            S2: begin ldB=1; clrP=1; next=S3; end
            S3: if(zero) next=S4; 
                else begin add=1; decB=1; next=S3; end
            S4: begin done=1; next=S4; end
        endcase
    end
endmodule
