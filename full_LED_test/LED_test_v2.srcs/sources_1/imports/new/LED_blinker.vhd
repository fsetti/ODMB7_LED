library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library unisim;
use unisim.vcomponents.all;


entity LED_blinker is
    port (
        LEDS_CFV_11         : out    std_logic;
        CMS_CLK_FPGA_P      : in     std_logic;
        CMS_CLK_FPGA_N      : in     std_logic;

        LEDS_CFV_1          : out    std_logic;
        REF_CLK_1_P         : in     std_logic;
        REF_CLK_1_N         : in     std_logic;

        LEDS_CFV_0          : out    std_logic;
        REF_CLK_2_P         : in     std_logic;
        REF_CLK_2_N         : in     std_logic;

        LEDS_CFV_3          : out    std_logic;
        REF_CLK_3_P         : in     std_logic;
        REF_CLK_3_N         : in     std_logic;

        LEDS_CFV_2          : out    std_logic;
        REF_CLK_4_P         : in     std_logic;
        REF_CLK_4_N         : in     std_logic;

        LEDS_CFV_5          : out    std_logic;
        REF_CLK_5_P         : in     std_logic;
        REF_CLK_5_N         : in     std_logic;

        LEDS_CFV_4          : out    std_logic;
        GP_CLK_6_P          : in     std_logic;
        GP_CLK_6_N          : in     std_logic;

        LEDS_CFV_7          : out    std_logic;
        GP_CLK_7_P          : in     std_logic;
        GP_CLK_7_N          : in     std_logic;

        LEDS_CFV_6          : out    std_logic;
        EMCCLK              : in     std_logic;
        
        LEDS_CFV_9          : out    std_logic;
        LF_CLK              : in     std_logic

        );
end LED_blinker;


architecture Behavioral of LED_blinker is

    signal counter              : integer :=0;
    constant divide             : integer := 40078970;
    signal divide_vec           : std_logic_vector(3 to 0);
    
    signal cms_clk_i            :   std_logic;
    signal cms_clk              :   std_logic;
    signal counter_cms_clk      : integer :=0;
    
    signal mgtgpclk6_i          :   std_logic;
    signal clk_gp_6             :   std_logic;
    signal counter_gp_6         : integer :=0;
    
    signal mgtgpclk7_i          :   std_logic;
    signal clk_gp_7             :   std_logic;
    signal counter_gp_7         : integer :=0;
        
    
    signal mgtrefclk1_i         :   std_logic;
    signal mgtrefclk1_odiv2_i   :   std_logic;
    signal mgtrefclk1_rst       :   std_logic;
    signal clk_ref_1            :   std_logic;
    signal counter_ref_1        : integer :=0;
    
    signal mgtrefclk2_i         :   std_logic;
    signal mgtrefclk2_odiv2_i   :   std_logic;
    signal mgtrefclk2_rst       :   std_logic;
    signal clk_ref_2            :   std_logic;
    signal counter_ref_2        : integer :=0;
    
    signal mgtrefclk3_i         :   std_logic;
    signal mgtrefclk3_odiv2_i   :   std_logic;
    signal mgtrefclk3_rst       :   std_logic;
    signal clk_ref_3            :   std_logic;
    signal counter_ref_3        : integer :=0;
    
    signal mgtrefclk4_i         :   std_logic;
    signal mgtrefclk4_odiv2_i   :   std_logic;
    signal mgtrefclk4_rst       :   std_logic;
    signal clk_ref_4            :   std_logic;
    signal counter_ref_4        : integer :=0;
    
    signal mgtrefclk5_i         :   std_logic;
    signal mgtrefclk5_odiv2_i   :   std_logic;
    signal mgtrefclk5_rst       :   std_logic;
    signal clk_ref_5            :   std_logic;
    signal counter_ref_5        : integer :=0;

    signal clk_emc              :   std_logic;
    signal clk_emc_i            :   std_logic;
    signal counter_emc          : integer :=0;

    signal clk_lf               :   std_logic;
    signal clk_lf_i             :   std_logic;


begin

    divide_vec <= std_logic_vector(to_unsigned(1,divide_vec'length));

    IBUFGDS_CMS : IBUFGDS
    generic map (
        IBUF_LOW_PWR    => TRUE,
        IOSTANDARD      => "LVDS"
    )
    port map (
        O   =>  cms_clk_i,
        I   =>  CMS_CLK_FPGA_P,
        IB  =>  CMS_CLK_FPGA_N
    );

    BUFG_CMS    :   BUFG
    port map (
        O   =>  cms_clk,
        I   =>  cms_clk_i
    );
    
    
    IBUFGDS_GP6 : IBUFGDS
    generic map (
        IBUF_LOW_PWR    => TRUE,
        IOSTANDARD      => "LVDS"
    )
    port map (
        O   =>  mgtgpclk6_i,
        I   =>  GP_CLK_6_P,
        IB  =>  GP_CLK_6_N
    );

    BUFG_GP6    :   BUFG
    port map (
        O   =>  clk_gp_6,
        I   =>  mgtgpclk6_i
    );
    
    
    IBUFGDS_GP7 : IBUFGDS
    generic map (
        IBUF_LOW_PWR    => TRUE,
        IOSTANDARD      => "LVDS"
    )
    port map (
        O   =>  mgtgpclk7_i,
        I   =>  GP_CLK_7_P,
        IB  =>  GP_CLK_7_N
    );

    BUFG_GP7    :   BUFG
    port map (
        O   =>  clk_gp_7,
        I   =>  mgtgpclk7_i
    );
    
    
    IBUFG_EMCCLK    :  IBUFG
    generic map (
        IOSTANDARD  => "LVCMOS18" 
    )
    port map (
        O   =>  clk_emc_i,
        I   =>  EMCCLK
    );
    
    BUFG_EMCCLK     :   BUFG
    port map (
        O   =>  clk_emc,
        I   =>  clk_emc_i
    );

    IBUFG_LFCLK    :  IBUFG
    generic map (
        IOSTANDARD  => "LVCMOS18" 
    )
    port map (
        O   =>  clk_lf_i,
        I   =>  LF_CLK
    );
    
    BUFG_LFCLK    :   BUFG
    port map (
        O   =>  clk_lf,
        I   =>  clk_lf_i
    );
    
    
    u_buf_gth_clk_1 : IBUFDS_GTE3
    port map (
        O       => mgtrefclk1_i,
        ODIV2   => mgtrefclk1_odiv2_i,
        CEB     => '0',
        I       => REF_CLK_1_P,
        IB      => REF_CLK_1_N
    );

    u_bufg_gt_clk_1 : BUFG_GT 
    port map (
        CE      => '1',
        CEMASK  => '0',
        CLR     => mgtrefclk1_rst,
        CLRMASK => '0',
        DIV     => divide_vec,
        I       => mgtrefclk1_odiv2_i,
        O       => clk_ref_1
    );
 
  
    u_buf_gth_clk_2 : IBUFDS_GTE3
    port map (
        O       => mgtrefclk2_i,
        ODIV2   => mgtrefclk2_odiv2_i,
        CEB     => '0',
        I       => REF_CLK_2_P,
        IB      => REF_CLK_2_N
    );

    u_bufg_gt_clk_2 : BUFG_GT 
    port map (
        CE      => '1',
        CEMASK  => '0',
        CLR     => mgtrefclk2_rst,
        CLRMASK => '0',
        DIV     => divide_vec,
        I       => mgtrefclk2_odiv2_i,
        O       => clk_ref_2
    );
 
  
    u_buf_gth_clk_3 : IBUFDS_GTE3
    port map (
        O       => mgtrefclk3_i,
        ODIV2   => mgtrefclk3_odiv2_i,
        CEB     => '0',
        I       => REF_CLK_3_P,
        IB      => REF_CLK_3_N
    );

    u_bufg_gt_clk_3 : BUFG_GT 
    port map (
        CE      => '1',
        CEMASK  => '0',
        CLR     => mgtrefclk3_rst,
        CLRMASK => '0',
        DIV     => divide_vec,
        I       => mgtrefclk3_odiv2_i,
        O       => clk_ref_3
    );
 
  
    u_buf_gth_clk_4 : IBUFDS_GTE3
    port map (
        O       => mgtrefclk4_i,
        ODIV2   => mgtrefclk4_odiv2_i,
        CEB     => '0',
        I       => REF_CLK_4_P,
        IB      => REF_CLK_4_N
    );

    u_bufg_gt_clk_4 : BUFG_GT 
    port map (
        CE      => '1',
        CEMASK  => '0',
        CLR     => mgtrefclk4_rst,
        CLRMASK => '0',
        DIV     => divide_vec,
        I       => mgtrefclk4_odiv2_i,
        O       => clk_ref_4
    );
  
  
    u_buf_gth_clk_5 : IBUFDS_GTE3
    port map (
        O       => mgtrefclk5_i,
        ODIV2   => mgtrefclk5_odiv2_i,
        CEB     => '0',
        I       => REF_CLK_5_P,
        IB      => REF_CLK_5_N
    );

    u_bufg_gt_clk_5 : BUFG_GT 
    port map (
        CE      => '1',
        CEMASK  => '0',
        CLR     => mgtrefclk5_rst,
        CLRMASK => '0',
        DIV     => divide_vec,
        I       => mgtrefclk5_odiv2_i,
        O       => clk_ref_5
    );
    
    

process (cms_clk) is
    begin
        if rising_edge(cms_clk) then
            if ( counter < divide / 2 - 1) then
                counter <= counter+1;
                LEDS_CFV_11 <= '1';
            elsif ( counter < divide -1 ) then
                counter <= counter+1;
                LEDS_CFV_11<='0';
            else
                LEDS_CFV_11 <='1';
                counter<=0;
            end if;
        end if;
end process;

    
process (clk_ref_1) is
    begin    
        if rising_edge(clk_ref_1) then
            if ( counter_ref_1 < divide / 2 - 1) then
                counter_ref_1 <= counter_ref_1 + 1;
                LEDS_CFV_1 <= '1';
            elsif ( counter_ref_1 < divide -1 ) then
                counter_ref_1 <= counter_ref_1 + 1;
                LEDS_CFV_1<='0';
            else
                LEDS_CFV_1 <='1';
                counter_ref_1<=0;
            end if;
        end if;
 end process;  


process (clk_ref_2) is
    begin                
        if rising_edge(clk_ref_2) then
            if ( counter_ref_2 < divide / 2 - 1) then
                counter_ref_2 <= counter_ref_2 + 1;
                LEDS_CFV_0 <= '1';
            elsif ( counter_ref_2 < divide -1 ) then
                counter_ref_2 <= counter_ref_2 + 1;
                LEDS_CFV_0<='0';
            else
                LEDS_CFV_0 <='1';
                counter_ref_2<=0;
            end if;
        end if;   
end process;    


process (clk_ref_3) is
    begin                   
        if rising_edge(clk_ref_3) then
            if ( counter_ref_3 < divide / 2 - 1) then
                counter_ref_3 <= counter_ref_3 + 1;
                LEDS_CFV_3 <= '1';
            elsif ( counter_ref_3 < divide -1 ) then
                counter_ref_3 <= counter_ref_3 + 1;
                LEDS_CFV_3<='0';
            else
                LEDS_CFV_3 <='1';
                counter_ref_3<=0;
            end if;
        end if;
end process;       

               
process (clk_ref_4) is
    begin
        if rising_edge(clk_ref_4) then
            if ( counter_ref_4 < divide / 2 - 1) then
                counter_ref_4 <= counter_ref_4 + 1;
                LEDS_CFV_2 <= '1';
            elsif ( counter_ref_4 < divide -1 ) then
                counter_ref_4 <= counter_ref_4 + 1;
                LEDS_CFV_2<='0';
            else
                LEDS_CFV_2 <='1';
                counter_ref_4<=0;
            end if;
        end if;
end process;

   
process (clk_ref_5) is
    begin
        if rising_edge(clk_ref_5) then
            if ( counter_ref_5 < divide / 2 - 1) then
                counter_ref_5 <= counter_ref_5 + 1;
                LEDS_CFV_5 <= '1';
            elsif ( counter_ref_5 < divide -1 ) then
                counter_ref_5 <= counter_ref_5 + 1;
                LEDS_CFV_5<='0';
            else
                LEDS_CFV_5 <='1';
                counter_ref_5<=0;
            end if;
        end if;
end process; 

     
process (clk_gp_6) is
    begin   
        if rising_edge(clk_gp_6) then
            if ( counter_gp_6 < divide / 2 - 1) then
                counter_gp_6 <= counter_gp_6 + 1;
                LEDS_CFV_4 <= '1';
            elsif ( counter_gp_6 < divide -1 ) then
                counter_gp_6 <= counter_gp_6 + 1;
                LEDS_CFV_4<='0';
            else
                LEDS_CFV_4 <='1';
                counter_gp_6<=0;
            end if;
        end if;
end process;

  
process (clk_gp_7) is
    begin
        if rising_edge(clk_gp_7) then
            if ( counter_gp_7 < divide / 2 - 1) then
                counter_gp_7 <= counter_gp_7 + 1;
                LEDS_CFV_7 <= '1';
            elsif ( counter_gp_7 < divide -1 ) then
                counter_gp_7 <= counter_gp_7 + 1;
                LEDS_CFV_7<='0';
            else
                LEDS_CFV_7 <='1';
                counter_gp_7<=0;
            end if;
        end if;
end process;

  
process (clk_emc) is
    begin
        if rising_edge(clk_emc) then
            if ( counter_emc < divide / 2 - 1) then
                counter_emc <= counter_emc + 1;
                LEDS_CFV_6 <= '1';
            elsif ( counter_emc < divide -1 ) then
                counter_emc <= counter_emc + 1;
                LEDS_CFV_6<='0';
            else
                LEDS_CFV_6 <='1';
                counter_emc<=0;
            end if;
        end if;
end process;

  
process (clk_lf) is
    begin
        if rising_edge(clk_lf) then
            LEDS_CFV_9 <= '1';
        end if;
        if falling_edge(clk_lf) then
            LEDS_CFV_9 <= '0';
        end if;
end process;


end Behavioral;
