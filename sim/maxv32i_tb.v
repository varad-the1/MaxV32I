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

    // R-TYPE INSTRUCTIONS
  

    // add x3, x1, x2
    DUT.im_dut.mem[0] = 32'b0000000_00010_00001_000_00011_0110011;

    // sub x6, x3, x1
    DUT.im_dut.mem[1] = 32'b0100000_00001_00011_000_00110_0110011;

    // and x7, x3, x1
    DUT.im_dut.mem[2] = 32'b0000000_00001_00011_111_00111_0110011;


    // I-TYPE INSTRUCTIONS
    // addi x8, x1, 5
    DUT.im_dut.mem[3] = 32'b000000000101_00001_000_01000_0010011;

    // andi x9, x8, 15
    DUT.im_dut.mem[4] = 32'b000000001111_01000_111_01001_0010011;

    // ori x10, x8, 4
    DUT.im_dut.mem[5] = 32'b000000000100_01000_110_01010_0010011;

    // xori x11, x8, 7
    DUT.im_dut.mem[6] = 32'b000000000111_01000_100_01011_0010011;

    // slti x12, x1, 20
    DUT.im_dut.mem[7] = 32'b000000010100_00001_010_01100_0010011;

    // sltiu x13, x1, 20
    DUT.im_dut.mem[8] = 32'b000000010100_00001_011_01101_0010011;

    // slli x14, x1, 2
    DUT.im_dut.mem[9] = 32'b0000000_00010_00001_001_01110_0010011;

    // srli x15, x2, 2
    DUT.im_dut.mem[10] = 32'b0000000_00010_00010_101_01111_0010011;

    // srai x16, x2, 2
    DUT.im_dut.mem[11] = 32'b0100000_00010_00010_101_10000_0010011;



    // INITIAL REGISTER VALUES
    #10;
    reset = 0;

    DUT.rg_dut.rg[1] = 32'd10;
    DUT.rg_dut.rg[2] = 32'd20;

    // RUN


    #120;


    $display("========================================");
    $display("           MaxV32I Results");
    $display("========================================");

    $display("x1  = %d", DUT.rg_dut.rg[1]);
    $display("x2  = %d", DUT.rg_dut.rg[2]);
    $display("x3  = %d", DUT.rg_dut.rg[3]);
    $display("x6  = %d", DUT.rg_dut.rg[6]);
    $display("x7  = %d", DUT.rg_dut.rg[7]);

    $display("x8  = %d", DUT.rg_dut.rg[8]);
    $display("x9  = %d", DUT.rg_dut.rg[9]);
    $display("x10 = %d", DUT.rg_dut.rg[10]);
    $display("x11 = %d", DUT.rg_dut.rg[11]);
    $display("x12 = %d", DUT.rg_dut.rg[12]);
    $display("x13 = %d", DUT.rg_dut.rg[13]);
    $display("x14 = %d", DUT.rg_dut.rg[14]);
    $display("x15 = %d", DUT.rg_dut.rg[15]);
    $display("x16 = %d", DUT.rg_dut.rg[16]);

    $display("========================================");

    $finish;

end

initial begin
    $monitor(
        "Time=%0t | PC=%h | Instruction=%h | ALUOP=%d | IRMUX=%b | RD1=%d | ALU_B=%d | WD=%d",
        $time,
        DUT.address,
        DUT.inst,
        DUT.ALUOP,
        DUT.IRMUX,
        DUT.RD1,
        DUT.ALU_B,
        DUT.WD
    );
end

endmodule