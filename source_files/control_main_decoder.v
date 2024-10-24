module control_main_decoder
    (
        input [6:0] opcode,
        output reg branch,
        output reg [1:0] result_src,
        output reg mem_write,
        output reg alu_src,
        output reg [1:0] imm_src,
        output reg reg_write,
        output reg [1:0] alu_op,
        output reg jump
    );

    always @(opcode)
    begin
        case(opcode)
            7'd3: begin //lw
                branch = 1'b0;
                result_src = 2'b01;
                mem_write = 1'b0;
                alu_src = 1'b1;
                imm_src = 2'b00;
                reg_write = 1'b1;
                alu_op = 2'b00;
                jump = 1'b0;
            end
            7'd35: begin    // sw
                branch = 1'b0;
                result_src = 2'bxx;
                mem_write = 1'b1;
                alu_src = 1'b1;
                imm_src = 2'b01;
                reg_write = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
            7'd51: begin    // R-type
                branch = 1'b0;
                result_src = 2'b00;
                mem_write = 1'b0;
                alu_src = 1'b0;
                imm_src = 2'bxx;
                reg_write = 1'b1;
                alu_op = 2'b10;
                jump = 1'b0;
            end
            7'd99: begin    // beq
                branch = 1'b1;
                result_src = 2'bxx;
                mem_write = 1'b0;
                alu_src = 1'b0;
                imm_src = 2'b10;
                reg_write = 1'b0;
                alu_op = 2'b01;
                jump = 1'b0;
            end
            7'd19: begin    // addi
                branch = 1'b0;
                result_src = 2'b00;
                mem_write = 1'b0;
                alu_src = 1'b1;
                imm_src = 2'b00;
                reg_write = 1'b1;
                alu_op = 2'b10;
                jump = 1'b0;
            end
            7'd111: begin    // jal
                branch = 1'b0;
                result_src = 2'b10;
                mem_write = 1'b0;
                alu_src = 1'bx;
                imm_src = 2'b11;
                reg_write = 1'b1;
                alu_op = 2'bxx;
                jump = 1'b1;
            end
            default: begin
                branch = 1'bx;
                result_src = 2'bxx;
                mem_write = 1'bx;
                alu_src = 1'bx;
                imm_src = 2'bxx;
                reg_write = 1'bx;
                alu_op = 2'bxx;
                jump = 1'b0;
            end
        endcase
    end
endmodule