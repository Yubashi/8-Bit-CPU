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

entity programcounter is
	port(
		i_clk       : in std_logic;
		i_rst       : in std_logic;
		i_en        : in std_logic;
		i_ld        : in std_logic;
		i_input     : in std_logic_vector(3 downto 0);
		o_output    : out std_logic_vector(3 downto 0)
	);
end programcounter;

architecture Behavioral of programcounter is

signal count : unsigned(3 downto 0) := "0000";

begin

process(i_clk,i_rst)
begin
	if i_rst = '1' then
		count<=(others=>'0');
	elsif rising_edge(i_clk) then
		if i_ld = '1' then
			count <= unsigned(i_input);
		elsif i_en ='1' then
			count<= count + 1;
		end if;
	end if;

end process;

o_output <= std_logic_vector(count);


end Behavioral;
