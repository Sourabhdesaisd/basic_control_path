module tb_result_mux;
    reg  [1:0]  ResultSrc;
    reg  [31:0] ALU_result, ReadData, PC_plus4, ImmExt;
    wire [31:0] ResultOut;

    result_mux uut(
        .ResultSrc(ResultSrc),
        .ALU_result(ALU_result),
        .ReadData(ReadData),
        .PC_plus4(PC_plus4),
        .ImmExt(ImmExt),
        .ResultOut(ResultOut)
    );
    
initial begin
  $shm_open("wave.shm");
  $shm_probe("ACTMF");
end

initial begin

        
        $display("ResultSrc | ALU_result | ReadData  | PC+4      | ImmExt     | ResultOut(hex) | ResultOut(bin)");

        ALU_result = 32'h0000000A; 
        ReadData = 32'hDEADBEEF; 
        PC_plus4 = 32'h00000004; 
        ImmExt = 32'h12345000;
        ResultSrc = 2'b00; 
        #10 $display(" %b  | %08h     | %08h  | %08h  | %08h  | %08h        | %032b", ResultSrc, ALU_result, ReadData,PC_plus4,   ImmExt, ResultOut, ResultOut); 

        ResultSrc = 2'b01; 
        #10 $display(" %b  | %08h     | %08h  | %08h  | %08h  | %08h        | %032b", ResultSrc, ALU_result, ReadData, PC_plus4, ImmExt, ResultOut, ResultOut);

        ResultSrc = 2'b10; 
        #10 $display(" %b  | %08h     | %08h  | %08h  | %08h  | %08h        | %032b", ResultSrc, ALU_result, ReadData, PC_plus4, ImmExt, ResultOut, ResultOut);

        ResultSrc = 2'b11; 
        #10 $display(" %b  | %08h     | %08h  | %08h  | %08h  | %08h        | %032b", ResultSrc, ALU_result, ReadData, PC_plus4, ImmExt, ResultOut, ResultOut);
        
        #10 $finish;
    end
endmodule

