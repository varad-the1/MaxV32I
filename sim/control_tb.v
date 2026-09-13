`timescale 1ns / 1ps

module control_tb();

reg [6:0] opcode;
reg [2:0] funct3;
reg [6:0] funct7;
wire [3:0] ALUOP;

control DUT(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .ALUOP(ALUOP)
);

initial begin

    $monitor("time=%0t | funct7=%b | funct3=%b | ALUOP=%d",
             $time, funct7, funct3, ALUOP);

    // ADD
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b000;

    // SUB
    #10;
    funct7 = 7'b0100000;
    funct3 = 3'b000;

    // XOR
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b100;

    // OR
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b110;

    // AND
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b111;

    // SLL
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b001;

    // SRL
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b101;

    // SRA
    #10;
    funct7 = 7'b0100000;
    funct3 = 3'b101;

    // SLT
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b010;

    // SLTU
    #10;
    funct7 = 7'b0000000;
    funct3 = 3'b011;

    // Invalid combination
    #10;
    funct7 = 7'b1111111;
    funct3 = 3'b111;

    #10;
    $finish;

end

endmodule