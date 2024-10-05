module alu
    #(
        parameter BUS_WIDTH = 32
    )
    (
        input [BUS_WIDTH - 1:0] src_a,
        input [BUS_WIDTH - 1:0] src_b,
        input [2:0] alu_op,
        output [BUS_WIDTH - 1:0] alu_result
    );

    assign alu_result = src_a + src_b;
//    always @(*)
//    begin
//        case(alu_op)
//            3'b000: alu_result = src_a + src_b;
//            3'b001: alu_result = src_a - src_b;
//            3'b010: alu_result = src_a & src_b;
//            3'b011: alu_result = src_a | src_b;
//            3'b100: alu_result = src_a ^ src_b;
//            3'b101: alu_result = src_a << src_b;
//            3'b110: alu_result = src_a >> src_b;
//            3'b111: alu_result = src_a >>> src_b;
//            default: alu_result = 0;
//        endcase
//    end
endmodule