
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package adder_pkg is

    function fulladder (input1, input2,carry :std_logic) return std_logic_vector;
    function halfadder (input1, input2 :std_logic) return std_logic_vector;

end;

package body adder_pkg is

    function halfadder (input1, input2 :std_logic) return std_logic_vector is
        variable res :std_logic_vector(1 downto 0);
        variable and_res : std_logic;
        variable or_res : std_logic;
    begin
      and_res := input1 and input2;
      or_res := input1 or input2;
        if (and_res = '1') then
          res(1) := '1';
        else
          res(1) := '0';
        end if;
        if (or_res = '1') then
          res(0) := '1';
        else
          res(0) := '0';
        end if;

        return res;

    end function;

    function fulladder (input1, input2, carry :std_logic) return std_logic_vector is
        variable res  :std_logic_vector(1 downto 0);
        variable tmp_res : std_logic_vector(1 downto 0);
        variable tmp_res1 : std_logic_vector(1 downto 0);
    begin
        tmp_res := halfadder(input1,input2);
        tmp_res1 := halfadder(tmp_res(0),carry);
        res(1) := tmp_res(1) or tmp_res1(1);
        res(0) := tmp_res1(0);

        return res;

    end function;
end package body;
