-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Oct 27 23:45:29 2020
-- Host        : WEI-LAB-WINDOWS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_adder_2b_0_0_sim_netlist.vhdl
-- Design      : design_1_adder_2b_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_adder_2b is
  port (
    out_4b : out STD_LOGIC_VECTOR ( 1 downto 0 );
    in_4b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sw0 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_adder_2b;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_adder_2b is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \out_4b[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \out_4b[1]_INST_0\ : label is "soft_lutpair0";
begin
\out_4b[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => in_4b(2),
      I1 => in_4b(0),
      O => out_4b(0)
    );
\out_4b[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"874B78B4"
    )
        port map (
      I0 => in_4b(2),
      I1 => in_4b(0),
      I2 => in_4b(3),
      I3 => sw0,
      I4 => in_4b(1),
      O => out_4b(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    in_4b : in STD_LOGIC_VECTOR ( 3 downto 0 );
    sw0 : in STD_LOGIC;
    out_4b : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_adder_2b_0_0,adder_2b,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "adder_2b,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_adder_2b
     port map (
      in_4b(3 downto 0) => in_4b(3 downto 0),
      out_4b(1 downto 0) => out_4b(1 downto 0),
      sw0 => sw0
    );
\out_4b[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F88020F2"
    )
        port map (
      I0 => in_4b(0),
      I1 => in_4b(2),
      I2 => in_4b(1),
      I3 => in_4b(3),
      I4 => sw0,
      O => out_4b(2)
    );
\out_4b[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000020F2"
    )
        port map (
      I0 => in_4b(0),
      I1 => in_4b(2),
      I2 => in_4b(1),
      I3 => in_4b(3),
      I4 => sw0,
      O => out_4b(3)
    );
end STRUCTURE;
