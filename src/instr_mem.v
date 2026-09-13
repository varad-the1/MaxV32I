`timescale 1ns / 1ps

module instr_mem(
    input [31:0] address,
    output wire [31:0] instruction
    );
    
    reg [31:0] mem [0:255]; 
    assign instruction = mem[address >> 2];
    
endmodule
