library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;



entity fetch is port (  clk,reset,req_i,hit_in		: in std_logic;
			in_adress			: in std_logic_vector(31 downto 0);		-- intruction dans la memoire
			out_adress			: out std_logic_vector(31 downto 0);		-- intruction dans la memoire
			in_inst				: in std_logic_vector(31 downto 0);		-- intruction dans la memoire
			hit_out,req_o			: out std_logic;					-- dans le cas ou on ne peut pas acceder a la memoire demandee
			out_inst			: out std_logic_vector(31 downto 0) );
end fetch;

architecture A of fetch is

	begin
		hit_out <= hit_in;
		req_o  <= req_i;
		seq : process (clk, reset,req_i,hit_in)
			begin
				if (reset = '1') then
					out_adress <= "00000000000000000000000000000000"; -- on reinitialise le program counter
					out_inst <= "00000000000000000000000000000000";

				elsif (clk'event and clk = '1' and hit_in = '1' and req_i='1' ) then
					out_inst <= in_inst;
					out_adress <= in_adress;
				end if;
		end process seq;
end A;
