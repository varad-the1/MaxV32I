`timescale 1ns / 1ps

module maxv32i_tb();

reg clk;
reg reset;

maxv32i DUT (
    .clk(clk),
    .reset(reset)
);


always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;

    
    
    DUT.im_dut.mem[0] = 32'b0000000_00010_00001_000_00011_0110011;

    
    DUT.im_dut.mem[1] = 32'b0100000_00001_00011_000_00110_0110011;

    
    DUT.im_dut.mem[2] = 32'b0000000_00001_00011_111_00111_0110011;

    
    #10;
    reset = 0;

    
    DUT.rg_dut.rg[1] = 32'd10;
    DUT.rg_dut.rg[2] = 32'd20;

    #40;

    $display("x1 = %d", DUT.rg_dut.rg[1]);
    $display("x2 = %d", DUT.rg_dut.rg[2]);
    $display("x3 = %d", DUT.rg_dut.rg[3]);
    $display("x6 = %d", DUT.rg_dut.rg[6]);
    $display("x7 = %d", DUT.rg_dut.rg[7]);

    $finish;
end

initial begin
    $monitor("Time=%0t | PC=%h | Instruction=%h | ALUOP=%d | RD1=%d | RD2=%d | WD=%d",
             $time,
             DUT.address,
             DUT.inst,
             DUT.ALUOP,
             DUT.RD1,
             DUT.RD2,
             DUT.WD);
end

endmodule