library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_VHDL;

entity controler_fetch is
end entity;

architecture archi of controler_fetch is

	signal hit_i		: std_logic := '0';
	signal clk		: std_logic := '0';
	signal reset		: std_logic := '0';
	signal out_pc		: std_logic_vector(31 downto 0) := "00000000000000000000000000000000"; 
constant clock_period : time := 20 ns;


begin

	DUT : entity lib_VHDL.controler
		port map(
			clk		=>    clk,		
			reset		=>    reset	,
			hit_i		=>    hit_i	,
			out_pc		=>    out_pc	);


	clk <= not clk                after clock_period/2;
	reset <= '1','0' after 45 ns;

	simulation : process
	begin

		hit_i 		<= '1';

		wait until rising_edge(clk);
			hit_i 		<= '1';
		

		wait until rising_edge(clk);
			hit_i 		<= '1';

		wait until rising_edge(clk);
			hit_i 		<= '0';
		

		wait until rising_edge(clk);
			hit_i 		<= '1';
		
		wait until rising_edge(clk);
			hit_i 		<= '1';

		wait for 10 ns;
	end process simulation;

end architecture;
