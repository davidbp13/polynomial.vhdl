--This is the Testbench for the polynomial Evaluation Unit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity polynom_tb is
end entity;

architecture behav of polynom_tb is
	
	constant CLK_PERIOD : time := 10 ns;
	signal clk 	: std_logic := '0';
	signal rst	: std_logic := '0';
	signal x 	: integer := 0;
	signal fx	: integer := 0;
	
	component polynom is
		port (
			-- synchronous interface
			rst : in std_logic; -- synchronous reset
			clk : in std_logic;

			-- TODO: place your modules Interface here
			x	: in integer;
			fx	: out integer
		);
	end component;

	--Polynomial Definition (same as in module)
--	constant POLY_DEGREE : integer := 4; -- degree of polynomial
--
--	type poly_coeff_type is array(0 to POLY_DEGREE) of signed(8 downto 0);

--	constant POLY_COEFF : poly_coeff_type := (
--			0 => to_signed(-8, POLY_COEFF(0)'length),
--			1 => to_signed(-3, POLY_COEFF(0)'length),
--			2 => to_signed(4, POLY_COEFF(0)'length),
--			3 => to_signed(-2, POLY_COEFF(0)'length),
--			4 => to_signed(1, POLY_COEFF(0)'length)
--		);

	-- TODO: Implement your Testbench here
	begin

	dut: polynom port map(
			clk=>clk,
			rst=>rst,
			x=>x,
			fx=>fx
	);	
	
	clk_gen: process
	begin
		clk	<= not clk;
		wait for CLK_PERIOD/2;
	end process clk_gen;
	
	stimuli: process
	begin
		rst	<= '0';
		wait for CLK_PERIOD;
		rst	<= '1';
		wait for CLK_PERIOD;
		rst	<= '0';
		wait for CLK_PERIOD;
		x <= 1;
		wait for CLK_PERIOD;
		x <= 2;
		wait for CLK_PERIOD;
		x <= 3;
		wait for 20000*CLK_PERIOD;
		assert false report "Simulation terminated!" severity failure;
	end process stimuli;
	
end;
