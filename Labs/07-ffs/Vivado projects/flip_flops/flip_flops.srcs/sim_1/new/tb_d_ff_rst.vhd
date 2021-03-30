----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 15:49:40
-- Design Name: 
-- Module Name: tb_d_ff_arst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_d_ff_rst is
--  Port ( );
end tb_d_ff_rst;

architecture Behavioral of tb_d_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    signal s_clk                 :  STD_LOGIC;
    signal s_rst                 :  STD_LOGIC; 
    signal s_d                   :  STD_LOGIC; 
    signal s_q                   :  STD_LOGIC;
    signal s_q_bar               :  STD_LOGIC;

begin

    uut_d_ff_rst : entity work.d_ff_rst
    port map(
        clk    => s_clk,
        rst    => s_rst,
        d      => s_d,
        q      => s_q,
        q_bar  => s_q_bar
    );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
    
        s_rst <= '0';
        wait for 87 ns;
        
        s_rst <= '1';
        wait for 73 ns;
        
        s_rst <= '0';
        wait for 105 ns;
        
        s_rst <= '1';
        wait for 73 ns;
        
        s_rst <= '0';
        wait for 219 ns;
        
        s_rst <= '1';
        wait for 73 ns;
        
        s_rst <= '0';
        wait;      
    
    end process p_reset_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_d <= '0';
        wait for 48 ns;
        s_d <= '1';
        wait for 2 ns;
        assert(s_d = '1' and s_rst = '0' and s_q = '0' and s_q_bar = '1')
        report "Test failed for input 1 before rising edge" severity error;
        wait for 48 ns;
        s_d <= '0';
        wait for 50 ns;
        s_d <= '1';
        wait for 50 ns;
        -- 198 ns
        
        s_d <= '0';
        wait for 48 ns;
        s_d <= '1';
        wait for 22 ns;
        assert(s_d = '1' and s_rst = '1' and s_q = '0' and s_q_bar = '1')
        report "Test failed for reset 1 after rising edge" severity error;
        wait for 28 ns;
        s_d <= '0';
        wait for 50 ns;
        s_d <= '1';
        wait for 50 ns;
        --396 ns
        
        s_d <= '0';
        wait for 49 ns;
        s_d <= '1';
        wait for 50 ns;
        s_d <= '0';
        wait for 50 ns;
        s_d <= '1';
        wait for 15 ns;
        assert(s_d = '1' and s_rst = '1' and s_q = '1' and s_q_bar = '0')
        report "Test failed for reset 1 before rising edge" severity error;
        wait for 35 ns;
        -- 594 ns
        
        s_d <= '0';
        wait for 48 ns;
        s_d <= '1';
        wait for 50 ns;
        s_d <= '0';
        wait for 50 ns;
        s_d <= '1';
        wait for 50 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;
