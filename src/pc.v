`timescale 1ns / 1ps

module pc(
    input clk,
    input reset,
    input [31:0] PC_next,
    output reg [31:0] pc
);

always @(posedge clk) begin
    if (reset)
        pc <= 32'b0;
    else
        pc <= PC_next;
end

endmodule