`timescale 1ns / 1ps

module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOP,
    output reg [31:0] R,
    output reg Z
    );
    
    always@(*) begin

    case(ALUOP)
    4'd0: R = A + B;
    4'd1: R = A - B;
    4'd2: R = A & B;
    4'd3: R = A | B;
    4'd4: R = A ^ B;
    4'd5: R = A << B[4:0];
    4'd6: R = A >> B[4:0];
    4'd7: R = $signed(A) >>> B[4:0];
    4'd8: R = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
    4'd9: R = (A < B)  ? 32'b1  : 32'b0;
    default: R = 32'b0;
    endcase
    
Z = (R == 32'b0);

end 
endmodule
