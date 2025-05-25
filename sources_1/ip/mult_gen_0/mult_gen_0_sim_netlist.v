// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun May 25 05:35:06 2025
// Host        : LAPTOP-C8V994UJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ASUS/Desktop/Lab_NanoProcessor_Opt/NanoProcessor_Optimized/NanoProcessor_Optimized.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_14,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire [7:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_14 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(1'b1),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "0" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "7" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_14" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_14
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [7:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire [7:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_14_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(1'b0),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
Xy0rQtyFjlVkbWfeQXwuqraA3MiYyL0eFNjbY4iEa+s0Iy4tsgQeJeqb8F2nyNFI15QQro+xjbie
m+gt7LRqSA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ket885wFwjDLqC97HI68cpTwpD1hGBIJdkMh+rsfw+vPf59MdHJNNbcLh5jkiDAOhjCAn8l7Pljd
OAdA4DPaB1th3EEcK28Uhm8xkCE8u1JeKM+cTawL1ZqM7f5vFJDMTdaQdo2ODraPwf63iOc4O7I1
Jp0iW8w4eq4dmJxUtLQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
0sLRbF/nd38eurlUzps5D+y+9REEleMhJud3+B55Wgm1hYo1ntzC4vdMFNHAcAq1l46fEiE/D85o
eYPC/WuBoZraAAbt+2vzvO+6NgUIpKKrii5bWkc7zSRBw4OUgkdgOToRQnup7uEq7pNL5gER2W2q
jpbl57Ks7667W7TbtoCx+55cY2wmHeQ+Fi9eAhxvopt9UQ7JhiAITU32QV0QOUo0C5DuMrCOfUPt
Q4mY/sCujPAsGwpHpQOH6JmVeTJ9/9FBANFdHkzv6F+8T8a1pEE2+YcJXysHrFHMtW27J1ZZCZGA
hChjmCakAGz4Jve6Njfz9RKNiLrrvv0gHwgvEw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z45gwqdZGpYP0Kv2lPvhL9t/dewTJD5ANS61F5BSLbdhMd8PVbRummT3J9CrH0Xrbuzjih6sOpQw
kP9SCPfkWk0LECt8HjobCatSEoRRONU79HyCEoDk93VT8CY8JL1BVS13wUngEWn6CIfitTyUUXR/
CxyxtdDZQFDUfHXEX4XQ0Yn12IXvHzgVAVLyG8UmGQWtQl4u7U/ZvMszHbCI4hHi6FW2kYvzBYlf
e14GZYOKCoOlqFp/3u2vs2rSSE9ciWV/SYIJDbOxsQCcBEM+UYYOzWikcZxKJAlJhndq92g1JKTL
sQcp7SBbbJ1O6Xynuz0MZ47Dfl+F87qkHSjwDQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AeZ3V4sxDArImz8Q4W0bdOLintyw5zFj71qsxS4fYZUiRz8fNjC87lJzQ+YnUM13/42C5tAz/W5B
5De7uFmIgyIiHZ7Y1Ljeaa49Hank9rJJwKCFDSSNL8oJL51I1jWnn7YQnA7UX2zo1TTkepqKq7HW
QLVQHxdIfz7XQJ1KYPLfGQXcsGEecPlraNmNXeykJAgtAFm5XnR8iyVOGbjm9W9BUx0070wOpVoK
DNLr58vy3yAgTwtSBr+RexJEsBPZIUDyrA9NgYHy91GC6l4e/tQMTkA5GUgHnQd/YiVINSR358nO
A3j+0MMXq+Hrg0TJtfXsqD7mdjD7gjs4pqa1Vw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
BTz6m4RfoEciTWA22aqSQ7leYhQBT580p+3gUMnEkDKrl8y/O8yBG9prYh9eaBfxpy/1/zsYPTfE
O0sD3klOHeyC81JjLy2AWCWL1sk9/7n5I9vvSHXaQP4PHYRjAzqZC2XENPD0SKyVkobaEQpad+o8
VjB8RI608B9GgMaZvYA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D7Hbf96be8hL6h8aH9GXSy4IzBK9xG0ri9cVSVfA+REat+znGl+3rKoWJP3Y8xVsMkc1boG+wuph
DvXt9Y8VIRQAHNgamdZlVmWFc7YNNoioXwxsiPQUGQ033qF9EQryRyyXiVxfPqJOSfqv7PrbvgOT
5UDZUXtmOWGVrgoDlz45TFPs5v+lO6i3RYt0nujylzKTS8VLhLp7chpkjrCdjQc8hZGNDkUI5WPz
T16PgMtr8+aqlEn030MgQ09L5vJki+2qisAmejQVoQ30QbY0N/13XTb4LdaYF1u53Ib59hKf/1nP
//1d/wsq1f4QJoIkaVIa2ngZqWphjv4BhaOjtw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dHVpoGeasXLOjpuIhRnJoM2DGXWgab22dXXlUj8i0kx999phPGrBB1Z6cl9muIS5x4Hu1/i6qUxs
9KPqt2tNuBB+THn8gmt1jWi8KHX6LvAfkHFDR34oNKXfP5R687KrRx98MQ07+w/6GJgw3cjND6Mz
yiIPpeB5gaqpbfHT7yJqGgsKdcppkXQd2TU8hXQeuBAol41X4706TltAMD6uZE/PBMi93eIcpaiK
89qYDU9GwTqLnl+Bx2EXUlJyPxIaV+VSd10ApKsQOKs1VoNcSOYHzViTTjc0xiuncnclFBZkEzLe
koCwjomRa7poI2A6HU8u2SM2KdSBol3Z6iTPsQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eUPBTMnjbAmHfkfHE9r/UdaR5eUSbYbsTEucAAlBPWSL/WCryEx983NydonLA7NGijxL/ZIb727E
jNkjcpH/JRS5YRPBubLkofdRlBm7Wlp79W6vsLu8xv0WYCxLETHcF49jyLNOJpivhREqc7F/9X5J
wOQ1w/rzl9z0tygowv9h1wbGWyRYkWt8fQXdYcK8n4QBdRs9do5RSFjmhB2YvOrgFx2MDvt5Jsbj
72DFeEUP8IL4+TPFACeuhjHFw9Hq3f4s2IH1bANvYuY35R+D+xrX0B+B76MQ063VqAx946WXBRGM
0l5/zD9ScI1oGrGZg/LCZJUC4w0rTSl/a7OCJA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6704)
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
