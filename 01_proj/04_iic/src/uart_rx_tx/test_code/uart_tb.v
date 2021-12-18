`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:37:41 10/12/2019
// Design Name:   UART_TOP
// Module Name:   E:/ZSZ/ZSZ_1901_Project/ISE/test_uart/uart_v2/verilog/uart_tb.v
// Project Name:  uart_v2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_tb;

	// Inputs
	reg clk;
	reg rst_n;
	reg RXD;

	// Outputs
	wire TXD;

	// Instantiate the Unit Under Test (UUT)
	UART_TOP uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.RXD(RXD), 
		.TXD(TXD)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		RXD = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst_n = 1;
		// Add stimulus here

	end
	
	always # 10 clk <= ~clk;
      
endmodule

