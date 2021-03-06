--This is the polynomial Evaluation Unit
--It takes the argument to a polynomial and calculates its value
--The Polynomial is defined as a constant
-- in/output numbers are integers (not floating point)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity polynom is
	port (
		-- synchronous interface
		rst : in std_logic; -- synchronous reset
		clk : in std_logic;

		-- TODO: Your Interface here
		x	: in integer;
		fx	: out integer
	);
end;

architecture behav of polynom is
	
	--Polynomial Definition (same as in module)
	constant POLY_DEGREE : integer := 4; -- degree of polynomial

	type poly_coeff_type is array(0 to POLY_DEGREE) of signed(8 downto 0);

--	constant POLY_COEFF : poly_coeff_type := (
--			0 => to_signed(-8, POLY_COEFF(0)'length),
--			1 => to_signed(-3, POLY_COEFF(0)'length),
--			2 => to_signed(4, POLY_COEFF(0)'length),
--			3 => to_signed(-2, POLY_COEFF(0)'length),
--			4 => to_signed(1, POLY_COEFF(0)'length)
--		);
		
	--constant POLY_COEFF : poly_coeff_type := (-8, -3, 4, -2, 1);

	-- TODO: Add your Implementation here
	begin
	
	process(clk)
		begin
		if clk'event and clk='1' then
			if rst = '1' then
				fx	<= 0;
			else
				--fx <= POLY_COEFF(4) * x**4 - POLY_COEFF(3) * x**3 + POLY_COEFF(2) * x**2 - POLY_COEFF(1) * x + POLY_COEFF(0);
				fx <= (8 * x*x*x*x) + (3 * x*x*x) + (4 * x*x) + (2 * x) + (1);
			end if;
		end if;
	end process;
	
end architecture;