
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module top_single_cycle_processor_quartus(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,

	//////////// LED //////////
	output		     [8:0]		LEDG,
	output		    [17:0]		LEDR,
	

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// EX_IO //////////
	inout 		     [6:0]		EX_IO,

	//////////// SW //////////
	input 		    [17:0]		SW,

	//////////// SEG7 //////////
//	output		     [6:0]		HEX0,
//	output		     [6:0]		HEX1,
//	output		     [6:0]		HEX2,
//	output		     [6:0]		HEX3,
//	output		     [6:0]		HEX4,
//	output		     [6:0]		HEX5,
//	output		     [6:0]		HEX6,
//	output		     [6:0]		HEX7,

	//////////// LCD //////////
	output		          		LCD_BLON,
	inout 		     [7:0]		LCD_DATA,
	output		          		LCD_EN,
	output		          		LCD_ON,
	output		          		LCD_RS,
	output		          		LCD_RW
);


wire [7: 0] RegFiletToTx, RxToIMem;
wire Rxclk_en, Txclk_en, ready;

//=======================================================
//  REG/WIRE declarations
//=======================================================
processor processor_u(
	.clk(KEY[0]),
	.rst(KEY[1]),
	.LEDG(LEDG[7: 0]),
//	.LEDR1(LEDR[7: 0]),
//	.LEDR2(LEDR[17: 10]),
	
	
	.en(KEY[2]),
	.Tx_busy(Tx_busy),
	.dout(RegFiletToTx),        // Output is now 8 bits
	.Ready_Byte(Ready_Byte),   // Ready signal for 8-bit data
	.clk_50M(CLOCK_50),
	
	
	.instIn(RxToIMem),
	.enable(ready),
);


transmitter uart_Tx(
					.data_in(RegFiletToTx),
				    .wr_en(Ready_Byte),
					.clk_50m(CLOCK_50),
					.clken(Txclk_en), 
					.Tx(EX_IO[0]),
					.Tx_busy(Tx_busy)
					); 
					
										
baudrate uart_baud(	
				    .clk_50m(CLOCK_50),
					.Rxclk_en(Rxclk_en),
					.Txclk_en(Txclk_en)
					);
					

receiver uart_Rx(  
					.Rx(EX_IO[1]),
			        .ready(ready),
					.clk_50m(CLOCK_50),
					.clken(Rxclk_en), 
					.data_out(RxToIMem)
					);




endmodule
