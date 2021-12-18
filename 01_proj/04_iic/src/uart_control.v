module uart_control #
(
	parameter BAUD_SET_COUNTER = 10516  //100M, 9600 计算方式BAUD_SET_COUNTER = 时钟频率/波特率取整即可
)
(
	input		wire 	clk	,
	input		wire	rst_n	,
	input		wire	rxd	,
	output	wire	txd	
);


localparam  IDLE		= 3'd0,
				RD_DATA	= 3'd1,
				SD_DATA  = 3'd2;
reg [2:0] CS ;
reg [7:0] rd_cnt, wr_cnt;

wire rx_done;
wire [7:0] rx_data;
reg  [7:0] rd_ram_addr,wr_ram_addr;
wire [7:0] ram_addr;
wire ram_wren;
reg  ram_rden;
reg clear_addr, clear_wr_cnt;

wire send_finsh;
wire read;

assign ram_wren = rx_done;



assign ram_addr = read ? rd_ram_addr : wr_ram_addr;

//----------------------------------------------------
//------- write reciver rxd data to ram
//----------------------------------------------------

	always @ (posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			wr_cnt <= 8'd0;
			wr_ram_addr <= 'd0;
		end else begin
			if (rx_done) begin			//	addr add 
				wr_cnt <= wr_cnt + 1'b1;
				wr_ram_addr <= wr_ram_addr + 1'b1;
			end else begin
				if (clear_addr)
					wr_ram_addr <='d0;
				if (clear_wr_cnt)
					wr_cnt <= 'd0;
			end
		end 	
	end 
	
	
	always @ (posedge clk or negedge rst_n) begin 
		if (~rst_n) begin 
			rd_ram_addr <= 'd0;
			ram_rden <= 1'd0;
			clear_addr <= 1'd0;
			clear_wr_cnt <= 1'd0;
		end else begin 
			if (read ) begin 
				clear_addr <= 1'd1;
				if (rd_cnt <= wr_cnt) begin
					ram_rden <= 1'd1;
					rd_cnt <= rd_cnt + 1'b1;
					rd_ram_addr <= rd_ram_addr + 1'b1;
				end else begin
					clear_addr <= 1'd0;
					clear_wr_cnt <= 1'd1;
				end 
			end else begin
				rd_cnt <= 'd0;
				clear_wr_cnt <= 1'd0;
			end 
		end 
	end 


	UART_TX
	#(	.BAUD_SET_COUNTER(BAUD_SET_COUNTER)			//50M,9600bps: 5206; 默认100M ,9600bps;
		)
	TX(
		.clk			(clk			),	//
		.rst_n		(rst_n		),
		.data2tx		(8'd9		),		//input [7:0] 发送数据
		.send_start	(1'b0       	),    //send_start
		.TXD			(txd			),
		.send_finsh (send_finsh )		//发送完成标志
		);
		
	UART_RX 
	#(	.BAUD_SET_COUNTER (BAUD_SET_COUNTER)			//50M 9600bps	计数值
		)
	RX(
		.clk			(clk		),	//	input 	
		.rst_n	   (rst_n	),  // 	input	
		.RXD			(rxd		),  // 	input	

		.rx_done		(rx_done	),  // 	output	
		.o_rx_data	(rx_data )   //	output	[7:0]
	);

	
	uart_ram_ip	uart_ram_ip_inst (
		.address ( ram_addr  ),
		.clock 	( clk 		),
		.data 	( rx_data   ),
		.rden 	( ram_rden  ),
		.wren 	( ram_wren  ),
		.q 		( ram_q 	   )
	);
	
	const_ip	const_ip_uart_inst (
	.result ( read )
	);



endmodule

