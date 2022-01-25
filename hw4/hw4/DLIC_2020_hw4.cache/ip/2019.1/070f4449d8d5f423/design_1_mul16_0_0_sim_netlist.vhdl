-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Nov  9 17:01:17 2020
-- Host        : WEI-LAB-WINDOWS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_mul16_0_0_sim_netlist.vhdl
-- Design      : design_1_mul16_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mul16 is
  port (
    addr : out STD_LOGIC_VECTOR ( 1 downto 0 );
    W_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    W_req : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    R_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rst : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mul16;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mul16 is
  signal \C_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \C_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \^addr\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \indata_reg[0]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \indata_reg[1]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal \NLW_W_data__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_W_data__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_W_data__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_W_data__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_W_data__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_W_data__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_W_data__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_W_data__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_W_data__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_W_data__0_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal \NLW_W_data__0_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \C_state[1]_i_1\ : label is "soft_lutpair0";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \W_data__0\ : label is "{SYNTH-13 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \W_req[0]_INST_0\ : label is "soft_lutpair0";
begin
  addr(1 downto 0) <= \^addr\(1 downto 0);
\C_state[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^addr\(0),
      O => p_0_in
    );
\C_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^addr\(0),
      I1 => \^addr\(1),
      O => \C_state[1]_i_1_n_0\
    );
\C_state[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst,
      O => \C_state[1]_i_2_n_0\
    );
\C_state_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \C_state[1]_i_2_n_0\,
      D => p_0_in,
      Q => \^addr\(0)
    );
\C_state_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \C_state[1]_i_2_n_0\,
      D => \C_state[1]_i_1_n_0\,
      Q => \^addr\(1)
    );
\W_data__0\: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 0,
      ADREG => 1,
      ALUMODEREG => 0,
      AREG => 0,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BREG => 0,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREG => 0,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 16) => B"00000000000000",
      A(15 downto 0) => \indata_reg[0]\(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_W_data__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 16) => B"00",
      B(15 downto 0) => \indata_reg[1]\(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_W_data__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_W_data__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_W_data__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '0',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => '0',
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_W_data__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => \NLW_W_data__0_OVERFLOW_UNCONNECTED\,
      P(47 downto 32) => \NLW_W_data__0_P_UNCONNECTED\(47 downto 32),
      P(31 downto 0) => W_data(31 downto 0),
      PATTERNBDETECT => \NLW_W_data__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_W_data__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_W_data__0_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_W_data__0_UNDERFLOW_UNCONNECTED\
    );
\W_req[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^addr\(0),
      I1 => \^addr\(1),
      O => W_req(0)
    );
\indata_reg[0][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(0),
      Q => \indata_reg[0]\(0)
    );
\indata_reg[0][10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(10),
      Q => \indata_reg[0]\(10)
    );
\indata_reg[0][11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(11),
      Q => \indata_reg[0]\(11)
    );
\indata_reg[0][12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(12),
      Q => \indata_reg[0]\(12)
    );
\indata_reg[0][13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(13),
      Q => \indata_reg[0]\(13)
    );
\indata_reg[0][14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(14),
      Q => \indata_reg[0]\(14)
    );
\indata_reg[0][15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(15),
      Q => \indata_reg[0]\(15)
    );
\indata_reg[0][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(1),
      Q => \indata_reg[0]\(1)
    );
\indata_reg[0][2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(2),
      Q => \indata_reg[0]\(2)
    );
\indata_reg[0][3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(3),
      Q => \indata_reg[0]\(3)
    );
\indata_reg[0][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(4),
      Q => \indata_reg[0]\(4)
    );
\indata_reg[0][5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(5),
      Q => \indata_reg[0]\(5)
    );
\indata_reg[0][6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(6),
      Q => \indata_reg[0]\(6)
    );
\indata_reg[0][7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(7),
      Q => \indata_reg[0]\(7)
    );
\indata_reg[0][8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(8),
      Q => \indata_reg[0]\(8)
    );
\indata_reg[0][9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => \^addr\(0),
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(9),
      Q => \indata_reg[0]\(9)
    );
\indata_reg[1][0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(0),
      Q => \indata_reg[1]\(0)
    );
\indata_reg[1][10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(10),
      Q => \indata_reg[1]\(10)
    );
\indata_reg[1][11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(11),
      Q => \indata_reg[1]\(11)
    );
\indata_reg[1][12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(12),
      Q => \indata_reg[1]\(12)
    );
\indata_reg[1][13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(13),
      Q => \indata_reg[1]\(13)
    );
\indata_reg[1][14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(14),
      Q => \indata_reg[1]\(14)
    );
\indata_reg[1][15]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(15),
      Q => \indata_reg[1]\(15)
    );
\indata_reg[1][1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(1),
      Q => \indata_reg[1]\(1)
    );
\indata_reg[1][2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(2),
      Q => \indata_reg[1]\(2)
    );
\indata_reg[1][3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(3),
      Q => \indata_reg[1]\(3)
    );
\indata_reg[1][4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(4),
      Q => \indata_reg[1]\(4)
    );
\indata_reg[1][5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(5),
      Q => \indata_reg[1]\(5)
    );
\indata_reg[1][6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(6),
      Q => \indata_reg[1]\(6)
    );
\indata_reg[1][7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(7),
      Q => \indata_reg[1]\(7)
    );
\indata_reg[1][8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(8),
      Q => \indata_reg[1]\(8)
    );
\indata_reg[1][9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => p_0_in,
      CLR => \C_state[1]_i_2_n_0\,
      D => R_data(9),
      Q => \indata_reg[1]\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    R_req : out STD_LOGIC;
    addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    R_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    W_req : out STD_LOGIC_VECTOR ( 3 downto 0 );
    W_data : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_mul16_0_0,mul16,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "mul16,Vivado 2019.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^w_req\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^addr\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  R_req <= \<const1>\;
  W_req(3) <= \^w_req\(0);
  W_req(2) <= \^w_req\(0);
  W_req(1) <= \^w_req\(0);
  W_req(0) <= \^w_req\(0);
  addr(31) <= \<const0>\;
  addr(30) <= \<const0>\;
  addr(29) <= \<const0>\;
  addr(28) <= \<const0>\;
  addr(27) <= \<const0>\;
  addr(26) <= \<const0>\;
  addr(25) <= \<const0>\;
  addr(24) <= \<const0>\;
  addr(23) <= \<const0>\;
  addr(22) <= \<const0>\;
  addr(21) <= \<const0>\;
  addr(20) <= \<const0>\;
  addr(19) <= \<const0>\;
  addr(18) <= \<const0>\;
  addr(17) <= \<const0>\;
  addr(16) <= \<const0>\;
  addr(15) <= \<const0>\;
  addr(14) <= \<const0>\;
  addr(13) <= \<const0>\;
  addr(12) <= \<const0>\;
  addr(11) <= \<const0>\;
  addr(10) <= \<const0>\;
  addr(9) <= \<const0>\;
  addr(8) <= \<const0>\;
  addr(7) <= \<const0>\;
  addr(6) <= \<const0>\;
  addr(5) <= \<const0>\;
  addr(4) <= \<const0>\;
  addr(3 downto 2) <= \^addr\(3 downto 2);
  addr(1) <= \<const0>\;
  addr(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mul16
     port map (
      R_data(15 downto 0) => R_data(15 downto 0),
      W_data(31 downto 0) => W_data(31 downto 0),
      W_req(0) => \^w_req\(0),
      addr(1 downto 0) => \^addr\(3 downto 2),
      clk => clk,
      rst => rst
    );
end STRUCTURE;
