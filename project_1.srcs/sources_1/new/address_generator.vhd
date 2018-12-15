
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Address_Generator is
    GENERIC (MEM_ADDR_SIZE : INTEGER := 18);
    Port ( 	CLK25,enable : in  STD_LOGIC;								
            vsync        : in  STD_LOGIC;
    		address 		 : out STD_LOGIC_VECTOR (MEM_ADDR_SIZE  downto 0));
end Address_Generator;

architecture Behavioral of Address_Generator is
   signal val: STD_LOGIC_VECTOR(address'range):= (others => '0');		
   signal rez_160x120  : std_logic;
   signal rez_320x240  : std_logic;
   
begin
rez_160x120<= '0';
 rez_320x240 <= '1';
	address <= val;																		

	process(CLK25)
		begin
         if rising_edge(CLK25) then
            if (enable='1') then													
               if rez_160x120 = '1' then
                  if (val < 160*120) then													
                     val <= val + 1 ;
                  end if;
               elsif rez_320x240 = '1' then
                  if (val < 320*240) then													
                     val <= val + 1 ;
                  end if;
               else
                  if (val < 640*480) then													
                     val <= val + 1 ;
                  end if;
               end if;
				end if;
            if vsync = '0' then 
               val <= (others => '0');
            end if;
			end if;	
		end process;
end Behavioral;
