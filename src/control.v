`timescale 1ns / 1ps

module control(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] ALUOP,
    output reg RegWrite
    );
    
    always@(*) begin
    
    RegWrite = 1'b0;

    if (opcode == 7'b0110011)
        RegWrite = 1'b1;
    
    case({funct7, funct3})
    10'b0000000000: ALUOP = 4'd0;
    
    10'b0100000000: ALUOP = 4'd1;
    
    10'b0000000100: ALUOP = 4'd4;
    
    10'b0000000110: ALUOP = 4'd3;
   
    10'b0000000111: ALUOP = 4'd2;
    
    10'b0000000001: ALUOP = 4'd5;
    
    10'b0000000101: ALUOP = 4'd6;
    
    10'b0100000101: ALUOP = 4'd7;
    
    10'b0000000010: ALUOP = 4'd8;
    
    10'b0000000011: ALUOP = 4'd9;
    
    default: ALUOP = 4'd0;
    endcase
    
    
    
    end
    
    
endmodule
