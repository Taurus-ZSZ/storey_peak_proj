	component mysystem is
		port (
			clk_clk         : in    std_logic                    := 'X';             -- clk
			reset_reset_n   : in    std_logic                    := 'X';             -- reset_n
			pio_led_export  : inout std_logic_vector(7 downto 0) := (others => 'X'); -- export
			pio_intr_export : in    std_logic_vector(1 downto 0) := (others => 'X')  -- export
		);
	end component mysystem;

	u0 : component mysystem
		port map (
			clk_clk         => CONNECTED_TO_clk_clk,         --      clk.clk
			reset_reset_n   => CONNECTED_TO_reset_reset_n,   --    reset.reset_n
			pio_led_export  => CONNECTED_TO_pio_led_export,  --  pio_led.export
			pio_intr_export => CONNECTED_TO_pio_intr_export  -- pio_intr.export
		);

