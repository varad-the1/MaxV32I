`timescale 1ns / 1ps

module alu_tb();
reg [31:0] A;
reg [31:0] B;
reg [3:0] ALUOP;
wire [31:0] R;
wire Z;

alu DUT(
    .A(A),
    .B(B),
    .ALUOP(ALUOP),
    .R(R),
    .Z(Z)
);

initial begin
$monitor("A = %b, B = %b, ALUOP = %b, R = %b, Z = %b", A, B, ALUOP, R, Z);
end

initial begin
#10; A = 32'd3; B = 32'd5; ALUOP = 4'd0;
#10; A = 32'd3; B = 32'd5; ALUOP = 4'd1;
#10; A = 32'd3; B = 32'd5; ALUOP = 4'd2;
#10; A = 32'd3; B = 32'd5; ALUOP = 4'd3;
#10; A = 32'd3; B = 32'd5; ALUOP = 4'd4;
#10; A = 32'd3; B = 32'd2; ALUOP = 4'd5;
#10; A = 32'd3; B = 32'd2; ALUOP = 4'd6;

// SRA: -16 >>> 2 = -4
#10; A = 32'hFFFFFFF0; B = 32'd2; ALUOP = 4'd7;

// SLT: -1 < 1 → 1
#10; A = 32'hFFFFFFFF; B = 32'd1; ALUOP = 4'd8;

// SLTU: 4294967295 < 1 → 0
#10; A = 32'hFFFFFFFF; B = 32'd1; ALUOP = 4'd9;

// Zero flag: 5 - 5 = 0 → Z = 1
#10; A = 32'd5; B = 32'd5; ALUOP = 4'd1;

#10; $finish;
$finish;
end

endmodule
