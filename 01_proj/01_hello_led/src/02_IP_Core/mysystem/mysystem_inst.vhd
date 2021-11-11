	component mysystem is
		port (
			clk_clk        : in    std_logic                    := 'X';             -- clk
			pio_led_export : inout std_logic_vector(3 downto 0) := (others => 'X'); -- export
			reset_reset_n  : in    std_logic                    := 'X'              -- reset_n
		);
	end component mysystem;

	u0 : component mysystem
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --     clk.clk
			pio_led_export => CONNECTED_TO_pio_led_export, -- pio_led.export
			reset_reset_n  => CONNECTED_TO_reset_reset_n   --   reset.reset_n
		);

