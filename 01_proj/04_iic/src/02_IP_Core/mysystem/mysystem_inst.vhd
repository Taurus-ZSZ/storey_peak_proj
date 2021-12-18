	component mysystem is
		port (
			clk_clk                   : in    std_logic                    := 'X';             -- clk
			i2c_idt_i2c_serial_sda_in : in    std_logic                    := 'X';             -- sda_in
			i2c_idt_i2c_serial_scl_in : in    std_logic                    := 'X';             -- scl_in
			i2c_idt_i2c_serial_sda_oe : out   std_logic;                                       -- sda_oe
			i2c_idt_i2c_serial_scl_oe : out   std_logic;                                       -- scl_oe
			pio_intr_export           : in    std_logic_vector(1 downto 0) := (others => 'X'); -- export
			pio_led_export            : inout std_logic_vector(7 downto 0) := (others => 'X'); -- export
			reset_reset_n             : in    std_logic                    := 'X'              -- reset_n
		);
	end component mysystem;

	u0 : component mysystem
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --                clk.clk
			i2c_idt_i2c_serial_sda_in => CONNECTED_TO_i2c_idt_i2c_serial_sda_in, -- i2c_idt_i2c_serial.sda_in
			i2c_idt_i2c_serial_scl_in => CONNECTED_TO_i2c_idt_i2c_serial_scl_in, --                   .scl_in
			i2c_idt_i2c_serial_sda_oe => CONNECTED_TO_i2c_idt_i2c_serial_sda_oe, --                   .sda_oe
			i2c_idt_i2c_serial_scl_oe => CONNECTED_TO_i2c_idt_i2c_serial_scl_oe, --                   .scl_oe
			pio_intr_export           => CONNECTED_TO_pio_intr_export,           --           pio_intr.export
			pio_led_export            => CONNECTED_TO_pio_led_export,            --            pio_led.export
			reset_reset_n             => CONNECTED_TO_reset_reset_n              --              reset.reset_n
		);

