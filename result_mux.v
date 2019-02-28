module result_mux(
    input  wire [1:0]  ResultSrc,
    input  wire [31:0] ALU_result,
    input  wire [31:0] ReadData,
    input  wire [31:0] PC_plus4,
    input  wire [31:0] ImmExt,
    output reg  [31:0] ResultOut
);
    always @(*) begin
        case (ResultSrc)
            2'b00: ResultOut = ALU_result;
            2'b01: ResultOut = ReadData;
            2'b10: ResultOut = PC_plus4;
            2'b11: ResultOut = ImmExt;
            default: ResultOut = 32'b0;
        endcase
    end
endmodule

