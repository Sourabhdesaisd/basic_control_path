
module top(
    input clk, reset, start,
    input [7:0] data_in,
    output [15:0] product,
    output done
);
    wire ldA, ldB, ldP, clrP, decB, add, zero;

    datapath DP(
        .clk(clk), .reset(reset),
        .ldA(ldA), .ldB(ldB), .ldP(ldP), .clrP(clrP), .decB(decB), .add(add),
        .data_in(data_in), .zero(zero), .product(product)
    );

    controller CU(
        .clk(clk), .reset(reset), .start(start), .zero(zero),
        .ldA(ldA), .ldB(ldB), .ldP(ldP), .clrP(clrP),
        .decB(decB), .add(add), .done(done)
    );
endmodule

