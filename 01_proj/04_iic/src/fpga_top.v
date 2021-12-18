module fpga_top(

    input   wire        CLK_125M     ,
    //input   wire        rst_n       ,
	 inout	wire			I2C_IDT_SCL		,
	 inout	wire	      I2C_IDT_SDA		,
	 
    inout  wire [7:0]  leds     

);
wire rst_n;
wire [1:0] intr;

wire txd, rxd;

wire	i2c_idt_sda_in;
wire  i2c_idt_scl_in;
wire  i2c_idt_sda_oe;
wire  i2c_idt_scl_oe;

assign i2c_idt_scl_in = I2C_IDT_SCL	;
assign i2c_idt_sda_in = I2C_IDT_SDA	;

assign I2C_IDT_SCL	 = i2c_idt_scl_oe? 1'b0:1'bz;
assign I2C_IDT_SDA	 = i2c_idt_sda_oe? 1'b0:1'bz;

global_reset#(
    .rst_num     (8'd10),
    .rst_type    (1'd0 )                 //复位模式 0：低有效  1：高有效
)global_reset_inst
(
	.clk    (CLK_125M   ),
	.locked (1'b1       ),
	.g_rst  (rst_n      )
);


	 
    mysystem u0 (
        .clk_clk        (CLK_125M   ),  //  clk.clk
        .reset_reset_n  (rst_n      ),  //  reset.reset_n
		  
        .i2c_idt_i2c_serial_sda_in (i2c_idt_sda_in), // i2c_idt_i2c_serial.sda_in
        .i2c_idt_i2c_serial_scl_in (i2c_idt_scl_in), //                   .scl_in
        .i2c_idt_i2c_serial_sda_oe (i2c_idt_sda_oe), //                   .sda_oe
        .i2c_idt_i2c_serial_scl_oe (i2c_idt_scl_oe), //                   .scl_oe
        .pio_led_export (leds       ),  //  pio_led.export
		  .pio_intr_export (intr      )   //  pio_intr.export 
	);
	
	

	
	const_ip	const_ip_inst (
	.result ( intr )
	);

	
    
    
endmodule
