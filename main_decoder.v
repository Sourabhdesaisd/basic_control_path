module main_decoder(
    input [6:0] op,
    output reg        RegWrite,ALUSrc,MemWrite,Branch,Jump,
    output reg [1:0]  ImmSrc,ResultSrc,ALUop                
    );

always @(*) begin       
      case (op)

            7'b0000000: begin 
                RegWrite  = 0;
                ImmSrc    = 2'b00;
                ALUSrc    = 0;
                MemWrite  = 0;
                ResultSrc = 2'b00;
                Branch    = 0;
                ALUop     = 2'b00;
                Jump      = 0;
            end

            7'b0000011: begin 
                RegWrite  = 1;
                ImmSrc    = 2'b00;
                ALUSrc    = 1;
                ResultSrc = 2'b01;
            end

            7'b0100011: begin 
                ImmSrc    = 2'b01;
                ALUSrc    = 1;
                MemWrite  = 1;
            end

            7'b0110011: begin 
                RegWrite  = 1;
                ALUSrc    = 0;
                ALUop     = 2'b10;
            end

            7'b0010011: begin 
                RegWrite  = 1;
                ALUSrc    = 1;
                ALUop     = 2'b10;
            end

            7'b1100011: begin 
                ImmSrc    = 2'b10;
                Branch    = 1;
                ALUop     = 2'b01;
            end

            7'b1101111: begin 
                RegWrite  = 1;
                ImmSrc    = 2'b11;
                ResultSrc = 2'b10;
                Jump      = 1;
            end

            7'b1100111: begin 
                RegWrite  = 1;
                ALUSrc    = 1;
                ResultSrc = 2'b10;
                Jump      = 1;
            end

            7'b0110111: begin 
                RegWrite  = 1;
                ALUSrc    = 1;
                ALUop     = 2'b11;
            end

            7'b0010111: begin 
                RegWrite  = 1;
                ALUSrc    = 1;
                ALUop     = 2'b01;
            end
            
            default: begin
              RegWrite  = 0;
              ImmSrc    = 2'b00;
              ALUSrc    = 0;
              MemWrite  = 0;
              ResultSrc = 2'b00;
              Branch    = 0;
              ALUop     = 2'b00;
              Jump      = 0;
            end
        endcase
    end
endmodule

