module datapath_core(
  input clk,
  input reset,
  input pcsrc,
  input ALUSrc,
  input reg_write,
  input [1:0] ResultSrc,    
  input [1:0] ImmSrc,
  input [3:0] ALUCtrl,
  input [31:0] Instr,
  input [31:0] ReadData,
  output [31:0] ALU_result,
  output [31:0] pc,
  output [31:0] write_data,
  output zero
  );
  
wire [31:0] pc_plus4,pc_target,pc_next;
wire [31:0] ImmExt;
wire [31:0] srcA,srcB;
wire [31:0] ResultOut;

pc_reg uut1(.clk(clk),
           .rst(reset),
           .pc_next(pc_next), 
           .pc(pc));

pc_plus4 uut2(.pc(pc), 
             .pc_plus4(pc_plus4));

/*pc_target uut(.pc(pc), 
              .imm_ext(imm_ext), 
              .pc_target(pc_target));*/

pc_mux uut3(.pcsrc(pcsrc), 
           .pc_plus4(pc_plus4), 
           .pc_target(pc_target), 
           .pc_next(pc_next));

reg_file uut4 (.clk(clk),
              .we2(reg_write),
              .ra1(Instr[19:15]),
              .ra2(Instr[24:20]),
              .wa3(Instr[11:7]),
              .wd3(ResultOut),
              .rd1(srcA),
              .rd2(write_data) );

extender uut5 (.Instr(Instr[31:7]),
              .ImmSrc(ImmSrc),
              .ImmExt(ImmExt));

alu uut6 (.A(srcA), 
         .B(srcB), 
         .ALUCtrl(ALUCtrl), 
         .Result(ALU_Result),
         .Zero(Zero),
         .Negative(Negative),
         .Carry( Carry),
         .Overflow( Overflow));

alu_mux uut7 (.wd(write_data), 
            .ImmExt(ImmExt), 
            .ALUSrc(ALUSrc), 
            .B_out(srcB));

result_mux uut12 (.ResultSrc(ResultSrc),
               .ALU_result(ALU_result),
               .ReadData(ReadData),
               .PC_plus4(PC_plus4),
               .ResultOut(ResultOut)
               );

endmodule
    
    


 
    
    
  
