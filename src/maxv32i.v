`timescale 1ns / 1ps

module maxv32i(
    input clk,
    input reset
    );
    
    wire [31:0] address;
    wire [31:0] PC_next;
    assign PC_next = address + 32'd4;
    wire [31:0] inst;
    wire [6:0] opcode; assign opcode = inst[6:0];
    wire [2:0] funct3; assign funct3 = inst[14:12];
    wire [6:0] funct7; assign funct7 = inst[31:25];
    wire [4:0] rs1; assign rs1 = inst[19:15];
    wire [4:0] rs2; assign rs2 = inst[24:20];
    wire [4:0] rd; assign rd = inst[11:7];
    wire RegWrite;
    wire [3:0] ALUOP;
    wire [31:0] WD;
    wire [31:0] RD1;
    wire [31:0] RD2;
    
    pc pc_dut (.clk(clk), .reset(reset), .PC_next(PC_next), .pc(address));
    
    instr_mem im_dut (.address(address), .instruction(inst));
    
    regfile rg_dut (.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd), .RegWrite(RegWrite), .RD1(RD1), .RD2(RD2), .WD(WD));
    
    alu alu_dut (.ALUOP(ALUOP), .A(RD1), .B(RD2), .R(WD));
    
    control d_dut (.opcode(opcode), .funct3(funct3), .funct7(funct7), .ALUOP(ALUOP), .RegWrite(RegWrite));
    
    
endmodule
