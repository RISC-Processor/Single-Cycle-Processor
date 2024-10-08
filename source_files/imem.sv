`timescale 1ns / 1ps

module imem
    #(  
      parameter ADDR_BUS_WIDTH = 16,
      parameter DATA_BUS_WIDTH = 32
    )
    (
        input logic [ADDR_BUS_WIDTH - 1:0] a,
        output logic [DATA_BUS_WIDTH - 1:0] rd
    );

    localparam MEM_DEPTH = 2 ** ADDR_BUS_WIDTH;
    localparam MEM_WIDTH = 8;
      
    logic [MEM_WIDTH - 1:0] memory[MEM_DEPTH - 1:0];
    
//    initial
//        $readmemh("memfile.dat", memory);
	initial
	begin
		memory[4] = 8'hFF;
		memory[5] = 8'hC4;
		memory[6] = 8'hA3;
		memory[7] = 8'h03;
		
		memory[8] = 8'h00;
		memory[9] = 8'h64;
		memory[10] = 8'hA4;
		memory[11] = 8'h23;

    memory[12] = 8'h00;
		memory[13] = 8'h62;
		memory[14] = 8'hE2;
		memory[15] = 8'h33;

    memory[16] = 8'hFE;
		memory[17] = 8'h42;
		memory[18] = 8'h0A;
		memory[19] = 8'hE3;
	end
        
   assign rd = {memory[a], memory[a + 1], memory[a + 2], memory[a + 3]};

endmodule
