`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/16 15:21:27
// Design Name: 
// Module Name: global_reset
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module global_reset#(
    parameter   rst_num     = 8'd10,
    parameter   rst_type    = 1'd1                  //复位模式 0：低有效  1：高有效
)
(
	input	clk,
	input	locked,
	
	output	reg	g_rst
);
	
	reg	[7:0]	rst_cnt;
	
	always@(posedge clk)	begin
		if(locked)	begin
			if(rst_cnt>=rst_num)	begin				//rst信号持续时钟满足			
				g_rst	<= !rst_type;
			end
			else	begin
				g_rst	<= rst_type;
				rst_cnt	<= rst_cnt + 1;
			end
		end
		else	begin
			rst_cnt	<= 0;
			g_rst	<= !rst_type;
		end
	end
	
endmodule
