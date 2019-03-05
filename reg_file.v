module reg_file (
    input  clk,we2,
    input  [4:0] ra1,ra2,wa3,         
    input  [31:0] wd3,       
    output [31:0] rd1,rd2 
           );
    
reg [31:0] regs [0:31];    

 /*   initial begin
        regs[0]  = 32'h00000000; regs[1]  = 32'h00000000;
        regs[2]  = 32'h00000000; regs[3]  = 32'h00000000;
        regs[4]  = 32'h00000000; regs[5]  = 32'h00000000;
        regs[6]  = 32'h00000000; regs[7]  = 32'h00000000;
        regs[8]  = 32'h00000000; regs[9]  = 32'h00000000;
        regs[10] = 32'h00000000; regs[11] = 32'h00000000;
        regs[12] = 32'h00000000; regs[13] = 32'h00000000;
        regs[14] = 32'h00000000; regs[15] = 32'h00000000;
        regs[16] = 32'h00000000; regs[17] = 32'h00000000;
        regs[18] = 32'h00000000; regs[19] = 32'h00000000;
        regs[20] = 32'h00000000; regs[21] = 32'h00000000;
        regs[22] = 32'h00000000; regs[23] = 32'h00000000;
        regs[24] = 32'h00000000; regs[25] = 32'h00000000;
        regs[26] = 32'h00000000; regs[27] = 32'h00000000;
        regs[28] = 32'h00000000; regs[29] = 32'h00000000;
        regs[30] = 32'h00000000; regs[31] = 32'h00000000;
    end*/

    always @(posedge clk) 
     begin
        if (we2 && wa3 != 0)   
            regs[wa3] <= wd3;
    end

    assign rd1 = (ra1 == 0) ? 32'h00000000 : regs[ra1];
    assign rd2 = (ra2 == 0) ? 32'h00000000 : regs[ra2];
endmodule

