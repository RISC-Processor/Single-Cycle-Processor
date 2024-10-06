module processor
    #(  
        parameter BUS_WIDTH = 32
    )
    (input wire clk);
    
    localparam DATA_MEMORY_ADDR_BUS_WIDTH = 32;
    localparam DATA_MEMORY_DATA_BUS_WIDTH = 32;
    localparam REG_FILE_ADDR_BUS_WIDTH = 5;
    localparam REG_FILE_DATA_BUS_WIDTH = 32;
    localparam INST_MEMORY_ADDR_BUS_WIDTH = 16;
    localparam INST_MEMORY_DATA_BUS_WIDTH = 32;
     
    // Wires for module instantiation, and connections
    wire [INST_MEMORY_ADDR_BUS_WIDTH - 1:0] pc_out;
    wire [INST_MEMORY_ADDR_BUS_WIDTH - 1:0] pc_4;
    wire [INST_MEMORY_DATA_BUS_WIDTH - 1:0] instr;
    wire [REG_FILE_DATA_BUS_WIDTH - 1:0] imm_ext;
    wire [DATA_MEMORY_ADDR_BUS_WIDTH - 1:0] alu_result;
    wire [DATA_MEMORY_DATA_BUS_WIDTH - 1:0] read_data;
    wire [REG_FILE_DATA_BUS_WIDTH - 1:0] src_a;
    wire [REG_FILE_DATA_BUS_WIDTH - 1:0] src_b;

    // Instantiate program counter
    pc # (INST_MEMORY_ADDR_BUS_WIDTH) pc_inst (
        .clk(clk),
        .pc_next(pc_4),
        .pc(pc_out)
    );

    // Instantiate adder
    adder # (INST_MEMORY_ADDR_BUS_WIDTH) adder_inst1 (
        .a(pc_out),
        .b({{12{1'b0}}, 4'b0100}),
        .y(pc_4)
    );
    
    // Insntiate data_memory module
    data_memory #(DATA_MEMORY_ADDR_BUS_WIDTH, DATA_MEMORY_DATA_BUS_WIDTH) data_memory_inst (
        .clk(clk),
        .addr(alu_result),
        .write_data({32{1'b0}}),
        .write_en(1'b0),
        .read_data(read_data)
    );

    // Insntiate register_file module
    register_file #(REG_FILE_ADDR_BUS_WIDTH, REG_FILE_DATA_BUS_WIDTH) register_file_inst (
        .clk(clk),
        .addr1(instr[19:15]),
        .addr2({5{1'b0}}),
        .addr3(instr[11:7]),
        .write_data(read_data),
        .write_en(1'b1),
        .read_data1(src_a),
        .read_data2(src_b)
    );

    // Insntiate extend module
    extend #(BUS_WIDTH) extend_inst (
        .imm(instr[31:20]),
        .extended_imm(imm_ext)
    );

    // Insntiate alu module
    alu #(BUS_WIDTH) alu_inst (
        .src_a(src_a),
        .src_b(imm_ext),
        .alu_op({3{1'b0}}),
        .alu_result(alu_result)
    );
    
    // Instantiate instruction memory module
    imem # (INST_MEMORY_ADDR_BUS_WIDTH, INST_MEMORY_DATA_BUS_WIDTH) imem_inst (
        .a(pc_out),
        .rd(instr)
    );
endmodule