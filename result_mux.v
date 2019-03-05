module result_mux(
    input [1:0]  ResultSrc,
    input [31:0] ALU_result,ReadData,PC_plus4,   
    output reg [31:0] ResultOut
);
    always @(*)
    begin
        case (ResultSrc)
            2'b00: ResultOut = ALU_result;
            2'b01: ResultOut = ReadData;
            2'b10: ResultOut = PC_plus4;
            2'b11: ResultOut = PC_plus4;
            default: ResultOut = 32'b0;
        endcase
    end
endmodule

