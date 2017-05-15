
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use work.adder_pkg.all;

entity Multiplication is
  port(
    x : in std_logic_vector (3 downto 0);
    y : in std_logic_vector (3 downto 0);
    result : out std_logic_vector (7 downto 0)
    );
end entity;

architecture RTL of Multiplication is

  signal a0b0,a0b1,a0b2,a0b3,a1b0,a1b1,a1b2,a1b3,a2b0,a2b1,a2b2,a2b3,a3b0,a3b1,a3b2,a3b3 : std_logic;
  signal h1,h2,h3,h4,f1,f2,f3,f4,f5,f6,f7,f8 : std_logic_vector(1 downto 0);
  begin
      a0b0 <= x(0) and y(0);
a0b1 <= x(0) and y(1);
a0b2 <= x(0) and y(2);
a0b3 <= x(0) and y(3);
a1b0 <= x(1) and y(0);
a1b1 <= x(1) and y(1);
a1b2 <= x(1) and y(2);
a1b3 <= x(1) and y(3);
a2b0 <= x(2) and y(0);
a2b1 <= x(2) and y(1);
a2b2 <= x(2) and y(2);
a2b3 <= x(2) and y(3);
a3b0 <= x(3) and y(0);
a3b1 <= x(3) and y(1);
a3b2 <= x(3) and y(2);
a3b3 <= x(3) and y(3);
      h1 <= halfadder(a0b1,a1b0);
      h2 <= halfadder(a1b1,a0b2);
      h3 <= halfadder(a1b2,a0b3);
      f1 <= fulladder(a2b0,h1(1),h2(0));
      f2 <= fulladder(a2b1,h2(1),h3(0));
      f3 <= fulladder(a2b2,h3(1),a1b3);
      f4 <= fulladder(a3b0,f1(1),f2(0));
      f5 <= fulladder(a3b1,f2(1),f3(0));
      f6 <= fulladder(a3b2,f3(1),a2b3);
      h4 <= halfadder(f4(1),f5(0));
      f7 <= fulladder(h4(1),f5(1),f6(0));
      f8 <= fulladder(f7(1),f6(1),a3b3);
      result(0) <= a0b0;
      result(1) <= h1(0);
      result(2) <= f1(0);
      result(3) <= f4(0);
      result(4) <= h4(0);
      result(5) <= f7(0);
      result(6) <= f8(0);
      result(7) <= f8(1);
end architecture;
