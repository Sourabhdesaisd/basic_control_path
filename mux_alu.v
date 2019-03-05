module alu_mux(
    input [31:0] wd,    
    input [31:0] ImmExt,   
    input        ALUSrc,   
    output [31:0] B_out     
  );
    assign B_out = ALUSrc ? ImmExt : wd;
endmodule


