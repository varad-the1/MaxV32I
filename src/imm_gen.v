`timescale 1ns / 1ps

module imm_gen(
    input [31:0] instruction,
    input [6:0] opcode,
    output reg [31:0] IMM
    );
    
    always@(*) begin
    case(opcode)
    7'b0010011: IMM = {{20{instruction[31]}}, instruction[31:20]};
    7'b0000011: IMM = {{20{instruction[31]}}, instruction[31:20]};
    7'b0100011: IMM = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
    7'b1100011: IMM = {{19{instruction[31]}},instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0};
    7'b0110111: IMM = {{12{instruction[31]}}, instruction[31:12]};
    7'b0010111: IMM = {{12{instruction[31]}}, instruction[31:12]};
    7'b1101111: IMM = {{11{instruction[31]}},instruction[31],instruction[19:12],instruction[20],instruction[30:21],1'b0};  
    default: IMM = 32'b0; 
    endcase
    end
    
    
endmodule
