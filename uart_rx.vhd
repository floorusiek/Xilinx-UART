library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_rx is
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        rx      : in  std_logic;
        tick    : in  std_logic;
        rx_data : out std_logic_vector(7 downto 0);
        rx_done : out std_logic
    );
end uart_rx;

architecture Behavioral of uart_rx is
    type state_type is (idle, start, data, stop);
    signal state : state_type := idle;
    signal bit_cnt : integer range 0 to 7 := 0;
    signal rx_reg : std_logic_vector(7 downto 0);
    signal sample : std_logic_vector(1 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= idle;
            rx_done <= '0';
        elsif rising_edge(clk) then
            if tick = '1' then
                case state is
                    when idle =>
                        rx_done <= '0';
                        if rx = '0' then
                            state <= start;
                        end if;

                    when start =>
                        if rx = '0' then
                            state <= data;
                            bit_cnt <= 0;
                        else
                            state <= idle;
                        end if;

                    when data =>
                        rx_reg(bit_cnt) <= rx;
                        if bit_cnt = 7 then
                            state <= stop;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;

                    when stop =>
                        if rx = '1' then
                            rx_data <= rx_reg;
                            rx_done <= '1';
                        end if;
                        state <= idle;
                end case;
            end if;
        end if;
    end process;
end Behavioral;
