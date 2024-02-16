library IEEE; use IEEE.STD_LOGIC_1164.all;

entity fulladder_1tb is

end entity;

architecture sim of fulladder_1tb is
	component fulladder_1
		port( a, b, Cin: in STD_LOGIC;
				sum1, Cout: out STD_LOGIC);
	end component;
	
	--Instanciando
	
	--Entradas
	signal a: STD_LOGIC:='0';
	signal b: STD_LOGIC:='0';
	signal Cin: STD_LOGIC:='0';
	
	--Salidas
	signal sum1: STD_LOGIC;
	signal Cout: STD_LOGIC;
	
begin

	--Conectando las señales de la instancia
	--uut: unit under test
	
	uut: fulladder_1 PORT MAP(
		a => a,
		b => b,
		Cin => Cin,
		sum1 => sum1,
		Cout => Cout
	);
	
	
	--Modelando la lógica
	entry_cases: process
	begin
	
		--Espera de 10 ns
		wait for 10 ns;
	
		--Casos de entrada
		Cin <= '0';
		a <= '1';
		b <= '0';
		wait for 10 ns;
		
		Cin <= '0';
		a <= '0';
		b <= '1';
		wait for 10 ns;
		
		Cin <= '0';
		a <= '1';
		b <= '1';
		wait for 10 ns;
		
		Cin <= '1';
		a <= '0';
		b <= '0';
		wait for 10 ns;
		
		Cin <= '1';
		a <= '1';
		b <= '0';
		wait for 10 ns;
		
		Cin <= '1';
		a <= '0';
		b <= '1';
		wait for 10 ns;
		
		Cin <= '1';
		a <= '1';
		b <= '1';
		wait for 10 ns;
		
	end process;
	
end architecture;
	
	
	
	
	
	
	
	
	
	