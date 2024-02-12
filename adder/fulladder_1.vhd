library IEEE; use IEEE.STD_LOGIC_1164.all;

entity fulladder_1 is
	port(a, b, Cin: in STD_LOGIC;
			s, Cout: out STD_LOGIC);
end;

architecture synth of fulladder_1 is
	signal p, g: STD_LOGIC;
	
begin
	--p y g permiten reducir el procedimiento matemático de las salidas
	p <= a xor b;
	
	g <= a and b;
	
	--Salidas
	s <= p xor Cin;
	
	Cout <= g or (p and Cin);
	
end;