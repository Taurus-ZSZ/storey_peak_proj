
module mysystem (
	clk_clk,
	i2c_idt_i2c_serial_sda_in,
	i2c_idt_i2c_serial_scl_in,
	i2c_idt_i2c_serial_sda_oe,
	i2c_idt_i2c_serial_scl_oe,
	pio_intr_export,
	pio_led_export,
	reset_reset_n);	

	input		clk_clk;
	input		i2c_idt_i2c_serial_sda_in;
	input		i2c_idt_i2c_serial_scl_in;
	output		i2c_idt_i2c_serial_sda_oe;
	output		i2c_idt_i2c_serial_scl_oe;
	input	[1:0]	pio_intr_export;
	inout	[7:0]	pio_led_export;
	input		reset_reset_n;
endmodule
