library ieee;
use ieee.std_logic_1164.all;

entity fulladder_4 is
    port (
        a, b : in std_logic_vector(3 downto 0); -- Entradas de dos números de 4 bits
        Cin  : in std_logic;                   -- Entrada del acarreo de entrada
        s  : out std_logic_vector(3 downto 0); -- Salida de la suma de 4 bits
        Cout : out std_logic                   -- Salida del acarreo de salida
    );
end fulladder_4;

architecture Behavioral of fulladder_4 is
    component fulladder_1 is
        port (
            a, b, Cin : in std_logic; -- Entradas de los bits a sumar y el acarreo de entrada
            s, Cout : out std_logic   -- Salidas de la suma y el acarreo de un solo bit
        );
    end component;

    signal C : std_logic_vector(3 downto 0); -- Señal para almacenar los acarreos intermedios
begin
    -- Instancias de sumadores de un bit, conectados en cascada
    FA0: fulladder_1 port map (a(0), b(0), Cin, s(0), C(0)); -- Suma el bit menos significativo
    FA1: fulladder_1 port map (a(1), b(1), C(0), s(1), C(1)); -- Suma el segundo bit con el acarreo anterior
    FA2: fulladder_1 port map (a(2), b(2), C(1), s(2), C(2)); -- Suma el tercer bit con el acarreo anterior
    FA3: fulladder_1 port map (a(3), b(3), C(2), s(3), Cout); -- Suma el bit más significativo y obtiene el acarreo de salida
end Behavioral;
