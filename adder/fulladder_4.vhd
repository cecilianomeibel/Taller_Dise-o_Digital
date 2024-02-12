library IEEE; use IEEE.STD_LOGIC_1164.all;

entity fulladder_4 is
	port(a: in STD_LOGIC_VECTOR(3 downto 0); --Entrada "a" de 4 bits
		  b: in STD_LOGIC_VECTOR(3 downto 0); --Entrada "b" de 4 bits
		  Cin: in STD_LOGIC;						  --Bit de acarreo de entrada
		  s: out STD_LOGIC_VECTOR (4 downto 0); --Salida
		  Cout: out STD_LOGIC);
end entity;

architecture Behavioral of fulladder_4 is
	component fulladder_1 is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               Cin : in STD_LOGIC;
               s : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
	 
	 signal Cout_1, Cout_2, Cout_3 : std_logic;
    signal s_1, s_2, s_3 : std_logic_vector(1 downto 0);
	 
begin
    -- Sumador de 1 bit
    Adder_1 : fulladder_1 port map (a(0), b(0), Cin, s_1(0), Cout_1);
    Adder_2 : fulladder_1 port map (a(1), b(1), Cout_1, s_1(1), Cout_2);
    Adder_3 : fulladder_1 port map (a(2), b(2), Cout_2, s_2(0), Cout_3);
    Adder_4 : fulladder_1 port map (a(3), b(3), Cout_3, s_2(1), Cout);

    -- Salida de la suma de 4 bits
    s(3) <= s_3(1);
    s(2) <= s_3(0);
    s(1 downto 0) <= s_2;
end Behavioral;