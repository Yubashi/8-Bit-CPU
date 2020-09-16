----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2020 10:09:49
-- Design Name: 
-- Module Name: reg_tb - Behavioral
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

entity reg_tb is
--  Port ( );
end reg_tb;

architecture Behavioral of reg_tb is

component reg is
port(
    i_clk          : in std_logic;
	i_rst          : in std_logic;
	i_out_en       : in std_logic;
	i_load	       : in std_logic;
	i_input	       : in std_logic_vector(7 downto 0);
	o_output       : out std_logic_vector(7 downto 0);
	o_output_alu   : out std_logic_vector(7 downto 0)
	);
	
end component;

signal clk, rst, out_en, load : std_logic;
signal input : std_logic_vector(7 downto 0);
signal output, output_alu: std_logic_vector(7 downto 0);

constant clk_period : time := 10ns;

begin

dut: reg 
port map(
    i_clk          => clk,
	i_rst          => rst,
	i_out_en       => out_en,
	i_load	       => load,
	i_input	       => input,
	o_output       => output,
	o_output_alu   => output_alu
);

-- This process generates the clock
clk_p : process
begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
end process;

-- testcases
testcases : process
begin --initiate all zero, reset active
rst <= '1';
out_en <= '0';
load <= '0';
input <= "00000000";

wait until falling_edge(clk);
wait until falling_edge(clk); -- reset inactive
rst <= '0'; 

wait until falling_edge(clk); -- load input for one cycle
input <= "00001111";
load <= '1';

wait until falling_edge(clk); 
load <= '0';

wait until falling_edge(clk); -- enable output signal for one cycle
out_en <= '1';

wait until falling_edge(clk);
out_en <= '0';
wait;

end process;


end Behavioral;
