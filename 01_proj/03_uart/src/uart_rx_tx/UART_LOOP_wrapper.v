//------------------------------------------------
//----------发送功能已完成，---测试；-------------
//----------接收功能完成，data <= {Rx,data[7:1]}；
module UART_LOOP_wrapper 
#(
    parameter BAUD_SET_COUNTER = 10516  //100M, 9600 计算方式BAUD_SET_COUNTER = 时钟频率/波特率取整即可
)
(
	input 			clk			,  
	input 			rst_n	 	,	
	input 			RXD			, 
	output 			TXD
);	
	wire		send_finsh;
	wire		send_start;
	wire		rx_done;
//	wire		RXD;
	wire [7:0]	data2tx;
	wire [7:0]	o_rx_data;
	
	assign data2tx = o_rx_data;
	assign send_start = rx_done;
	
	UART_TX
	#(	.BAUD_SET_COUNTER(BAUD_SET_COUNTER)			//50M,9600bps: 5206; 默认100M ,9600bps;
		)
	TX(
		.clk		(clk		),	//
		.rst_n		(rst_n		),
		.data2tx	(data2tx	),		//input [7:0] 发送数据
		.send_start	(send_start	),
		.TXD		(TXD		),
		.send_finsh (send_finsh )		//发送完成标志
		);
		
	UART_RX 
	#(	.BAUD_SET_COUNTER (BAUD_SET_COUNTER)			//50M 9600bps	计数值
		)
	RX(
		.clk			(clk		),	//	input 	
		.rst_n			(rst_n		),  // 	input	
		.RXD			(RXD		),  // 	input	

		.rx_done		(rx_done	),  // 	output	
		.o_rx_data      (o_rx_data  )	//	output	[7:0]
);
endmodule
