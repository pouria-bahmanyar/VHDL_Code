library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "counter_sysgen"

entity counter_sysgen is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    gateway_in: in std_logic; 
    gateway_out: out std_logic_vector(7 downto 0)
  );
end counter_sysgen;

architecture structural of counter_sysgen is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "counter_sysgen,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,compilation=NGC_Netlist,sample_periods=1.00000000000,testbench=0,total_blocks=10,xilinx_counter_block=1,xilinx_gateway_in_block=1,xilinx_gateway_out_block=1,xilinx_system_generator_block=1,}";

  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal gateway_in_net: std_logic;
  signal gateway_out_net: std_logic_vector(7 downto 0);

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  gateway_in_net <= gateway_in;
  gateway_out <= gateway_out_net;

  counter: entity work.xlcounter_limit_counter_sysgen
    generic map (
      cnt_15_0 => 120,
      cnt_31_16 => 0,
      cnt_47_32 => 0,
      cnt_63_48 => 0,
      core_name0 => "cntr_11_0_73e33e5e2adb7d8c",
      count_limited => 1,
      op_arith => xlUnsigned,
      op_width => 8
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en => "1",
      rst => "0",
      up(0) => gateway_in_net,
      op => gateway_out_net
    );

end structural;
