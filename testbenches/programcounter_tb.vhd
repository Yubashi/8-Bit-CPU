----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2020 10:09:49
-- Design Name: 
-- Module Name: programcounter_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity programcounter_tb is
end programcounter_tb;

architecture Behavioral of programcounter_tb is

component programcounter is 
port(
		i_clk       : in std_logic;
		i_rst       : in std_logic;
		i_en        : in std_logic;
		i_ld        : in std_logic;
		i_input     : in std_logic_vector(3 downto 0);
		o_output    : out std_logic_vector(3 downto 0)
		);
end component;

signal clk, rst, en, ld : std_logic;
signal input : std_logic_vector(3 downto 0);
signal output : std_logic_vector(3 downto 0);

constant clk_period : time := 10ns;

begin

dut: programcounter
port map(
		i_clk       => clk,
		i_rst       => rst,
		i_en        => en,
		i_ld        => ld,
		i_input     => input,
		o_output    => output
);

-- This process generates the clock
clk_p : process
begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
end process;

testcase : process
begin -- initiate all zero, reset active
rst <= '1';
en <= '0';
ld <= '0';
input <= "0000";

wait until falling_edge(clk);
wait until falling_edge(clk); -- reset inactive
rst <= '0';

wait until falling_edge(clk); -- load value for one cycle
ld <= '1';
input <= "0010";

wait until falling_edge(clk); -- hold on to value
ld <= '0';

wait until falling_edge(clk); -- enable counter for two cycles
en <= '1';

wait until falling_edge(clk); -- disable counter
wait until falling_edge(clk); -- disable counter
en <= '0';
wait;

end process;


end Behavioral;
