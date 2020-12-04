-- File: pwm_less_simple.vhd
-- Generated by MyHDL 0.11
-- Date: Wed Dec  2 18:44:17 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;

use work.pck_myhdl_011.all;

entity pwm_less_simple is
    port (
        clk_i: in std_logic;
        pwm_o: out std_logic;
        threshold: in unsigned(7 downto 0)
    );
end entity pwm_less_simple;
-- Inputs:
--     clk_i: PWM changes state on the rising edge of this clock input.
--     threshold: Determines when output goes low.
--     duration: The length of the total pulse duration as determined by the counter.
-- Outputs:
--     pwm_o: PWM output starts and stays high until counter > threshold and then output goes low.

architecture MyHDL of pwm_less_simple is



signal cnt: unsigned(7 downto 0);

begin




PWM_LESS_SIMPLE_LOC_INSTS_CHUNK_INSTS_0: process (clk_i) is
begin
    if rising_edge(clk_i) then
        cnt <= (cnt + 1);
        if (signed(resize(cnt, 9)) = (227 - 1)) then
            cnt <= to_unsigned(0, 8);
        end if;
    end if;
end process PWM_LESS_SIMPLE_LOC_INSTS_CHUNK_INSTS_0;


pwm_o <= stdl(cnt < threshold);

end architecture MyHDL;
