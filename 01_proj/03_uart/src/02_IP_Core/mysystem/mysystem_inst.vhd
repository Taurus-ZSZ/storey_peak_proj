	component mysystem is
		port (
			clk_clk         : in    std_logic                    := 'X';             -- clk
			pio_intr_export : in    std_logic_vector(1 downto 0) := (others => 'X'); -- export
			pio_led_export  : inout std_logic_vector(7 downto 0) := (others => 'X'); -- export
			reset_reset_n   : in    std_logic                    := 'X';             -- reset_n
			uart_0_rxd      : in    std_logic                    := 'X';             -- rxd
			uart_0_txd      : out   std_logic                                        -- txd
		);
	end component mysystem;

	u0 : component mysystem
		port map (
			clk_clk         => CONNECTED_TO_clk_clk,         --      clk.clk
			pio_intr_export => CONNECTED_TO_pio_intr_export, -- pio_intr.export
			pio_led_export  => CONNECTED_TO_pio_led_export,  --  pio_led.export
			reset_reset_n   => CONNECTED_TO_reset_reset_n,   --    reset.reset_n
			uart_0_rxd      => CONNECTED_TO_uart_0_rxd,      --   uart_0.rxd
			uart_0_txd      => CONNECTED_TO_uart_0_txd       --         .txd
		);

