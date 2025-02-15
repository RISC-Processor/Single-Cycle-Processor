`timescale 1ns / 1ps

module imem
    #(  
      parameter ADDR_BUS_WIDTH = 16,
      parameter DATA_BUS_WIDTH = 32
    )
    (
        input [ADDR_BUS_WIDTH - 1:0] a,
        output  [DATA_BUS_WIDTH - 1:0] rd,
//		  output [7: 0] LEDR,
		  input enable, 
		  input [7: 0] instIn
		  
    );

    localparam MEM_DEPTH = 2 ** (ADDR_BUS_WIDTH-10);
    localparam MEM_WIDTH = 8;
      
    reg [MEM_WIDTH - 1:0] memory[MEM_DEPTH - 1:0];
    

	 integer i; // Loop variable

    initial begin
        // Initialize all memory locations to 0
        for (i = 0; i < 62; i = i + 4) begin
            memory[i] = 8'h00;
				memory[i+1] = 8'h00;
				memory[i+2] = 8'h00;
				memory[i+3] = 8'h13;
        end

        // Assign the specific memory values
        // lw x6 -4(x9)
        memory[4]  = 8'hFF;
        memory[5]  = 8'hC4;
        memory[6]  = 8'hA3;
        memory[7]  = 8'h03;

        // sw x6, 8(x9)
        memory[8]  = 8'h00;
        memory[9]  = 8'h64;
        memory[10] = 8'hA4;
        memory[11] = 8'h23;

        // or x4, x5, x6
        memory[12] = 8'h00;
        memory[13] = 8'h62;
        memory[14] = 8'hE2;
        memory[15] = 8'h33;

        // beq x4, x4, 24
        memory[16] = 8'h00;  // 8'hFE;
        memory[17] = 8'h42;
        memory[18] = 8'h0C;  // 8'h0A;
        memory[19] = 8'h63;  // 8'hE3;

        // or x4, x5, x6
        memory[40] = 8'h00;
        memory[41] = 8'h62;
        memory[42] = 8'hE2;
        memory[43] = 8'h33;

        // Addi x12, x5(17)
        memory[44] = 8'h01;
        memory[45] = 8'h12;
        memory[46] = 8'h86;
        memory[47] = 8'h13;

        // lui x7, 4560
        memory[48] = 8'h01;
        memory[49] = 8'h1d;
        memory[50] = 8'h03;
        memory[51] = 8'hb7;

        // jal x2, -40
        memory[52] = 8'hfd;
        memory[53] = 8'h9f;
        memory[54] = 8'hf1;
        memory[55] = 8'h6f;
    end
        
//  assign LEDG = memory[5];
    assign rd = {memory[a], memory[a + 1], memory[a + 2], memory[a + 3]};

	 reg [6: 0] j = 0;
	 
	 always @(posedge enable) begin
			memory[j] <= instIn;
			j <= j + 1;
	 end
	 
//	 assign LEDR = memory[0];
	 
endmodule


//`timescale 1ns / 1ps
//
//module imem
//    #(  
//      parameter ADDR_BUS_WIDTH = 16,
//      parameter DATA_BUS_WIDTH = 32
//    )
//    (
//        input [ADDR_BUS_WIDTH - 1:0] a,
//        output  [DATA_BUS_WIDTH - 1:0] rd,
////		  output [7: 0] LEDR,
//		  input enable, 
//		  input [7: 0] instIn
//		  
//    );
//
//    localparam MEM_DEPTH = 2 ** (ADDR_BUS_WIDTH-10);
//    localparam MEM_WIDTH = 8;
//      
//    reg [MEM_WIDTH - 1:0] memory[MEM_DEPTH - 1:0];
//    
//
//	 integer i; // Loop variable
//
//    initial begin
//        // Initialize all memory locations to 0
//        for (i = 0; i < 62; i = i + 4) begin
//            memory[i] = 8'h00;
//				memory[i+1] = 8'h00;
//				memory[i+2] = 8'h00;
//				memory[i+3] = 8'h13;
//        end
//
//                // Assign the specific memory values
//        // addi x4, x0, 0
//        memory[0]  = 8'h00;
//        memory[1]  = 8'h00;
//        memory[2]  = 8'h02;
//        memory[3]  = 8'h13;
//
//        // addi x5, x0, 8
//        memory[4]  = 8'h08;
//        memory[5]  = 8'h00;
//        memory[6]  = 8'h03;
//        memory[7]  = 8'h13;
//
//        // addi x6, x0, 4
//        memory[8]  = 8'h04;
//        memory[9]  = 8'h00;
//        memory[10] = 8'h04;
//        memory[11] = 8'h13;
//
//        // or x7, x4, x5
//        memory[12] = 8'h00;
//        memory[13] = 8'h31;
//        memory[14] = 8'hE3;
//        memory[15] = 8'h33;
//
//        // addi x4, x4, 1
//        memory[16] = 8'h01;
//        memory[17] = 8'h00;
//        memory[18] = 8'h22;
//        memory[19] = 8'h13;
//
//        // addi x5, x5, -1
//        memory[20] = 8'hFF;
//        memory[21] = 8'hFF;
//        memory[22] = 8'h23;
//        memory[23] = 8'h13;
//
//        // addi x6, x6, -1
//        memory[24] = 8'hFF;
//        memory[25] = 8'hFF;
//        memory[26] = 8'h24;
//        memory[27] = 8'h13;
//
//        // beq x6, x0, 16
//        memory[28] = 8'h00;
//        memory[29] = 8'hE0;
//        memory[30] = 8'h0C;
//        memory[31] = 8'h63;
//
//        // jal x0, -20
//        memory[32] = 8'hEC;
//        memory[33] = 8'hFF;
//        memory[34] = 8'hFF;
//        memory[35] = 8'h6F;
//
//        // addi x0, x0, 0
//        memory[36] = 8'h00;
//        memory[37] = 8'h00;
//        memory[38] = 8'h00;
//        memory[39] = 8'h13;
//
//        // lw x6, -4(x9)
//        memory[40] = 8'hFC;
//        memory[41] = 8'hFF;
//        memory[42] = 8'h44;
//        memory[43] = 8'h03;
//
//        // sw x6, 8(x9)
//        memory[44] = 8'h08;
//        memory[45] = 8'h00;
//        memory[46] = 8'hC4;
//        memory[47] = 8'h23;
//
//        // or x4, x5, x6
//        memory[48] = 8'h00;
//        memory[49] = 8'h62;
//        memory[50] = 8'hE2;
//        memory[51] = 8'h33;
//
//        // addi x12, x5, 17
//        memory[52] = 8'h11;
//        memory[53] = 8'h00;
//        memory[54] = 8'hA6;
//        memory[55] = 8'h93;
//
//        // lui x7, 4560
//        memory[56] = 8'hD0;
//        memory[57] = 8'h11;
//        memory[58] = 8'h03;
//        memory[59] = 8'hB7;
//
//        // jal x2, -40
//        memory[60] = 8'hD8;
//        memory[61] = 8'hFF;
//        memory[62] = 8'h11;
//        memory[63] = 8'h6F;
//
//    end
//        
////  assign LEDG = memory[5];
//    assign rd = {memory[a], memory[a + 1], memory[a + 2], memory[a + 3]};
//
//	 reg [6: 0] j = 0;
//	 
//	 always @(posedge enable) begin
//			memory[j] <= instIn;
//			j <= j + 1;
//	 end
//	 
////	 assign LEDR = memory[0];
//	 
//endmodule
