// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2.2 (lin64) Build 2348494 Mon Oct  1 18:25:39 MDT 2018
// Date        : Sun Dec  9 15:14:09 2018
// Host        : saba-VirtualBox running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_shift_ram_0_sim_netlist.v
// Design      : c_shift_ram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_shift_ram_0,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.2.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (D,
    CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [11:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [11:0]Q;

  wire CLK;
  wire [11:0]D;
  wire [11:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "000000000000" *) 
  (* c_default_data = "000000000000" *) 
  (* c_depth = "10" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "000000000000" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "12" *) 
  (* c_xdevicefamily = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "000000000000" *) (* C_DEFAULT_DATA = "000000000000" *) 
(* C_DEPTH = "10" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "000000000000" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "12" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [11:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [11:0]Q;

  wire CLK;
  wire [11:0]D;
  wire [11:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "000000000000" *) 
  (* c_default_data = "000000000000" *) 
  (* c_depth = "10" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "000000000000" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "12" *) 
  (* c_xdevicefamily = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_12_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
NRZcYSus3Hqh8Lt7O1HvnshMqsPUIDvTP5IO5R73Eyba5Kbk48nV85m7hlvmGYxGO0k0CjVRjGsT
W713YSpsIg==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
LXwwVo3ugwZbnxTTpe7twgUjxq5pPMg2vjNoxF0eyc4M6Fp0bbnAhbIRcYO/WgUWlRqWs2yeMjaj
/Xi70e6s1pK21Rq+59B4J95Z5H1ORikPCh6ufkgkD8UCiHIoxyy12rUPJXRun/mK6GupsHfEzrZh
IanyaJ2F82U9h2nSheE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fXxg6w6ZL+RqtJjmC/HllNvio4aQJ8rUPsuSW9WBrpwVzMoUt00H4+eSeiBEiQHqbki74j7yHi05
hUVj34JVwbUS9tAKYBuB/NmRubChTQ7eijN7tw8Q1OFM+rqGFUeCweSQUNRVYfffFHqCzSsvRhx0
SDEXwBfdSvjBj1ReYuYtcLpnQ/uxt14DOvcB7CSBpo8TXpCRV7FVvJoKQladZReHLrCfqJRAvmeF
/ptViCrUY5itsfEZg7Ja0SuQu9UpnXtnpHG1b30VcGjihPmXJwAIZUvAN4BsOiPW4YzFU0WovHpg
VAyv/k3XgnQMgr4SmoN9dLCPdPhWz8R9nOqvWw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iRjvlN4jcbN7WNgC9vZzODmkHbhz792IlB7iKkW+XaW/irtOLhtY6XWqqZQkL6g0K1ww/dWf+3yd
/qllasdWugEzH0rfyFo2FF266sY5+c361J3F00tO777yZwyUUiuEa32D4gpddizsJ7yLfDzInZ1t
lxpL7wNN+xcwFS6LoHVTHavlB95P2Abrn1Ns1uNZ+5HgOMnkJCV6RyV6afTHNSXHvByWkMZeXNuH
ysklx1qZv8wi7ibbkMVYN6qrWfmvvCucS+gLWi0U+8bR7l3YFVBNFIFxZNfQIU+rjTKubyMgF1+R
3MU6Zyr4jhb7SnPPWyw9IlURCcqEfGRFaFDuuw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ob3GkK5/tYzcx1TsuAIwRIdXKSG193BmKwyIepyqEYdTFZghmrtZHKrtyVNgk6GkdiZYpevhdoMA
SGxPlzABcYOp3pSe7fC9Wk/RjnVqQG0RIdBCLli/gfDpzFSeaZMCUaVStApNlRgrzMmh5wHDVo8c
9DvbY5tPYqB+brrErCgWOjW3/dqpfNvenroGNqXG0zF5+epKfGBEmeOugKxh84yKkRITBfu3bfQ8
lOD5Yc5ixmhqH1x0CuxSALBsmpuq/loOW4i9IGt+6c9BY4SlwKhQ5pLubbVmY9mCAATx+WKHfxmk
OvtDGcw9y7uIfiWZqVV9obmevO42abGjVP2cWw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
b3vK60gaJKulrIDIqNGqNBm3xMWveqK0FnsmsuKkCbuc4VyR9eA5Pcg8xfqBBWC1bcct1S93Ls+o
rixNIWp3fN7uqRCN/NyrudX7fNeztrdgwoL9PFvYGuVonYJeyc71ClF0hpsirptXuhFE1uwm4r8P
wMuMf2uj3YyzxsdD/gw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d7Lw1dBiJt/KzwB3Rw0Uoj1XWC7VrRwy2I7xT4OnNvKJ+FadUv4SnQf2od/xfmFrOAzT5au9KqUI
R+iu9moHXno1R8m91aiSA4crYAlZgQ2Er3m2vRgd0rejUjezekcLGckWg50Drl6KQC5GFcPZk7nw
QgQ/wlWAmnxVO0BM06WEbRC4pKL3/OZHaiT0ZLEP4QRUImBcVCE4gKGUMZeV3F7U2G8UGaKmjyl/
TEeDdEYjHC95S3jQoZZPSQFW0BChE6IqH6mjOHkk/Okc10PYvPYH83Fh+Ag6ckasAVv9sg/gN6ay
lYYXvbYoM/1TcfJFR2O87w7MS5X/IAdrlVWBZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YD2M/6p4W8Yj5y1kE3lnGxADOyOoYBchcP5O/vg/neYXLk+j9l2O77YHdjTNWvMWhmqW73UcKhJ+
NNZUuK8OxO4fl7YWo6VKuvcyLONVeAbV/tXStjW5MePvPEswc67bylFUaBWQJrst5TmjhlV4F5Np
ZgpYG86tK4NphBCaXhBW+VshjtiUU857Gw0ROcOsh/GSxdswal05ouv1SXbuR5NTnqe7rxCBVKRL
twjSjxGXpf2IB/9wibUNZZ8bvljlvWHnfxSRGKkcaJXANULk40YupgT6mFUuPvFFj/Vl1dA+EOdR
pEc9RMuQCRlIN2JNk89C/5fOvPs8Q+gYYx1dtA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
6a2r4NRxLg1XqgfBDVYol7dsg1vaT1NpYLRiNLflXgQiFc9sdJpKF1nwrBjwyWCFZJ1uVgkiiljB
DaQogjBDZSevjranmLjuS5d5c1HQkHUxW2dJHU3Ubb8TnW3KCxeMOeEvBg+l8b4oggysLOh5/E7e
qCowc66808wMbbbvXippdRfG9e3sg1orbVbkoymWaQwghF2LhHIRh4zE+ZE6EwHV1WWRNDnSZ7R3
ype7fdEETRW8AvS9DFIHE/eZwK/AjLgd7Z3yQFBeGew50MloZll1pslYxXBRGQmOyT8IPAuZDl8f
I1JDQ4BW/UWYMy4TG2Ssz/VTTWdVDi2bbazK+w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13664)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
