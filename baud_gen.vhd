library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity baud_gen is
    generic (
        CLK_FREQ : integer := 100000000; -- 100 MHz
        BAUD     : integer := 9600
    );
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        tick     : out std_logic
    );
end entity;

architecture Behavioral of baud_gen is
    constant BAUD_TICK_COUNT : integer := CLK_FREQ / BAUD;
    signal counter : integer := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            tick <= '0';
        elsif rising_edge(clk) then
            if counter = BAUD_TICK_COUNT / 2 then
                tick <= '1';
                counter <= 0;
            else
                tick <= '0';
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
