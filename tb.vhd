--------------------------------------------------------------------------------
-- Company: Christopher Hicks	
-- Engineer: University of Birmingham
--
-- Create Date:   14:49:01 10/23/2014
-- Design Name:   Test bench for Lab3 
-- Module Name:   Y:/designs/lab1/tb.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nx3_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nx3_top
    PORT(
         clk : IN  std_logic;
         buttons : IN  std_logic_vector(4 downto 0);
         switches : IN  std_logic_vector(7 downto 0);
         leds : OUT  std_logic_vector(7 downto 0);
         digit : OUT  std_logic_vector(3 downto 0);
         segments : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal buttons : std_logic_vector(4 downto 0) := (others => '0');
   signal switches : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal leds : std_logic_vector(7 downto 0);
   signal digit : std_logic_vector(3 downto 0);
   signal segments : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nx3_top PORT MAP (
          clk => clk,
          buttons => buttons,
          switches => switches,
          leds => leds,
          digit => digit,
          segments => segments
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ms.
      --wait for 100 ms;	

      wait for clk_period*10;

      -- insert stimulus here 
			switches(3 downto 0) <= "0010";
			switches(7 downto 4) <= "0100";
			wait for 50ns;
			switches(3 downto 0) <= "0011";
			switches(7 downto 4) <= "0001";
      wait;
   end process;

END;