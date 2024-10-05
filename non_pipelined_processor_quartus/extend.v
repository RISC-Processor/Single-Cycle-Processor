module extend
    //Currently for load word (lw) instruction, this only takes 12 bits,
    // and sign extend it to 32 bits.

    // Later, we have to consider about the different locations where,
    // the immediate values are in different instructions.
    
    #(parameter DATA_BUS_WIDTH = 32)
    (
        input [11:0] imm,
        output [DATA_BUS_WIDTH - 1:0] extended_imm
    );

    assign extended_imm = {{DATA_BUS_WIDTH - 12{imm[11]}}, imm};

endmodule