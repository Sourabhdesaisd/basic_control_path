module pc_reg(
    input  wire        clk,       
    input  wire [31:0] pc_next,   
    output reg  [31:0] pc         
);
    always @(posedge clk)
    begin
        pc <= pc_next;
    end
endmodule

