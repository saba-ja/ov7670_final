library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VGA is
    Port ( CLK25 : in  STD_LOGIC;						
           clkout : out  STD_LOGIC;					
           Hsync,Vsync : out  STD_LOGIC;						
           activeArea : out  STD_LOGIC);
end VGA;

architecture Behavioral of VGA is
signal Hcnt:STD_LOGIC_VECTOR(9 downto 0):="0000000000";		
signal Vcnt:STD_LOGIC_VECTOR(9 downto 0):="1000001000";		
signal video:STD_LOGIC;
constant HM: integer :=799;	
constant HD: integer :=640;	
constant HF: integer :=16;	
constant HB: integer :=48;	
constant HR: integer :=96;	
constant VM: integer :=524;		
constant VD: integer :=480;	
constant VF: integer :=10;	
constant VB: integer :=33;	
constant VR: integer :=2;	
signal rez_160x120 : std_logic;
signal rez_320x240 : std_logic;
begin
rez_160x120 <= '0';
rez_320x240 <= '1';
	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Hcnt = HM) then
					Hcnt <= "0000000000";
               if (Vcnt= VM) then
                  Vcnt <= "0000000000";
                  activeArea <= '1';
               else
                  if rez_160x120 = '1' then
                     if vCnt < 120-1 then
                        activeArea <= '1';
                     end if;
                  elsif rez_320x240 = '1' then
                     if vCnt < 240-1 then
                        activeArea <= '1';
                     end if;
                  else
                     if vCnt < 480-1 then
                        activeArea <= '1';
                     end if;
                  end if;
                  Vcnt <= Vcnt+1;
               end if;
				else
               if rez_160x120 = '1' then
                  if hcnt = 160-1 then
                     activeArea <= '0';
                  end if;
               elsif rez_320x240 = '1' then
                  if hcnt = 320-1 then
                     activeArea <= '0';
                  end if;
               else
                  if hcnt = 640-1 then
                     activeArea <= '0';
                  end if;
               end if;
					Hcnt <= Hcnt + 1;
				end if;
			end if;
		end process;
----------------------------------------------------------------


	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Hcnt >= (HD+HF) and Hcnt <= (HD+HF+HR-1)) then   
					Hsync <= '0';
				else
					Hsync <= '1';
				end if;
			end if;
		end process;
----------------------------------------------------------------

	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Vcnt >= (VD+VF) and Vcnt <= (VD+VF+VR-1)) then  
					Vsync <= '0';
				else
					Vsync <= '1';
				end if;
			end if;
		end process;
----------------------------------------------------------------
video <= '1' when (Hcnt < HD) and (Vcnt < VD)
	      else '0';
		
end Behavioral;
