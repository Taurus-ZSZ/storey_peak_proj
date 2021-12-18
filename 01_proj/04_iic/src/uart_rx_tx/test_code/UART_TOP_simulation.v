//------------------------------------------------
//---------------发送功能已完成，但仍然待测试；---
//----------接收功能还未完成，data <= {Rx,data[7:1]}；
module UART_TOP_simulation (
	input 			clk		,  
	input 			rst_n	 ,
	input 	[7:0]	data2tx	 ,
	input 			send_start	
	
	//input 			RXD		, 
	//output 			TXD
);	
	wire		send_finsh;
	//wire		send_start;
	wire		rx_done;
	wire		RXD;
	//wire [7:0]	data2tx;
	wire [7:0]	o_rx_data;
	
	UART_TX
	#(	.BAUD_SET_COUNTER(5206)			//50M,
		)
	TX(
		.clk		(clk		),
		.rst_n		(rst_n		),
		.data2tx	(data2tx	),
		//.data2tx	(8'h55	),
		//.send_start	(1	),
		.send_start	(send_start	),
		.TXD		(RXD		),
		.send_finsh (send_finsh )
		);
		
	UART_RX 
	#(	.BAUD_SET_COUNTER (5206)			//50M 9600bps	计数值
		)
	RX(
		.clk			(clk		),	//	input 	
		.rst_n			(rst_n		),  // 	input	
		.RXD			(RXD		),  // 	input	

		.rx_done		(rx_done	),  // 	output	
		.o_rx_data      (o_rx_data  )	//	output	[7:0]
);
endmodule
