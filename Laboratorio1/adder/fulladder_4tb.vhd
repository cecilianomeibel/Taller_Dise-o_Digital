library ieee;
use ieee.std_logic_1164.all;

entity fulladder_4tb is
end fulladder_4tb;

architecture Behavioral of fulladder_4tb is
    component fulladder_4 is
        port (
            a, b : in std_logic_vector(3 downto 0);  -- Entradas de dos números de 4 bits
            Cin  : in std_logic;                      -- Entrada del acarreo de entrada
            sum4  : out std_logic_vector(6 downto 0);    -- Salida de la suma de 4 bits
            Cout : out std_logic_vector(6 downto 0)      -- Salida del acarreo de salida
        );
    end component;

    signal a, b : std_logic_vector(3 downto 0) := (others => '0');
    signal Cin : std_logic := '0';                   
	 signal sum4 : std_logic_vector(6 downto 0);
	 signal Cout : std_logic_vector(6 downto 0);
	 
begin
    -- Instancia del diseño bajo prueba (DUT)
    DUT: fulladder_4 port map (a => a, b => b, Cin => Cin, sum4 => sum4, Cout => Cout);

    -- Proceso para generar estímulos de entrada
    stimulus: process
    begin
        -- Primer conjunto de valores de entrada
        a <= "0000"; b <= "0000"; wait for 10 ns;

        -- Segundo conjunto de valores de entrada
        a <= "0001"; b <= "0001";  wait for 10 ns;

        -- Tercer conjunto de valores de entrada
        a <= "0101"; b <= "1111";  wait for 10 ns;

        -- Cuarto conjunto de valores de entrada
        a <= "1010"; b <= "0110";  wait for 10 ns;

        wait;  -- Espera indefinida
    end process stimulus;
end Behavioral;
