`timescale 1ns / 1ps

module processor_tb
	#(
	parameter BUS_WIDTH = 32
	);

    reg clk = 1'b0;

    // Clock generation
    always begin
        #10 clk = ~clk;
    end
	 
	 processor # (BUS_WIDTH) processor_inst (
        .clk(clk)
    );

endmodule