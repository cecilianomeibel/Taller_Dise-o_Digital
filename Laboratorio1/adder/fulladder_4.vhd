library ieee;
use ieee.std_logic_1164.all;

entity fulladder_4 is
    port (
        a: in std_logic_vector(3 downto 0); 			-- Entrada del primer número de 4 bits
		  b: in std_logic_vector(3 downto 0); 			-- Entrada del segundo número de 4 bits
        Cin  : in std_logic;                   		-- Acarreo de entrada
        sum4  : out std_logic_vector(6 downto 0); 	-- Salida de la suma de 4 bits
        Cout : out std_logic_vector(6 downto 0) );  -- Salida del acarreo de salida
end fulladder_4;

architecture Structural of fulladder_4 is

	-- Instancia para utilizar el sumador de un 1-bit
    component fulladder_1 is
	 
        port (
            a : in std_logic; 
				b : in std_logic;
				Cin : in std_logic;
            sum1 : out std_logic;
				Cout: out std_logic );
        
    end component;
	 
	 component disp7seg is
	 
		port (b_num : in  STD_LOGIC_VECTOR (3 downto 0);
				seg : out  STD_LOGIC_VECTOR (6 downto 0) );
	 
	 end component;
	 
	 signal C_int : std_logic_vector(3 downto 0); 		-- Vector para almacenar los acarreos intermedios
	 
	 signal result: std_logic_vector(3 downto 0); 		--Señal que guarda el resultado de la suma
	 
	 signal f_carry : std_logic_vector(3 downto 0); 	-- Señal para almacenar el carry de salida
	 
	 
begin
    -- Instancias de sumadores de un bit, conectados en cascada
    FA0: fulladder_1 port map (a(0), b(0), Cin, result(0), C_int(0)); -- Suma el bit menos significativo
    FA1: fulladder_1 port map (a(1), b(1), C_int(0), result(1), C_int(1)); -- Suma el segundo bit con el acarreo anterior
    FA2: fulladder_1 port map (a(2), b(2), C_int(1), result(2), C_int(2)); -- Suma el tercer bit con el acarreo anterior
    FA3: fulladder_1 port map (a(3), b(3), C_int(2), result(3), C_int(3)); -- Suma el bit más significativo y obtiene el acarreo de salida
	 
	 f_carry <= "000" & C_int(3);	--Guarda el carry de salida como un número de 4 bits
	 
	 --Conversor de las salidas a números de 7 bits correspondientes
	 --a cada segmento de los display utilizados
	 
	 hex1: disp7seg port map(result, sum4);  --Convierte el resultado de la suma en un número de 7 bits 
	 hex2: disp7seg port map(f_carry, Cout);	  --Convierte el carry final en un número de 7 bits 
	 
end Structural;
