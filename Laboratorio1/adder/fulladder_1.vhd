library IEEE; use IEEE.STD_LOGIC_1164.all;

entity fulladder_1 is

	port(a : in STD_LOGIC; 					-- Entrada del primer número de 4 bits
		  b : in STD_LOGIC; 					-- Entrada del segundo número de 4 bits
		  Cin : in STD_LOGIC;				-- Acarreo de entrada
			sum1, Cout: out STD_LOGIC);	-- Resultado de la suma y acarreo de salida
			
end;

architecture synth of fulladder_1 is

	signal p, g: STD_LOGIC; --Variables internas
	
begin
	
	--p y g permiten reducir el procedimiento matemático de las salidas
	
	p <= a xor b; --p es la suma (a+b)
	
	g <= a and b; -- g es la multiplicación (a*b)
	
	--Salidas
	
	sum1 <= p xor Cin; --suma de (p+Cin)
	
	Cout <= g or (p and Cin); -- Solución g+(p*Cin)
	
end;