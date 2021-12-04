
module mysystem (
	clk_clk,
	pio_intr_export,
	pio_led_export,
	reset_reset_n,
	uart_0_rxd,
	uart_0_txd);	

	input		clk_clk;
	input	[1:0]	pio_intr_export;
	inout	[7:0]	pio_led_export;
	input		reset_reset_n;
	input		uart_0_rxd;
	output		uart_0_txd;
endmodule
