module control_alu_decoder
    (
        input [6:0] opcode,
        input [6:0] funct7,
        input [2:0] funct3,
        input [1:0] alu_op,
        output reg [2:0] alu_control
    );

    always @(opcode, funct7, funct3, alu_op)
    begin
        alu_control = 3'b000;
    end
endmodule