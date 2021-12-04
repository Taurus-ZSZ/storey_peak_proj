//----------先计数起始位的一半，然后计整个周期，一个大周期取一次数据，取8次，然后再计一个周期，跳转到，结束符状态，再计一半，接收完毕；
//-----------模式： 8bit data + 1bit停止位---------------------------------
module UART_RX 
#(	parameter BAUD_SET_COUNTER = 10416			//100M 9600bps	计数值
	)
(
	input 				clk			,
	input				rst_n		,
	input				RXD			,
		
	output	reg			rx_done		,
	output	reg	[7:0]	o_rx_data
);
	localparam HaLF_COUNTER = BAUD_SET_COUNTER/2;		//计数值/2

	reg [7:0]	data_buf;
	reg [13:0]	counter; 
	reg [3:0]	rec_cnt; 
	reg rx_reg1, rx_reg2;
	
	reg [3:0]	state;
	localparam
		Idel			= 4'd0,
		half_star		= 4'd1,
		Rec_data		= 4'd2,
		End_flag		= 4'd3;
		
	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
		begin
			rx_reg1 <= 1'd0;
			rx_reg2 <= 1'd0;		
		end
		else
		begin
			rx_reg1 <= RXD;
			rx_reg2 <= rx_reg1;		
		end
	end	
		
	always @ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
		begin
			rec_cnt <= 4'd0;
			rx_done <= 1'd0;
			data_buf  <= 8'd0;
			o_rx_data <= 8'd0;
			counter	<= 14'd0;
			state	<= Idel;
		end
		else
			case (state)
				Idel :
					begin
						rx_done <= 1'd0;		//接收完成信号	1个工作时钟
						if (!rx_reg1 & rx_reg2)	//下降沿，表示新的开始位到来；
							state <= half_star;
						else
							state <= Idel;
					end
					
				half_star :
					if (counter == HaLF_COUNTER - 1)
					begin
						counter	<= 14'd0;
						state	<= Rec_data;
					end
					else
						counter <= counter + 1'b1;
					
				Rec_data :
					begin
						if (counter == BAUD_SET_COUNTER)	//在每个bit的中间位置取数据
						begin
							counter	<= 14'd0;
							rec_cnt <= rec_cnt + 1'd1;
							if (rec_cnt < 8)
								data_buf <= {rx_reg1,data_buf[7:1]};	//移位接收数据
							else
							begin
								rec_cnt <= 4'd0;
								o_rx_data <= data_buf;		//8bit 数据接收完成
								state 	<= End_flag;
							end
						end
						else
							counter <= counter + 1'b1;					
					end
				
				End_flag : 
					if (counter == HaLF_COUNTER - 1)
					begin
						counter	<= 14'd0;
						rx_done	<= 1'd1;
						state	<= Idel;
					end
					else
						counter <= counter + 1'b1;
						
				default	:	state <= Idel;
			endcase
	end

endmodule
