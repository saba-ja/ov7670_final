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