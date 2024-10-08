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
		memory[9] = 8'b00000011;
		memory[10] = 8'b00000000;
		memory[11] = 8'h00;	//instr[19:15] = 6
	end
        
   assign rd = {memory[a], memory[a + 1], memory[a + 2], memory[a + 3]};

endmodule
