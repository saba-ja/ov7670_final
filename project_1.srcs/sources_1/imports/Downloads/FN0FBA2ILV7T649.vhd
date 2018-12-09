------------------------------------------------------------------------------------
---- Engineer: Mike Field <hamster@snap.net.nz>
---- 
---- Description: Generate analog 640x480 VGA, double-doublescanned from 19200 bytes of RAM
----
------------------------------------------------------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity vga is
--    GENERIC (MEM_ADDR_SIZE: INTEGER:=18);
--    Port ( 
--		clk25       : in  STD_LOGIC;
--		vga_red     : out STD_LOGIC_VECTOR(3 downto 0);
--		vga_green   : out STD_LOGIC_VECTOR(3 downto 0);
--		vga_blue    : out STD_LOGIC_VECTOR(3 downto 0);
--		vga_hsync   : out STD_LOGIC;
--		vga_vsync   : out STD_LOGIC;
--		frame_addr  : out STD_LOGIC_VECTOR(MEM_ADDR_SIZE downto 0);
--		frame_pixel : in  STD_LOGIC_VECTOR(11 downto 0)
--	 );
--end vga;

--architecture Behavioral of vga is
--   -- Timing constants
--   constant hRez       : natural := 320;--640;
--   constant hStartSync : natural := 640+16;
--   constant hEndSync   : natural := 640+16+96;
--   constant hMaxCount  : natural := 800;
	
--   constant vRez       : natural := 240;--480;
--   constant vStartSync : natural := 480+10;
--   constant vEndSync   : natural := 480+10+2;
--   constant vMaxCount  : natural := 480+10+2+33;
	
--	constant hsync_active : std_logic := '0';
--	constant vsync_active : std_logic := '0';

--   signal hCounter : unsigned( 9 downto 0) := (others => '0');
--   signal vCounter : unsigned( 9 downto 0) := (others => '0');
--	signal address  : unsigned(MEM_ADDR_SIZE downto 0) := (others => '0');
--	signal blank    : std_logic := '1';

--begin
--	frame_addr <= std_logic_vector(address);
	
--   process(clk25)
--   begin
--		if rising_edge(clk25) then
--			-- Count the lines and rows  
--			-------------------    
--                if hCounter = hMaxCount-1 then
--                    hCounter <= (others => '0');
--                    if vCounter = vMaxCount-1 then
--                        vCounter <= (others => '0');
--                         blank <= '0';
--                    else
--                        vCounter <= vCounter+1;
--                    end if;
--                else
--                    hCounter <= hCounter+1;
--                end if;
--            -------------------
--			if blank = '0' then
--				vga_red   <= frame_pixel(11 downto 8);
--				vga_green <= frame_pixel( 7 downto 4);
--				vga_blue  <= frame_pixel( 3 downto 0);
--				address <= address+1;
--			else
--				vga_red   <= (others => '0');
--				vga_green <= (others => '0');
--				vga_blue  <= (others => '0');
--			end if;
--	       -------------------
	       
--			if vCounter  >= vRez-1 then
--				blank <= '1';
--				address <= (others => '0');
--			else 
--				if hCounter  < hRez-1 then
--					blank <= '0';
--				else
--					blank <= '1';
--				end if;
--			end if;
	
--			-- Are we in the hSync pulse? (one has been added to include frame_buffer_latency)
--			if hCounter > hStartSync and hCounter <= hEndSync then
--				vga_hSync <= hsync_active;
--			else
--				vga_hSync <= not hsync_active;
--			end if;

--			-- Are we in the vSync pulse?
--			if vCounter >= vStartSync and vCounter < vEndSync then
--				vga_vSync <= vsync_active;
--			else
--				vga_vSync <= not vsync_active;
--			end if;
--		end if;
--	end process;
--end Behavioral;


----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity VGA is
    Port ( CLK25 : in  STD_LOGIC;									-- Horloge d'entrée de 25 MHz							
			  clkout : out  STD_LOGIC;					-- Horloge de sortie vers le ADV7123 et l'écran TFT
           
           Hsync,Vsync : out  STD_LOGIC;						-- les deux signaux de synchronisation pour l'écran VGA
		
           activeArea : out  STD_LOGIC);
		
end VGA;

architecture Behavioral of VGA is
signal Hcnt:STD_LOGIC_VECTOR(9 downto 0):="0000000000";		-- pour le comptage des colonnes
signal Vcnt:STD_LOGIC_VECTOR(9 downto 0):="1000001000";		-- pour le comptage des lignes
signal video:STD_LOGIC;
constant HM: integer :=799;	--la taille maximale considéré 800 (horizontal)
constant HD: integer :=640;	--la taille de l'écran (horizontal)
constant HF: integer :=16;		--front porch
constant HB: integer :=48;		--back porch
constant HR: integer :=96;		--sync time
constant VM: integer :=524;	--la taille maximale considéré 525 (vertical)	
constant VD: integer :=480;	--la taille de l'écran (vertical)
constant VF: integer :=10;		--front porch
constant VB: integer :=33;		--back porch
constant VR: integer :=2;		--retrace
signal rez_160x120 : std_logic;
signal rez_320x240 : std_logic;
begin
rez_160x120 <= '0';
rez_320x240 <= '1';
-- initialisation d'un compteur de 0 à 799 (800 pixel par ligne):
-- à chaque front d'horloge en incrémente le compteur de colonnes
-- c-a-d du 0 à 799.
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

-- génération du signal de synchronisation horizontale Hsync:
	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Hcnt >= (HD+HF) and Hcnt <= (HD+HF+HR-1)) then   --- Hcnt >= 656 and Hcnt <= 751
					Hsync <= '0';
				else
					Hsync <= '1';
				end if;
			end if;
		end process;
----------------------------------------------------------------

-- génération du signal de synchronisation verticale Vsync:
	process(CLK25)
		begin
			if (CLK25'event and CLK25='1') then
				if (Vcnt >= (VD+VF) and Vcnt <= (VD+VF+VR-1)) then  ---Vcnt >= 490 and vcnt<= 491
					Vsync <= '0';
				else
					Vsync <= '1';
				end if;
			end if;
		end process;
----------------------------------------------------------------
video <= '1' when (Hcnt < HD) and (Vcnt < VD)			-- c'est pour utiliser la résolution complète 640 x 480	
	      else '0';
		
end Behavioral;
