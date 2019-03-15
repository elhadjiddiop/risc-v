library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity controler is port (		reset				: in std_logic;										
					clk				: in std_logic;										
					hit_i				: in std_logic;										
					out_pc				: out std_logic_vector(31 downto 0));		
end controler;

architecture Arch of controler is

	signal pc					: std_logic_vector(31 downto 0);
	signal pc_final					: std_logic_vector(31 downto 0);
	signal step : std_logic_vector(31 downto 0)	:= "00000000000000000000000000000100";
	begin
	
		pc <= pc_final + step;
		
		seq : process (clk, reset)
			begin
				if (reset = '1') then
					pc_final <= "00000000000000000000000000000000";
				elsif (clk'event and clk = '1' and hit_i = '1' ) then
					pc_final <= pc;
				end if;
			end process seq;

		out_pc <= pc_final;
end architecture;


