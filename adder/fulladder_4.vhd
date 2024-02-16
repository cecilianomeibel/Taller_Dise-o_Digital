library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladder_4 is
    port (
        a, b : in std_logic_vector(3 downto 0); -- Entradas de dos números de 4 bits
        Cin  : in std_logic;                   -- Entrada del acarreo de entrada
        sum4  : out std_logic_vector(6 downto 0); -- Salida de la suma de 4 bits
        Cout : out std_logic_vector(6 downto 0)                   -- Salida del acarreo de salida
    );
end fulladder_4;

architecture Behavioral of fulladder_4 is
    component fulladder_1 is
        port (
            a, b, Cin : in std_logic; -- Entradas de los bits a sumar y el acarreo de entrada
            sum1, Cout : out std_logic   -- Salidas de la suma y el acarreo de un solo bit
        );
    end component;
	 
	 component disp7seg is
		port (sum4 : in  STD_LOGIC_VECTOR (3 downto 0);
				seg : out  STD_LOGIC_VECTOR (6 downto 0)
		);
	 
	 end component;

    signal C1, C2, C3, C4 : std_logic; -- Señales para almacenar los acarreos intermedios
	 
	 signal result: std_logic_vector(3 downto 0); --Señal que guarda el resultado de la suma
	 
	 signal carry : std_logic_vector(3 downto 0); -- Señal para almacenar el carry de salida
	 
	 
begin
    -- Instancias de sumadores de un bit, conectados en cascada
    FA0: fulladder_1 port map (a(0), b(0), Cin, result(0), C1); -- Suma el bit menos significativo
    FA1: fulladder_1 port map (a(1), b(1), C1, result(1), C2); -- Suma el segundo bit con el acarreo anterior
    FA2: fulladder_1 port map (a(2), b(2), C2, result(2), C3); -- Suma el tercer bit con el acarreo anterior
    FA3: fulladder_1 port map (a(3), b(3), C3, result(3), C4); -- Suma el bit más significativo y obtiene el acarreo de salida
	 
	 carry <= "000" & C4;	--Guarda el carry de salida como un número de 4 bits
	 
	 
	 hex1: disp7seg port map(result, sum4); 
	 hex2: disp7seg port map(carry, Cout);
	 
end Behavioral;
