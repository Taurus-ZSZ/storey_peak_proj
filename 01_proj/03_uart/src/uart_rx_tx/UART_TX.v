module UART_TX
#(	parameter	BAUD_SET_COUNTER = 10416	//100M, 9600
	)
(
	input 				clk		,
	input				rst_n	,
	input		[7:0]	data2tx	,
	input				send_start,
	output	reg			TXD		,
	output	reg			send_finsh
	);
	
	reg	[31:0]	counter;
	reg [7:0]	data;
	reg	[3:0]	bit_cnt;
	reg			send_start_reg1, send_start_reg2;
	reg	[7:0]	state;
	localparam
		TX_Idel			= 8'b0000_0001,
		TX_start		= 8'b0000_0010;
//		TX_Idel			= 8'b0000_0100,
//		TX_Idel			= 8'b0000_1000,
//		TX_Idel			= 8'b0001_0000,
//		TX_Idel			= 8'b0010_0000,
//		TX_Idel			= 8'b0100_0000;
	
	always	@ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
		begin
			send_start_reg1 <= 1'b0;
			send_start_reg2 <= 1'b0;
		end
		else
		begin
			send_start_reg1 <= send_start;
			send_start_reg2 <= send_start_reg1;
		end
			
	end
	
	always	@ (posedge clk or negedge rst_n)
	begin
		if (!rst_n)
		begin
			counter <= 32'd0;
			data	<= 8'd0;
			bit_cnt <= 4'd0;
			TXD 	<= 1'b1;
            send_finsh <= 1'd0;
			//cnt		<= 0;
			state <= TX_Idel;
		end
		else
			case (state)
				TX_Idel	:
					begin		
						send_finsh <= 1'b0;
						//if (send_start_reg1 & !send_start_reg2)
						if (send_start)
						begin
							data  <= data2tx;
							state <= TX_start;							
						end
						else
							state <= TX_Idel;					
					end
				
				TX_start	:
					begin
						//cnt <= cnt + 1;
						counter <= counter + 1'd1;
						if (bit_cnt == 4'd0)
						begin
							TXD <= 1'b0;
							if (counter == BAUD_SET_COUNTER)
							begin
								bit_cnt	<= bit_cnt + 1'b1;
								TXD	<= data[bit_cnt];
								counter	<= 32'd0;
							end						
						end
						else if ((bit_cnt >= 1)&&(bit_cnt < 8))
						begin
							if (counter == BAUD_SET_COUNTER)
							begin
								bit_cnt	<= bit_cnt + 1'b1;
								counter	<= 32'd0;
								TXD	<= data[bit_cnt ];							
							end							
						end
						else if ((bit_cnt >= 8) && (bit_cnt <= 9))
							case (bit_cnt)
								8	:
									if (counter == BAUD_SET_COUNTER)
										begin
											TXD <= 1'b1;
											bit_cnt	<=  bit_cnt + 1'b1;
											counter	<= 32'd0;
										end	
								9	:
									if (counter == BAUD_SET_COUNTER)
									begin
										bit_cnt	<= 4'd0;
										counter	<= 32'd0;
										send_finsh <= 1'b1;
										state <= TX_Idel;
									end		
								default	:
									begin
										bit_cnt	<= 4'd0;
										counter	<= 32'd0;
										state <= TX_Idel;
									end
							endcase
						else
						begin
							bit_cnt	<= 4'd0;
							counter	<= 32'd0;
							state <= TX_Idel;
						end	
					end
				default	:	state <= TX_Idel;
			endcase
	end
endmodule
