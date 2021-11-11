
module mysystem (
	clk_clk,
	reset_reset_n,
	pio_led_export,
	pio_intr_export);	

	input		clk_clk;
	input		reset_reset_n;
	inout	[7:0]	pio_led_export;
	input	[1:0]	pio_intr_export;
endmodule
