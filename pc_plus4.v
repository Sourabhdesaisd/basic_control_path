module pc_plus4(
    input [31:0] pc,
    output [31:0] pc_plus4
);
    assign pc_plus4 = pc + 32'd4;
endmodule  


