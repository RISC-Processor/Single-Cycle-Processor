module extend
    //Currently for load word (lw) instruction, this only takes 12 bits,
    // and sign extend it to 32 bits.

    // Later, we have to consider about the different locations where,
    // the immediate values are in different instructions.
    
    #(parameter DATA_BUS_WIDTH = 32)
    (
        input [1:0] imm_src,
        input [DATA_BUS_WIDTH - 1:0] instr,
        output reg [DATA_BUS_WIDTH - 1:0] extended_imm
    );

    always @(imm_src, instr)
    begin
        case (imm_src)
            2'b00 : extended_imm = {{20{instr[31]}}, instr[31:20]};
            2'b01 : extended_imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
            2'b10 : extended_imm = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
            default : extended_imm = 32'b0;
        endcase
    end

endmodule