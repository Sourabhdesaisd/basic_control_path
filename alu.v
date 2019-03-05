module alu(
    input  [31:0] A, B,
    input  [3:0] ALUCtrl,
    output reg [31:0] Result,
    output Zero , Negative, Carry, Overflow
); 

    always @(*) begin
        case(ALUCtrl)
            4'b0000: Result = A + B;      
            4'b0001: Result = A - B;      
            4'b0010: Result = A & B;      
            4'b0011: Result = A | B;      
            4'b0100: Result = A ^ B;      
            4'b0101: Result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; // SLT
            4'b0110: Result = (A < B) ? 32'd1 : 32'd0;                   // SLTU
            4'b0111: Result = {A[31:12], 12'b0}; 
            4'b1000: Result = A + {B[31:12], 12'b0};
            4'b1001: Result = {B[31:12], 12'b0}; 
            4'b1010: Result = A << B[4:0];       
            4'b1011: Result = $signed(A) >>> B[4:0]; 
            4'b1100: Result = A >> B[4:0];             
            default: Result = 32'b0;
        endcase
    end

    assign Zero = (Result == 0);
    assign Negative = Result[31];
    assign Carry = 0;    
    assign Overflow = 0;  
endmodule

