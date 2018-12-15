library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity ov7670_top is
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
        btn 		    : in    STD_LOGIC;
		LED          : out    STD_LOGIC;

		pixel_clk : OUT STD_LOGIC;
		ram_addr  : OUT std_logic_vector(MEM_ADDR_SIZE downto 0);
        pixel_out : OUT std_logic_vector(11 downto 0);
        ram_we    : OUT std_logic
		
		
	 );
end ov7670_top;

architecture Behavioral of ov7670_top is

	COMPONENT debounce
	PORT(
		clk : IN std_logic;
		i : IN std_logic;          
		o : OUT std_logic
		);
	END COMPONENT;

	COMPONENT ov7670_controller
	PORT(
		clk   : IN    std_logic;    
		resend: IN    std_logic;    
		config_finished : out std_logic;
		siod  : INOUT std_logic;      
		sioc  : OUT   std_logic;
		reset : OUT   std_logic;
		pwdn  : OUT   std_logic;
		xclk  : OUT   std_logic
		);
	END COMPONENT;



	COMPONENT ov7670_capture
    GENERIC (MEM_ADDR_SIZE: INTEGER := 18);
	PORT(
		pclk : IN std_logic;
		vsync : IN std_logic;
		href  : IN std_logic;
		d     : IN std_logic_vector(7 downto 0);          
		addr  : OUT std_logic_vector(MEM_ADDR_SIZE downto 0);
		dout  : OUT std_logic_vector(11 downto 0);
		we    : OUT std_logic
		);
	END COMPONENT;

	signal capture_addr    : std_logic_vector(MEM_ADDR_SIZE downto 0);
	signal capture_data    : std_logic_vector(11 downto 0);
    signal capture_we      : std_logic_vector(0 downto 0);
	signal resend          : std_logic;
	signal config_finished : std_logic;
	
	signal clk_feedback  : std_logic;
	signal buffered_pclk : std_logic;
	
begin
  
btn_debounce: debounce PORT MAP(
		clk => clk50,
		i   => btn,
		o   => resend
	);

  led <=  config_finished;
  pixel_clk <= OV7670_PCLK;
  ram_addr  <= capture_addr;
  pixel_out <= capture_data;
  ram_we    <= capture_we(0);
capture: ov7670_capture 
    GENERIC MAP (MEM_ADDR_SIZE => MEM_ADDR_SIZE)
    PORT MAP(
		pclk  => OV7670_PCLK,
		vsync => OV7670_VSYNC,
		href  => OV7670_HREF,
		d     => OV7670_D,
		addr  => capture_addr,
		dout  => capture_data,
		we    => capture_we(0)
	);
  
controller: ov7670_controller PORT MAP(
		clk   => clk50,
		sioc  => ov7670_sioc,
		resend => resend,
		config_finished => config_finished,
		siod  => ov7670_siod,
		pwdn  => OV7670_PWDN,
		reset => OV7670_RESET,
		xclk  => OV7670_XCLK
	);

end Behavioral;