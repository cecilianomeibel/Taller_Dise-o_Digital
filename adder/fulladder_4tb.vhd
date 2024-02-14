library ieee;
use ieee.std_logic_1164.all;

entity fulladder_4tb is
end fulladder_4tb;

architecture Behavioral of fulladder_4tb is
    component fulladder_4 is
        port (
            a, b : in std_logic_vector(3 downto 0);  -- Entradas de dos números de 4 bits
            Cin  : in std_logic;                      -- Entrada del acarreo de entrada
            s  : out std_logic_vector(3 downto 0);    -- Salida de la suma de 4 bits
            Cout : out std_logic                     -- Salida del acarreo de salida
        );
    end component;

    signal a, b, s : std_logic_vector(3 downto 0);  -- Señales para los operandos y el resultado de la suma
    signal Cin, Cout : std_logic;                   -- Señales para el acarreo de entrada y salida
begin
    -- Instancia del diseño bajo prueba (DUT)
    DUT: fulladder_4 port map (a, b, Cin, s, Cout);

    -- Proceso para generar estímulos de entrada
    stimulus: process
    begin
        -- Primer conjunto de valores de entrada
        a <= "1000"; b <= "0111"; Cin <= '0'; wait for 10 ns;

        -- Segundo conjunto de valores de entrada
        a <= "0001"; b <= "0001"; Cin <= '0'; wait for 10 ns;

        -- Tercer conjunto de valores de entrada
        a <= "1111"; b <= "1111"; Cin <= '0'; wait for 10 ns;

        -- Cuarto conjunto de valores de entrada
        a <= "1010"; b <= "0110"; Cin <= '0'; wait for 10 ns;

        wait;  -- Espera indefinida
    end process stimulus;
end Behavioral;
