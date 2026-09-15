`timescale 1ns / 1ps

module control(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] ALUOP,
    output reg IRMUX,
    output reg RegWrite
);

    always @(*) begin

        RegWrite = 1'b0;
        IRMUX    = 1'b0;
        ALUOP    = 4'd0;

        case(opcode)

            // R-type
            7'b011_0011: begin
                RegWrite = 1'b1;

                case({funct7, funct3})
                    10'b0000000_000: ALUOP = 4'd0;
                    10'b0100000_000: ALUOP = 4'd1;
                    10'b0000000_100: ALUOP = 4'd4;
                    10'b0000000_110: ALUOP = 4'd3;
                    10'b0000000_111: ALUOP = 4'd2;
                    10'b0000000_001: ALUOP = 4'd5;
                    10'b0000000_101: ALUOP = 4'd6;
                    10'b0100000_101: ALUOP = 4'd7;
                    10'b0000000_010: ALUOP = 4'd8;
                    10'b0000000_011: ALUOP = 4'd9;
                    default: ALUOP = 4'd0;
                endcase
            end

            // I-type 
            7'b001_0011: begin
                RegWrite = 1'b1;
                IRMUX    = 1'b1;

                case(funct3)
                    3'b000: ALUOP = 4'd0; // ADDI
                    3'b010: ALUOP = 4'd8; // SLTI
                    3'b011: ALUOP = 4'd9; // SLTIU
                    3'b100: ALUOP = 4'd4; // XORI
                    3'b110: ALUOP = 4'd3; // ORI
                    3'b111: ALUOP = 4'd2; // ANDI

                    3'b001: ALUOP = 4'd5; // SLLI

                    3'b101: begin
                        if (funct7[5] == 1'b0)
                            ALUOP = 4'd6; // SRLI
                        else
                            ALUOP = 4'd7; // SRAI
                    end

                    default: ALUOP = 4'd0;
                endcase
            end

            // LOAD
            7'b000_0011: begin

            end

            // STORE
            7'b010_0011: begin

            end

            // BRANCH
            7'b110_0011: begin

            end

            // JAL
            7'b110_1111: begin

            end

            // JALR
            7'b110_0111: begin

            end

            // LUI
            7'b011_0111: begin

            end

            // AUIPC
            7'b001_0111: begin

            end

            default: begin

            end

        endcase

    end

endmodule