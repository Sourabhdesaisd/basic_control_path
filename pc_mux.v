module pc_mux(
    input pcsrc,
    input [31:0] pc_plus4,
    input [31:0] pc_target,
    output[31:0] pc_next
);
    assign pc_next = pcsrc ? pc_target : pc_plus4;
endmodule   


