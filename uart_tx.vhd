
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        tx_start: in  std_logic;
        tx_data : in  std_logic_vector(7 downto 0);
        tick    : in  std_logic;
        tx      : out std_logic;
        tx_busy : out std_logic
    );
end uart_tx;

architecture Behavioral of uart_tx is
    type state_type is (idle, start, data, stop);
    signal state : state_type := idle;
    signal bit_cnt : integer range 0 to 7 := 0;
    signal tx_reg : std_logic_vector(7 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            tx <= '1';
            tx_busy <= '0';
            state <= idle;
        elsif rising_edge(clk) then
            if tick = '1' then
                case state is
                    when idle =>
                        tx <= '1';
                        tx_busy <= '0';
                        if tx_start = '1' then
                            tx_reg <= tx_data;
                            tx_busy <= '1';
                            state <= start;
                        end if;

                    when start =>
                        tx <= '0';
                        state <= data;
                        bit_cnt <= 0;

                    when data =>
                        tx <= tx_reg(bit_cnt);
                        if bit_cnt = 7 then
                            state <= stop;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;

                    when stop =>
                        tx <= '1';
                        state <= idle;
                        tx_busy <= '0';
                end case;
            end if;
        end if;
    end process;
end Behavioral;
