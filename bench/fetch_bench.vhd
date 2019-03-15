library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_VHDL;

entity bench_fetch is
end entity;

architecture arch of bench_fetch is

	signal req_i		: std_logic := '0';
	signal req_o		: std_logic ;
	signal clk		: std_logic := '0';
	signal reset		: std_logic := '0';
	signal hit_in		: std_logic := '0';
	signal hit_out		: std_logic := '0';
	signal in_adress	: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal out_adress	: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal in_inst		: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
	signal out_inst		: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
constant clock_period : time := 20 ns;


begin

	DUT : entity lib_VHDL.fetch
		port map(
			clk		=>    clk,		
			reset		=>    reset	,
			req_i		=>    req_i	,
			in_adress	=>    in_adress,
			out_adress	=>    out_adress,	
			in_inst		=>    in_inst	,
			hit_in		=>    hit_in	,
			req_o		=>    req_o	,
			hit_out		=>    hit_out	,
			out_inst	=>    out_inst	);


	clk <= not clk                after clock_period/2;
	reset <= '1','0' after 45 ns;

	simulation : process
	begin

		in_adress	<= "00000000100000000000100000000010";
		in_inst		<= "01010000100000101000000000110011";
		hit_in 		<= '1';
		req_i 		<= '1';

		wait until rising_edge(clk);
			in_adress	<= "00000100000001000000100000000000";
			in_inst		<= "01010001000110101000000000110011";
			hit_in 		<= '1';
			req_i 		<= '1';
		

		wait until rising_edge(clk);
			in_adress	<= "00000100000001000000100000000000";
			in_inst		<= "01010001000000101000000000110011";
			hit_in 		<= '1';
			req_i 		<= '1';

		wait until rising_edge(clk);
			in_adress	<= "00000100000001000000100000000000";
			in_inst		<= "01010001100010101000000001110111";
			hit_in 		<= '1';
			req_i 		<= '0';
		

		wait until rising_edge(clk);
			in_adress	<= "00000100000101000000100000000000";
			in_inst		<= "01010001000100101000110000110011";
			hit_in 		<= '1';
			req_i 		<= '1';
		
		wait until rising_edge(clk);
			in_adress	<= "00000100100001000100100000000000";
			in_inst		<= "01010001000010101000000100110011";
			hit_in 		<= '1';
			req_i 		<= '1';

		wait for 10 ns;
	end process simulation;

end architecture;
