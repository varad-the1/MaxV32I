`timescale 1ns / 1ps

module regfile(
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] WD,
    input RegWrite,
    input clk,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    reg [31:0] rg [0:31];
    
assign RD1 = (rs1 == 5'b0) ? 32'b0 : rg[rs1];
assign RD2 = (rs2 == 5'b0) ? 32'b0 : rg[rs2];

always @(posedge clk) begin
    if (RegWrite && rd != 5'b0) rg[rd] <= WD;
end
    
    
endmodule
