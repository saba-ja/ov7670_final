library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main_project_top is
    Port ( 
		GCLK_100         : in    STD_LOGIC;
		OV7670_SIOC_1  : out   STD_LOGIC;
		OV7670_SIOD_1  : inout STD_LOGIC;
		OV7670_RESET_1 : out   STD_LOGIC;
		OV7670_PWDN_1  : out   STD_LOGIC;
		OV7670_VSYNC_1 : in    STD_LOGIC;
		OV7670_HREF_1  : in    STD_LOGIC;
		OV7670_PCLK_1  : in    STD_LOGIC;
		OV7670_XCLK_1  : out   STD_LOGIC;
		OV7670_D_1     : in    STD_LOGIC_VECTOR(7 downto 0);

		OV7670_SIOC_2  : out   STD_LOGIC;
		OV7670_SIOD_2  : inout STD_LOGIC;
		OV7670_RESET_2 : out   STD_LOGIC;
		OV7670_PWDN_2  : out   STD_LOGIC;
		OV7670_VSYNC_2 : in    STD_LOGIC;
		OV7670_HREF_2  : in    STD_LOGIC;
		OV7670_PCLK_2  : in    STD_LOGIC;
		OV7670_XCLK_2  : out   STD_LOGIC;
		OV7670_D_2     : in    STD_LOGIC_VECTOR(7 downto 0);

		LED          : out    STD_LOGIC_VECTOR(7 downto 0);

		vga_red      : out   STD_LOGIC_VECTOR(3 downto 0);
		vga_green    : out   STD_LOGIC_VECTOR(3 downto 0);
		vga_blue     : out   STD_LOGIC_VECTOR(3 downto 0);
		vga_hsync    : out   STD_LOGIC;
		vga_vsync    : out   STD_LOGIC;
		
		btn 		    : in    STD_LOGIC;
		SW           : in    STD_LOGIC_VECTOR(7 downto 0)
	 );
end main_project_top;

architecture Behavioral of main_project_top is

CONSTANT MEM_ADDR_SIZE: INTEGER := 17;

COMPONENT ov7670_top
    GENERIC (MEM_ADDR_SIZE: INTEGER := 18);
    Port ( 
		clk100        : in    STD_LOGIC;
        clk50 : in STD_LOGIC;
        clk25 : in STD_LOGIC;
        OV7670_SIOC  : out   STD_LOGIC;
        OV7670_SIOD  : inout STD_LOGIC;
        OV7670_RESET : out   STD_LOGIC;
        OV7670_PWDN  : out   STD_LOGIC;
        OV7670_VSYNC : in    STD_LOGIC;
        OV7670_HREF  : in    STD_LOGIC;
        OV7670_PCLK  : in    STD_LOGIC;
        OV7670_XCLK  : out   STD_LOGIC;
        OV7670_D     : in    STD_LOGIC_VECTOR(7 downto 0);
        btn             : in    STD_LOGIC;
        LED          : out    STD_LOGIC;
    
        pixel_clk : OUT STD_LOGIC;
        ram_addr  : OUT std_logic_vector(MEM_ADDR_SIZE downto 0);
        pixel_out : OUT std_logic_vector(11 downto 0);
        ram_we    : OUT std_logic
	 );
end COMPONENT;

COMPONENT blk_mem_gen_0
 PORT (
     clka  : IN  STD_LOGIC;
     wea   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
     addra : IN  STD_LOGIC_VECTOR(MEM_ADDR_SIZE DOWNTO 0);
     dina  : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
     clkb  : IN  STD_LOGIC;
     addrb : IN  STD_LOGIC_VECTOR(MEM_ADDR_SIZE DOWNTO 0);
     doutb : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
 );
 END COMPONENT;

COMPONENT blk_mem_gen_1
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(MEM_ADDR_SIZE DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(MEM_ADDR_SIZE DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;

component clk_wiz_0
 port
  (-- Clock in ports
   -- Clock out ports
   clk_out1          : out    std_logic;
   clk_out2          : out    std_logic;
   clk_out3          : out    std_logic;
   -- Status and control signals
   clk_in1           : in     std_logic
  );
 end component;
 

 
 
 	COMPONENT VGA
    PORT(
     CLK25 : IN std_logic;    
     Hsync : OUT std_logic;
     Vsync : OUT std_logic;
     activeArea : OUT std_logic
     );
 END COMPONENT;
 

	COMPONENT Address_Generator
	GENERIC (MEM_ADDR_SIZE: INTEGER := 18);
	PORT(
		CLK25       : IN  std_logic;
		enable      : IN  std_logic;       
        vsync       : in  STD_LOGIC;
		address     : OUT std_logic_vector(MEM_ADDR_SIZE downto 0)
		);
	END COMPONENT;

SIGNAL vga_red_internal_1      :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_green_internal_1    :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_blue_internal_1     :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_hsync_internal_1    :  STD_LOGIC;
SIGNAL vga_vsync_internal_1    :  STD_LOGIC;

SIGNAL vga_red_internal_2      :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_green_internal_2    :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_blue_internal_2     :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_hsync_internal_2    :  STD_LOGIC;
SIGNAL vga_vsync_internal_2    :  STD_LOGIC;

SIGNAL vga_red_int      :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_green_int    :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_blue_int     :  STD_LOGIC_VECTOR(3 downto 0);
SIGNAL vga_hsync_int    :  STD_LOGIC;
SIGNAL vga_vsync_int    :  STD_LOGIC;

SIGNAL clk_100_internal : STD_LOGIC;
SIGNAL clk_50_internal : STD_LOGIC;
SIGNAL clk_25_internal : STD_LOGIC;

SIGNAL pixel_clk_int : STD_LOGIC:='0';
SIGNAL ram_addr_int  : std_logic_vector(MEM_ADDR_SIZE downto 0):= (others =>'0');
SIGNAL pixel_out_int : std_logic_vector(11 downto 0):= (others =>'0');
SIGNAL ram_we_int    : std_logic_vector(0 downto 0):= (others =>'0');

SIGNAL pixel_clk_cam_1 : STD_LOGIC:='0';
SIGNAL ram_addr_cam_1  : std_logic_vector(MEM_ADDR_SIZE downto 0):= (others =>'0');
SIGNAL pixel_out_cam_1 : std_logic_vector(11 downto 0):= (others =>'0');
SIGNAL ram_we_cam_1    : std_logic_vector(0 downto 0):= (others =>'0');

SIGNAL pixel_clk_cam_2 : STD_LOGIC:= '0';
SIGNAL ram_addr_cam_2  : std_logic_vector(MEM_ADDR_SIZE downto 0):= (others =>'0');
SIGNAL pixel_out_cam_2 : std_logic_vector(11 downto 0):= (others =>'0');
SIGNAL ram_we_cam_2    : std_logic_vector(0 downto 0):= (others =>'0');

SIGNAL frame_addr      : std_logic_vector(MEM_ADDR_SIZE downto 0):= (others =>'0');
SIGNAL frame_pixel     : std_logic_vector(11 downto 0):= (others =>'0');

SIGNAL frame_addr_cam_1      : std_logic_vector(MEM_ADDR_SIZE downto 0):= (others =>'0');
SIGNAL frame_pixel_cam_1     : std_logic_vector(11 downto 0):= (others =>'0');


SIGNAL frame_addr_cam_2      : std_logic_vector(MEM_ADDR_SIZE downto 0):= (others =>'0');
SIGNAL frame_pixel_cam_2     : std_logic_vector(11 downto 0):= (others =>'0');

SIGNAL gray_scale_cam_1: std_logic_vector(3 downto 0):= (others =>'0');
SIGNAL gray_scale_cam_2: std_logic_vector(3 downto 0):= (others =>'0');

signal nBlank     : std_logic;
signal activeArea : std_logic;

 signal rdaddress  : std_logic_vector(MEM_ADDR_SIZE downto 0);

begin

clock_inst : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => clk_100_internal,
   clk_out2 => clk_50_internal,
   clk_out3 => clk_25_internal,
  -- Status and control signals                
   -- Clock in ports
   clk_in1 => GCLK_100
 );

frame_addr_cam_1 <= rdaddress;
frame_addr_cam_2 <= rdaddress;
memory_block_cam_1 : blk_mem_gen_0
  PORT MAP (
    clka  => pixel_clk_cam_1, 
    wea   => ram_we_cam_1,
    addra => ram_addr_cam_1,
    dina  => pixel_out_cam_1,
	 
    clkb  => clk_50_internal,
    addrb => frame_addr_cam_1,
    doutb => frame_pixel_cam_1
  );
  
 memory_block_cam_2 : blk_mem_gen_1
    PORT MAP (
      clka  => pixel_clk_cam_2, 
      wea   => ram_we_cam_2,
      addra => ram_addr_cam_2,
      dina  => pixel_out_cam_2,
       
      clkb  => clk_50_internal,
      addrb => frame_addr_cam_2,
      doutb => frame_pixel_cam_2
    );
  
--	Inst_vga: vga 
--  GENERIC MAP (MEM_ADDR_SIZE => MEM_ADDR_SIZE)
--  PORT MAP(
--      clk25       => clk_25_internal,
--      vga_red     => vga_red_int,
--      vga_green   => vga_green_int,
--      vga_blue    => vga_blue_int,
--      vga_hsync   => vga_hsync_int,
--      vga_vsync   => vga_vsync_int,
--      frame_addr  => frame_addr,
--      frame_pixel => frame_pixel
--  );  

	Inst_VGA: VGA PORT MAP(
		CLK25      => clk_25_internal,
		Hsync      => vga_hsync_int,
		Vsync      => vga_vsync_int,
        activeArea => activeArea
	);
	
		Inst_Address_Generator: Address_Generator 
		GENERIC MAP (MEM_ADDR_SIZE => MEM_ADDR_SIZE)
		PORT MAP(
        CLK25 => clk_25_internal,
        enable => activeArea,
        vsync  => vga_vsync_int,
        address => rdaddress
    );

cam1: ov7670_top 
    GENERIC MAP (MEM_ADDR_SIZE => MEM_ADDR_SIZE)
    PORT MAP (
        clk100 => clk_100_internal,     
        clk50 => clk_50_internal,     
        clk25 => clk_25_internal,     
		OV7670_SIOC => OV7670_SIOC_1, 
		OV7670_SIOD  => OV7670_SIOD_1, 
		OV7670_RESET => OV7670_RESET_1, 
		OV7670_PWDN  => OV7670_PWDN_1, 
		OV7670_VSYNC =>OV7670_VSYNC_1,
		OV7670_HREF  => OV7670_HREF_1,  
		OV7670_PCLK  => OV7670_PCLK_1, 
		OV7670_XCLK  => OV7670_XCLK_1, 
		OV7670_D     => OV7670_D_1,
		LED          => LED(0), 
		btn 		    => btn,
		pixel_clk => pixel_clk_cam_1,
        ram_addr => ram_addr_cam_1,
        pixel_out => pixel_out_cam_1,
        ram_we => ram_we_cam_1(0)
);

cam2: ov7670_top 
    GENERIC MAP (MEM_ADDR_SIZE => MEM_ADDR_SIZE)
    PORT MAP (
        clk100 => clk_100_internal,     
        clk50 => clk_50_internal,     
        clk25 => clk_25_internal,     
		OV7670_SIOC => OV7670_SIOC_2, 
		OV7670_SIOD  => OV7670_SIOD_2, 
		OV7670_RESET => OV7670_RESET_2, 
		OV7670_PWDN  => OV7670_PWDN_2, 
		OV7670_VSYNC =>OV7670_VSYNC_2,
		OV7670_HREF  => OV7670_HREF_2,  
		OV7670_PCLK  => OV7670_PCLK_2, 
		OV7670_XCLK  => OV7670_XCLK_2, 
		OV7670_D     => OV7670_D_2,
		LED          => LED(1), 
		btn 		    => btn,
		pixel_clk => pixel_clk_cam_2,
        ram_addr => ram_addr_cam_2,
        pixel_out => pixel_out_cam_2,
        ram_we => ram_we_cam_2(0)
);

PROCESS(clk_50_internal)
BEGIN
IF (rising_edge(clk_50_internal)) then
        vga_hsync    <= vga_hsync_int; 
        vga_vsync    <= vga_vsync_int;
IF (SW = "00000000") THEN

        if (activeArea='1') then
            vga_red <= frame_pixel_cam_1(11 downto 8);
            vga_green <= frame_pixel_cam_1(7 downto 4);
            vga_blue <= frame_pixel_cam_1(3 downto 0);
        else
            vga_red <= "0000";
            vga_green <= "0000";
            vga_blue <= "0000";
        end if;        

        
ELSIF (SW = "00000001") THEN

        if (activeArea='1') then
            vga_red <= frame_pixel_cam_2(11 downto 8);
            vga_green <= frame_pixel_cam_2(7 downto 4);
            vga_blue <= frame_pixel_cam_2(3 downto 0);
        else
            vga_red <= "0000";
            vga_green <= "0000";
            vga_blue <= "0000";
        end if;  
ELSIF (SW = "00000010") THEN
       
        gray_scale_cam_1 <= std_logic_vector(to_unsigned((30 * to_integer(unsigned(frame_pixel_cam_1(11 downto 8)))/100) + (59*to_integer(unsigned(frame_pixel_cam_1(7 downto 4)))/100) + (11*to_integer(unsigned(frame_pixel_cam_1(3 downto 0)))/100),4));
        if (activeArea='1') then
            vga_red <= gray_scale_cam_1;
            vga_green <= gray_scale_cam_1;
            vga_blue <= gray_scale_cam_1;
        else
            vga_red <= "0000";
            vga_green <= "0000";
            vga_blue <= "0000";
        end if;  


ELSIF (SW = "00000011") THEN
        gray_scale_cam_2 <= std_logic_vector(to_unsigned((30 * to_integer(unsigned(frame_pixel_cam_2(11 downto 8)))/100) + (59*to_integer(unsigned(frame_pixel_cam_2(7 downto 4)))/100) + (11*to_integer(unsigned(frame_pixel_cam_2(3 downto 0)))/100),4));

        if (activeArea='1') then
            vga_red <= gray_scale_cam_2;
            vga_green <= gray_scale_cam_2;
            vga_blue <= gray_scale_cam_2;
        else
            vga_red <= "0000";
            vga_green <= "0000";
            vga_blue <= "0000";
        end if;  
ELSIF (SW = "00000100") THEN
        if (activeArea='1') then
          vga_red <= frame_pixel_cam_1(11 downto 8);
          vga_green <= frame_pixel_cam_2(7 downto 4);
          vga_blue <= std_logic_vector(to_unsigned(((to_integer(unsigned(frame_pixel_cam_1( 3 downto 0)))+ to_integer(unsigned(frame_pixel_cam_2( 3 downto 0))))/2),4)); 
        else
          vga_red <= "0000";
          vga_green <= "0000";
          vga_blue <= "0000";
         end if;
ELSIF (SW = "00000101") THEN
         if (activeArea='1') then
           vga_red <= frame_pixel_cam_2(11 downto 8);
           vga_green <= frame_pixel_cam_1(7 downto 4);
           vga_blue <= std_logic_vector(to_unsigned(((to_integer(unsigned(frame_pixel_cam_1( 3 downto 0)))+ to_integer(unsigned(frame_pixel_cam_2( 3 downto 0))))/2),4)); 
         else
           vga_red <= "0000";
           vga_green <= "0000";
           vga_blue <= "0000";
          end if;

ELSIF (SW = "00000110") THEN
           if (activeArea='1') then
             vga_red <= std_logic_vector(to_unsigned(to_integer(unsigned(frame_pixel_cam_1(11 downto 8)))-to_integer(unsigned(frame_pixel_cam_2(11 downto 8))),4));
             vga_green <= std_logic_vector(to_unsigned(to_integer(unsigned(frame_pixel_cam_1(7 downto 4)))-to_integer(unsigned(frame_pixel_cam_2(7 downto 4))),4));
             vga_blue <= std_logic_vector(to_unsigned(to_integer(unsigned(frame_pixel_cam_1(3 downto 0)))-to_integer(unsigned(frame_pixel_cam_2(3 downto 0))),4)); 
           else
             vga_red <= "0000";
             vga_green <= "0000";
             vga_blue <= "0000";
            end if;
ELSIF (SW = "00000111") THEN
           if (activeArea='1') then
             vga_red <= std_logic_vector(to_unsigned(to_integer(unsigned(frame_pixel_cam_2(11 downto 8)))-to_integer(unsigned(frame_pixel_cam_1(11 downto 8))),4));
             vga_green <= std_logic_vector(to_unsigned(to_integer(unsigned(frame_pixel_cam_2(7 downto 4)))-to_integer(unsigned(frame_pixel_cam_1(7 downto 4))),4));
             vga_blue <= std_logic_vector(to_unsigned(to_integer(unsigned(frame_pixel_cam_2(3 downto 0)))-to_integer(unsigned(frame_pixel_cam_1(3 downto 0))),4)); 
           else
             vga_red <= "0000";
             vga_green <= "0000";
             vga_blue <= "0000";
            end if;

ELSIF (SW = "00001000") THEN -- black and white
           if (activeArea='1') then
                gray_scale_cam_1 <= std_logic_vector(to_unsigned((30 * to_integer(unsigned(frame_pixel_cam_1(11 downto 8)))/100) + (59*to_integer(unsigned(frame_pixel_cam_1(7 downto 4)))/100) + (11*to_integer(unsigned(frame_pixel_cam_1(3 downto 0)))/100),4));
                if (to_integer(unsigned(gray_scale_cam_1)) >  7) then
                     vga_red <= "1111"; 
                     vga_green <= "1111"; 
                     vga_blue <= "1111";
                else
                    vga_red <= "0000"; 
                    vga_green <= "0000"; 
                    vga_blue <= "0000";
                
                end if;
           else
             vga_red <= "0000";
             vga_green <= "0000";
             vga_blue <= "0000";
            end if;
ELSIF (SW = "00001001") THEN -- black and white
           if (activeArea='1') then
                gray_scale_cam_2 <= std_logic_vector(to_unsigned((30 * to_integer(unsigned(frame_pixel_cam_2(11 downto 8)))/100) + (59*to_integer(unsigned(frame_pixel_cam_2(7 downto 4)))/100) + (11*to_integer(unsigned(frame_pixel_cam_2(3 downto 0)))/100),4));
                if (to_integer(unsigned(gray_scale_cam_2)) >  7) then
                     vga_red <= "1111"; 
                     vga_green <= "1111"; 
                     vga_blue <= "1111";
                else
                    vga_red <= "0000"; 
                    vga_green <= "0000"; 
                    vga_blue <= "0000";
                
                end if;
           else
             vga_red <= "0000";
             vga_green <= "0000";
             vga_blue <= "0000";
            end if;
END IF;
END IF;



END PROCESS;


end Behavioral;
