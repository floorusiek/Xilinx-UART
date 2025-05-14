library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_top is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        rx       : in  std_logic;
        tx       : out std_logic;
        rx_data  : out std_logic_vector(7 downto 0);
        rx_done  : out std_logic;
        tx_data  : in  std_logic_vector(7 downto 0);
        tx_start : in  std_logic;
        tx_busy  : out std_logic
    );
end uart_top;

architecture Behavioral of uart_top is
    signal tick : std_logic;
begin
    baud_gen_inst: entity work.baud_gen
        port map (
            clk   => clk,
            reset => reset,
            tick  => tick
        );

    tx_inst: entity work.uart_tx
        port map (
            clk      => clk,
            reset    => reset,
            tx_start => tx_start,
            tx_data  => tx_data,
            tick     => tick,
            tx       => tx,
            tx_busy  => tx_busy
        );

    rx_inst: entity work.uart_rx
        port map (
            clk     => clk,
            reset   => reset,
            rx      => rx,
            tick    => tick,
            rx_data => rx_data,
            rx_done => rx_done
        );
end Behavioral;
