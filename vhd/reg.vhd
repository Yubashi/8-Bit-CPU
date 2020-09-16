----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2020 09:29:57
-- Design Name: 
-- Module Name: programcounter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
	port(
    i_clk          : in std_logic;
	i_rst          : in std_logic;
	i_out_en       : in std_logic;
	i_load	       : in std_logic;
	i_input	       : in std_logic_vector(7 downto 0);
	o_output       : out std_logic_vector(7 downto 0);
	o_output_alu   : out std_logic_vector(7 downto 0)
	);
end reg;

architecture Behavioral of reg is

signal stored_value : std_logic_vector(7 downto 0):=(others=>'Z');

begin

process( i_clk, i_rst)
begin
	if  i_rst = '1' then
		stored_value<=(others=>'Z');
	elsif rising_edge( i_clk) then
		if  i_load = '1' then
			stored_value <=  i_input;
		end if;	
	end if;
end process;


o_output<= stored_value when  i_out_en = '1' else (others=>'Z');
o_output_alu<=stored_value;


end Behavioral;
