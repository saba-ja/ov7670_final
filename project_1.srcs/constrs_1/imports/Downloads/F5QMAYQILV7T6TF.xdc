set_property PACKAGE_PIN    Y9 [get_ports {   GCLK_100 } ]
set_property PACKAGE_PIN	Y21	[get_ports {	vga_blue[0]	}	]
set_property PACKAGE_PIN	Y20	[get_ports {	vga_blue[1]	}	]
set_property PACKAGE_PIN	AB20	[get_ports {	vga_blue[2]	}	]
set_property PACKAGE_PIN	AB19	[get_ports {	vga_blue[3]	}	]
set_property PACKAGE_PIN	AB22	[get_ports {	vga_green[0]	}	]
set_property PACKAGE_PIN	AA22	[get_ports {	vga_green[1]	}	]
set_property PACKAGE_PIN	AB21	[get_ports {	vga_green[2]	}	]
set_property PACKAGE_PIN	AA21	[get_ports {	vga_green[3]	}	]
set_property PACKAGE_PIN	V20	[get_ports {	vga_red[0]	}	]
set_property PACKAGE_PIN	U20	[get_ports {	vga_red[1]	}	]
set_property PACKAGE_PIN	V19	[get_ports {	vga_red[2]	}	]
set_property PACKAGE_PIN	V18	[get_ports {	vga_red[3]	}	]
set_property PACKAGE_PIN	AA19	[get_ports {	vga_hsync	}	]
set_property PACKAGE_PIN	Y19	[get_ports {	vga_vsync	}	]
					
# JA					
set_property PACKAGE_PIN	Y11	[get_ports {	OV7670_PWDN_1	}	]; # JA1
set_property PACKAGE_PIN	AB11	[get_ports {	OV7670_RESET_1	}	]; # JA7
set_property PACKAGE_PIN	AA11	[get_ports {	OV7670_D_1[0]	}	]; # JA2
set_property PACKAGE_PIN	AB10	[get_ports {	OV7670_D_1[1]	}	]; # JA8
set_property PACKAGE_PIN	Y10	[get_ports {	OV7670_D_1[2]	}	]; # JA3
set_property PACKAGE_PIN	AB9	[get_ports {	OV7670_D_1[3]	}	]; # JA9 
set_property PACKAGE_PIN	AA9	[get_ports {	OV7670_D_1[4]	}	]; # JA4
set_property PACKAGE_PIN	AA8	[get_ports {	OV7670_D_1[5]	}	]; # JA10
# JB					
set_property PACKAGE_PIN	W12	[get_ports {	OV7670_D_1[6]	}	]; # JB1
set_property PACKAGE_PIN	V12	[get_ports {	OV7670_D_1[7]	}	]; # JB7
set_property PACKAGE_PIN	W11	[get_ports {	OV7670_XCLK_1	}	]; # JB2
set_property PACKAGE_PIN	W10	[get_ports {	OV7670_PCLK_1	}	]; # JB8
set_property PACKAGE_PIN	V10	[get_ports {	OV7670_HREF_1	}	]; # JB3
set_property PACKAGE_PIN	V9	[get_ports {	OV7670_VSYNC_1	}	]; # JB9
set_property PACKAGE_PIN	W8	[get_ports {	OV7670_SIOD_1	}	]; # JB4
set_property PACKAGE_PIN	V8	[get_ports {	OV7670_SIOC_1	}	]; # JB10

## #################################################################
# JC
set_property PACKAGE_PIN	AB7	[get_ports {	OV7670_PWDN_2	}	]; # JC1_P
set_property PACKAGE_PIN	R6	[get_ports {	OV7670_RESET_2	}	]; # JC3_P
set_property PACKAGE_PIN	AB6	[get_ports {	OV7670_D_2[0]	}	]; # JC1_N
set_property PACKAGE_PIN	T6	[get_ports {	OV7670_D_2[1]	}	]; # JC3_N
set_property PACKAGE_PIN	Y4	[get_ports {	OV7670_D_2[2]	}	]; # JC2_P
set_property PACKAGE_PIN	T4	[get_ports {	OV7670_D_2[3]	}	]; # JC4_P
set_property PACKAGE_PIN	AA4	[get_ports {	OV7670_D_2[4]	}	]; # JC2_N
set_property PACKAGE_PIN	U4	[get_ports {	OV7670_D_2[5]	}	]; # JC4_N
# JD					
set_property PACKAGE_PIN	V7	[get_ports {	OV7670_D_2[6]	}	]; # JD1_P
set_property PACKAGE_PIN	W6	[get_ports {	OV7670_D_2[7]	}	]; # JD3_P
set_property PACKAGE_PIN	W7	[get_ports {	OV7670_XCLK_2	}	]; # JD1_N
set_property PACKAGE_PIN	W5	[get_ports {	OV7670_PCLK_2	}	]; # JD3_N
set_property PACKAGE_PIN	V5	[get_ports {	OV7670_HREF_2	}	]; # JD2_P
set_property PACKAGE_PIN	U6	[get_ports {	OV7670_VSYNC_2	}	]; # JD4_P
set_property PACKAGE_PIN	V4	[get_ports {	OV7670_SIOD_2	}	]; # JD2_N
set_property PACKAGE_PIN	U5	[get_ports {	OV7670_SIOC_2	}	]; # JD4_N


# ################################################################
				
set_property PACKAGE_PIN	T22	[get_ports {	LED[0]	}	]
set_property PACKAGE_PIN	T21	[get_ports {	LED[1]	}	]
set_property PACKAGE_PIN	U22	[get_ports {	LED[2]	}	]
set_property PACKAGE_PIN	U21	[get_ports {	LED[3]	}	]
set_property PACKAGE_PIN	V22	[get_ports {	LED[4]	}	]
set_property PACKAGE_PIN	W22	[get_ports {	LED[5]	}	]
set_property PACKAGE_PIN	U19	[get_ports {	LED[6]	}	]
set_property PACKAGE_PIN	U14	[get_ports {	LED[7]	}	]
					
set_property PACKAGE_PIN	T18	[get_ports {	btn	}	]

# ----------------------------------------------------------------------------
# User DIP Switches - Bank 35
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN F22 [get_ports {SW[0]}];  # "SW0"
set_property PACKAGE_PIN G22 [get_ports {SW[1]}];  # "SW1"
set_property PACKAGE_PIN H22 [get_ports {SW[2]}];  # "SW2"
set_property PACKAGE_PIN F21 [get_ports {SW[3]}];  # "SW3"
set_property PACKAGE_PIN H19 [get_ports {SW[4]}];  # "SW4"
set_property PACKAGE_PIN H18 [get_ports {SW[5]}];  # "SW5"
set_property PACKAGE_PIN H17 [get_ports {SW[6]}];  # "SW6"
set_property PACKAGE_PIN M15 [get_ports {SW[7]}];  # "SW7"


# Voltage levels
set_property IOSTANDARD LVTTL [get_ports btn]
set_property IOSTANDARD LVTTL [get_ports {LED[*]}]

set_property IOSTANDARD LVTTL [get_ports OV7670_PCLK_1]
set_property IOSTANDARD LVTTL [get_ports OV7670_SIOC_1]
set_property IOSTANDARD LVTTL [get_ports OV7670_VSYNC_1]
set_property IOSTANDARD LVTTL [get_ports OV7670_RESET_1]
set_property IOSTANDARD LVTTL [get_ports OV7670_PWDN_1]
set_property IOSTANDARD LVTTL [get_ports OV7670_HREF_1]
set_property IOSTANDARD LVTTL [get_ports OV7670_XCLK_1]
set_property IOSTANDARD LVTTL [get_ports OV7670_SIOD_1]
set_property IOSTANDARD LVTTL [get_ports {OV7670_D_1[*]}]

set_property IOSTANDARD LVTTL [get_ports OV7670_PCLK_2]
set_property IOSTANDARD LVTTL [get_ports OV7670_SIOC_2]
set_property IOSTANDARD LVTTL [get_ports OV7670_VSYNC_2]
set_property IOSTANDARD LVTTL [get_ports OV7670_RESET_2]
set_property IOSTANDARD LVTTL [get_ports OV7670_PWDN_2]
set_property IOSTANDARD LVTTL [get_ports OV7670_HREF_2]
set_property IOSTANDARD LVTTL [get_ports OV7670_XCLK_2]
set_property IOSTANDARD LVTTL [get_ports OV7670_SIOD_2]
set_property IOSTANDARD LVTTL [get_ports {OV7670_D_2[*]}]

set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports vga_hsync]
set_property IOSTANDARD LVCMOS33 [get_ports vga_vsync]
set_property IOSTANDARD LVCMOS33 [get_ports  GCLK_100]

set_property IOSTANDARD LVCMOS33 [get_ports SW];
# Magic
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets OV7670_PCLK_1_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets OV7670_PCLK_2_IBUF]
