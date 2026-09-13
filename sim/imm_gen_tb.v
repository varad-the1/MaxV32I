`timescale 1ns / 1ps

module imm_gen_tb();

reg [31:0] instruction;
reg [6:0] opcode;
wire [31:0] IMM;

imm_gen DUT(
    .instruction(instruction),
    .opcode(opcode),
    .IMM(IMM)
);

initial begin
    $monitor("time=%0t | opcode=%b | instruction=%h | IMM=%h (%d)",
             $time, opcode, instruction, IMM, $signed(IMM));

    // I-type: +5
    #10;
    opcode = 7'b0010011;
    instruction = 32'b00000000010100000000000000010011;

    // I-type: -5
    #10;
    opcode = 7'b0010011;
    instruction = 32'b11111111101100000000000000010011;

    // S-type: +20
    #10;
    opcode = 7'b0100011;
    instruction = 32'b00000000101000000000101000100011;

    // S-type: -4
    #10;
    opcode = 7'b0100011;
    instruction = 32'b11111110101000000000111000100011;

    // B-type: +16
    #10;
    opcode = 7'b1100011;
    instruction = 32'b00000000001000001000000001100011;

    // B-type: -16
    #10;
    opcode = 7'b1100011;
    instruction = 32'b11111110001000001000100001100011;

    // U-type
    #10;
    opcode = 7'b0110111;
    instruction = 32'h12345037;

    // AUIPC U-type
    #10;
    opcode = 7'b0010111;
    instruction = 32'hABCDE017;

    // J-type: positive
    #10;
    opcode = 7'b1101111;
    instruction = 32'h008000EF;

    // J-type: negative
    #10;
    opcode = 7'b1101111;
    instruction = 32'hFF1FF0EF;

    // Invalid opcode
    #10;
    opcode = 7'b1111111;
    instruction = 32'hFFFFFFFF;

    #10;
    $finish;
end

endmodule