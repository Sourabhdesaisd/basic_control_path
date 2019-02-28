module alu_mux(
    input  wire [31:0] wd,    
    input  wire [31:0] ImmExt,   
    input  wire        ALUSrc,   
    output wire [31:0] B_out     
  );
    assign B_out = ALUSrc ? ImmExt : wd;
endmodule


