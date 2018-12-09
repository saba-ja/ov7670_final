library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ov7670_capture is
    GENERIC (MEM_ADDR_SIZE : INTEGER := 18);
    Port ( pclk  : in   STD_LOGIC;
           vsync : in   STD_LOGIC;
           href  : in   STD_LOGIC;
           d     : in   STD_LOGIC_VECTOR (7 downto 0);
           addr  : out  STD_LOGIC_VECTOR (MEM_ADDR_SIZE downto 0);
           dout  : out  STD_LOGIC_VECTOR (11 downto 0);
           we    : out  STD_LOGIC);
end ov7670_capture;

architecture Behavioral of ov7670_capture is
   signal d_latch      : std_logic_vector(15 downto 0) := (others => '0');
   signal address      : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
   signal address_next : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
   signal wr_hold      : std_logic_vector(1 downto 0)  := (others => '0');
   signal counter         : std_logic_vector(1 downto 0)  := (others => '0');
   signal we_reg : std_logic := '0';
begin
--   addr <= address(MEM_ADDR_SIZE downto 0);
   process(pclk)
   begin
      if rising_edge(pclk) then
         -- This is a bit tricky href starts a pixel transfer that takes 3 cycles
         --        Input   | state after clock tick   
         --         href   | wr_hold    d_latch           d                 we address  address_next
         -- cycle -1  x    |    xx      xxxxxxxxxxxxxxxx  xxxxxxxxxxxxxxxx  x   xxxx     xxxx
         -- cycle 0   1    |    x1      xxxxxxxxRRRRRGGG  xxxxxxxxxxxxxxxx  x   xxxx     addr
         -- cycle 1   0    |    10      RRRRRGGGGGGBBBBB  xxxxxxxxRRRRRGGG  x   addr     addr
         -- cycle 2   x    |    0x      GGGBBBBBxxxxxxxx  RRRRRGGGGGGBBBBB  1   addr     addr+1

         if vsync = '1' then 
            address <= (others => '0');
            address_next <= (others => '0');
            wr_hold <= (others => '0');
            counter <= (others => '0');
         else
         case counter is
                     when "00"   => counter <= "01";
                     when "01"   => counter <= "10";
                     when "10"   => counter <= "11";
                     when others => counter <= "00";
                  end case;
            if counter(1) = '1' then
                we_reg <= '1';
            else
                we_reg <= '0';
            end if;
            if we_reg = '1' then
                dout    <= d_latch(10 downto 7)& d_latch(15 downto 12) & d_latch(4 downto 1); 
                address <= address_next;
                we      <= wr_hold(1);
                addr <= address(MEM_ADDR_SIZE downto 0);
            end if;
            wr_hold <= wr_hold(0) & (href and not wr_hold(0));
            d_latch <= d_latch( 7 downto  0) & d;

            if wr_hold(1) = '1' then
                if we_reg = '1' then
                    address_next <= std_logic_vector(unsigned(address_next)+1);
                end if;
            end if;

         end if;
      end if;
   end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
-- 
-- Description: Captures the pixels coming from the OV7670 camera and 
--              Stores them in block RAM
--
-- The length of href last controls how often pixels are captive - (2 downto 0) stores
-- one pixel every 4 cycles.
--
-- "line" is used to control how often data is captured. In this case every forth 
-- line
----------------------------------------------------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity ov7670_capture is
--GENERIC (MEM_ADDR_SIZE: INTEGER := 18);
--    Port ( pclk  : in   STD_LOGIC;
--           vsync : in   STD_LOGIC;
--           href  : in   STD_LOGIC;
--           d     : in   STD_LOGIC_VECTOR (7 downto 0);
--           addr  : out  STD_LOGIC_VECTOR (MEM_ADDR_SIZE downto 0);
--           dout  : out  STD_LOGIC_VECTOR (11 downto 0);
--           we    : out  STD_LOGIC);
--end ov7670_capture;

--architecture Behavioral of ov7670_capture is
--   signal d_latch      : std_logic_vector(15 downto 0) := (others => '0');
--   signal address      : STD_LOGIC_VECTOR(MEM_ADDR_SIZE downto 0) := (others => '0');
--   signal line         : std_logic_vector(1 downto 0)  := (others => '0');
--   signal href_last    : std_logic_vector(6 downto 0)  := (others => '0');
--   signal we_reg       : std_logic := '0';
--   signal href_hold    : std_logic := '0';
--   signal latched_vsync : STD_LOGIC := '0';
--   signal latched_href  : STD_LOGIC := '0';
--   signal latched_d     : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
--   signal rez_160x120 :  std_logic;
--   signal rez_320x240 :  std_logic;
--   signal wr_hold      : std_logic_vector(1 downto 0)  := (others => '0');
--begin
--rez_160x120<= '0';
--rez_320x240<= '1';
--   addr <= address;
--   we <= we_reg;
--   dout    <= d_latch(10 downto 7)& d_latch(15 downto 12) & d_latch(4 downto 1); 
   
--capture_process: process(pclk)
--   begin
--      if rising_edge(pclk) then
--         if we_reg = '1' then
--            address <= std_logic_vector(unsigned(address)+1);
--         end if;

--         -- This is a bit tricky href starts a pixel transfer that takes 3 cycles
--         --        Input   | state after clock tick   
--         --         href   | wr_hold    d_latch           dout                we address  address_next
--         -- cycle -1  x    |    xx      xxxxxxxxxxxxxxxx  xxxxxxxxxxxx  x   xxxx     xxxx
--         -- cycle 0   1    |    x1      xxxxxxxxRRRRRGGG  xxxxxxxxxxxx  x   xxxx     addr
--         -- cycle 1   0    |    10      RRRRRGGGGGGBBBBB  xxxxxxxxxxxx  x   addr     addr
--         -- cycle 2   x    |    0x      GGGBBBBBxxxxxxxx  RRRRGGGGBBBB  1   addr     addr+1

--         -- detect the rising edge on href - the start of the scan line
--         if href_hold = '0' and latched_href = '1' then
--            case line is
--               when "00"   => line <= "01";
--               when "01"   => line <= "10";
--               when "10"   => line <= "11";
--               when others => line <= "00";
--            end case;
--         end if;
--         href_hold <= latched_href;
         
--         -- capturing the data from the camera, 12-bit RGB
--         if latched_href = '1' then
--            d_latch <= d_latch( 7 downto 0) & latched_d;
--         end if;
--         we_reg  <= '0';

--         -- Is a new screen about to start (i.e. we have to restart capturing
--         if latched_vsync = '1' then 
--            address      <= (others => '0');
--            href_last    <= (others => '0');
--            line         <= (others => '0');
--         else
--            -- If not, set the write enable whenever we need to capture a pixel
--            if (rez_160x120 = '1' and href_last(6) = '1') or
--               (rez_320x240 = '1' and href_last(2) = '1') or 
--               (rez_160x120 = '0' and rez_320x240  = '0' and href_last(0) = '1') then
               
--               if rez_160x120 = '1' then
--                  if line = "10" then
--                     we_reg <= '1';
--                   end if;
--               elsif rez_320x240 = '1' then
--                  if line(1) = '1' then
--                     we_reg <= '1';
--                   end if;
--               else
--                   we_reg <= '1';
--               end if;
--               href_last <= (others => '0');
--            else
--               href_last <= href_last(href_last'high-1 downto 0) & latched_href;
--            end if;
--         end if;
--      end if;
--      if falling_edge(pclk) then
--         latched_d     <= d;
--         latched_href  <= href;
--         latched_vsync <= vsync;
--      end if;
--   end process;
--end Behavioral;