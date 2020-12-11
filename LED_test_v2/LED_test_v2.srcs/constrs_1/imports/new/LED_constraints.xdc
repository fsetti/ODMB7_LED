set_property PACKAGE_PIN U21        [get_ports KUS_DL_SEL]
set_property IOSTANDARD LVCMOS18    [get_ports KUS_DL_SEL]

set_property PACKAGE_PIN T23        [get_ports FPGA_SEL_18]
set_property IOSTANDARD LVCMOS18    [get_ports FPGA_SEL_18]

set_property PACKAGE_PIN W29        [get_ports RST_CLKS_18_B]
set_property IOSTANDARD LVCMOS18    [get_ports RST_CLKS_18_B]

set_property PACKAGE_PIN L9         [get_ports DONE]
set_property IOSTANDARD LVCMOS18    [get_ports DONE]

#FPGA CMS CLOCK
set_property PACKAGE_PIN AK17       [get_ports CMS_CLK_FPGA_P]
set_property PACKAGE_PIN AK16       [get_ports CMS_CLK_FPGA_N]

set_property PACKAGE_PIN M22        [get_ports LEDS_CFV_11]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_11]


#REF_CLK_1
set_property PACKAGE_PIN AF6        [get_ports REF_CLK_1_P]
set_property PACKAGE_PIN    AF5     [get_ports REF_CLK_1_N]

set_property DIFF_TERM TRUE         [get_ports REF_CLK_1_P]
set_property DIFF_TERM TRUE         [get_ports REF_CLK_1_N]

set_property PACKAGE_PIN T27        [get_ports LEDS_CFV_1]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_1]


#REF_CLK_2
set_property PACKAGE_PIN P6         [get_ports REF_CLK_2_P]
set_property PACKAGE_PIN P5         [get_ports REF_CLK_2_N]

set_property DIFF_TERM TRUE         [get_ports REF_CLK_2_P]
set_property DIFF_TERM TRUE         [get_ports REF_CLK_2_N]

set_property PACKAGE_PIN P20        [get_ports LEDS_CFV_0]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_0]


#REF_CLK_3
set_property PACKAGE_PIN V6         [get_ports REF_CLK_3_P]
set_property PACKAGE_PIN V5         [get_ports REF_CLK_3_N]

set_property DIFF_TERM TRUE         [get_ports REF_CLK_3_P]
set_property DIFF_TERM TRUE         [get_ports REF_CLK_3_N]

set_property PACKAGE_PIN R27        [get_ports LEDS_CFV_3]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_3]


#REF_CLK_4
set_property PACKAGE_PIN AB6        [get_ports REF_CLK_4_P]
set_property PACKAGE_PIN AB5        [get_ports REF_CLK_4_N]

set_property DIFF_TERM TRUE         [get_ports REF_CLK_4_P]
set_property DIFF_TERM TRUE         [get_ports REF_CLK_4_N]

set_property PACKAGE_PIN N22        [get_ports LEDS_CFV_2]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_2]


#REF_CLK_5
set_property PACKAGE_PIN M6         [get_ports REF_CLK_5_P]
set_property PACKAGE_PIN M5         [get_ports REF_CLK_5_N]

set_property DIFF_TERM TRUE         [get_ports REF_CLK_5_P]
set_property DIFF_TERM TRUE         [get_ports REF_CLK_5_N]

set_property PACKAGE_PIN R26        [get_ports LEDS_CFV_5]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_5]


#GP_CLK_6
set_property PACKAGE_PIN AK22       [get_ports GP_CLK_6_P]
set_property PACKAGE_PIN AK23       [get_ports GP_CLK_6_N]

set_property DIFF_TERM TRUE         [get_ports GP_CLK_6_P]
set_property DIFF_TERM TRUE         [get_ports GP_CLK_6_N]

set_property PACKAGE_PIN T25        [get_ports LEDS_CFV_4]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_4]


#GP_CLK_7
set_property PACKAGE_PIN E18        [get_ports GP_CLK_7_P]
set_property PACKAGE_PIN E17        [get_ports GP_CLK_7_N]

set_property DIFF_TERM TRUE         [get_ports GP_CLK_7_P]
set_property DIFF_TERM TRUE         [get_ports GP_CLK_7_N]

set_property PACKAGE_PIN T24        [get_ports LEDS_CFV_7]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_7]


#EMCCLK
set_property PACKAGE_PIN K20        [get_ports EMCCLK]
#set_property IOSTANDARD LVCMOS18    [get_ports EMCCLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {IBUFG_EMCCLK/O}]

set_property PACKAGE_PIN R25        [get_ports LEDS_CFV_6]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_6]


#LF_CLK
set_property PACKAGE_PIN AJ16       [get_ports LF_CLK]
#set_property IOSTANDARD LVCMOS18    [get_ports LF_CLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {IBUFG_LFCLK/O}]

set_property PACKAGE_PIN P23        [get_ports LEDS_CFV_9]
set_property IOSTANDARD LVCMOS18    [get_ports LEDS_CFV_9]

