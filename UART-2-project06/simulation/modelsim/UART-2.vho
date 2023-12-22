-- Copyright (C) 2022  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.1 Build 850 06/23/2022 SJ Standard Edition"

-- DATE "12/22/2023 07:26:35"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	UART IS
    PORT (
	start : IN std_logic;
	din : IN std_logic_vector(7 DOWNTO 0);
	clk : IN std_logic;
	rst : IN std_logic;
	io : BUFFER std_logic;
	dout : BUFFER std_logic_vector(7 DOWNTO 0);
	done : BUFFER std_logic
	);
END UART;

-- Design Ports Information
-- dout[0]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[1]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[2]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[3]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[4]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[5]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[6]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[7]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- io	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[2]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[0]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[3]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[1]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[4]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[5]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[6]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[7]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UART IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_din : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_io : std_logic;
SIGNAL ww_dout : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_done : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \io~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \next_state.RECEIVE~0_combout\ : std_logic;
SIGNAL \bit_counter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \done~0_combout\ : std_logic;
SIGNAL \next_state.IDLE~0_combout\ : std_logic;
SIGNAL \next_state.RECEIVE~q\ : std_logic;
SIGNAL \current_state.RECEIVE~q\ : std_logic;
SIGNAL \next_state.IDLE~1_combout\ : std_logic;
SIGNAL \next_state.IDLE~q\ : std_logic;
SIGNAL \current_state.IDLE~q\ : std_logic;
SIGNAL \received_data[7]~2_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \bit_counter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \bit_counter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \received_data[0]~0_combout\ : std_logic;
SIGNAL \received_data[0]~1_combout\ : std_logic;
SIGNAL \received_data[3]~5_combout\ : std_logic;
SIGNAL \received_data[2]~4_combout\ : std_logic;
SIGNAL \received_data[1]~3_combout\ : std_logic;
SIGNAL \received_data[6]~6_combout\ : std_logic;
SIGNAL \received_data[6]~10_combout\ : std_logic;
SIGNAL \received_data[4]~7_combout\ : std_logic;
SIGNAL \received_parity~0_combout\ : std_logic;
SIGNAL \received_parity~1_combout\ : std_logic;
SIGNAL \received_parity~q\ : std_logic;
SIGNAL \received_data[7]~11_combout\ : std_logic;
SIGNAL \received_data[5]~8_combout\ : std_logic;
SIGNAL \received_data[5]~9_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \din[7]~input_o\ : std_logic;
SIGNAL \din[6]~input_o\ : std_logic;
SIGNAL \parity~1_combout\ : std_logic;
SIGNAL \din[3]~input_o\ : std_logic;
SIGNAL \din[1]~input_o\ : std_logic;
SIGNAL \din[4]~input_o\ : std_logic;
SIGNAL \din[0]~input_o\ : std_logic;
SIGNAL \din[2]~input_o\ : std_logic;
SIGNAL \din[5]~input_o\ : std_logic;
SIGNAL \parity~0_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \next_state.TRANSMIT~0_combout\ : std_logic;
SIGNAL \next_state.TRANSMIT~q\ : std_logic;
SIGNAL \current_state.TRANSMIT~feeder_combout\ : std_logic;
SIGNAL \current_state.TRANSMIT~q\ : std_logic;
SIGNAL \parity_bit~0_combout\ : std_logic;
SIGNAL \parity_bit~q\ : std_logic;
SIGNAL \Selector12~3_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Selector12~2_combout\ : std_logic;
SIGNAL \internal_io~q\ : std_logic;
SIGNAL \dout[0]~0_combout\ : std_logic;
SIGNAL \dout[0]~reg0_q\ : std_logic;
SIGNAL \dout[1]~reg0_q\ : std_logic;
SIGNAL \dout[2]~reg0_q\ : std_logic;
SIGNAL \dout[3]~reg0_q\ : std_logic;
SIGNAL \dout[4]~reg0_q\ : std_logic;
SIGNAL \dout[5]~reg0_q\ : std_logic;
SIGNAL \dout[6]~reg0_q\ : std_logic;
SIGNAL \dout[7]~reg0_q\ : std_logic;
SIGNAL \done~1_combout\ : std_logic;
SIGNAL \done~reg0_q\ : std_logic;
SIGNAL received_data : std_logic_vector(7 DOWNTO 0);
SIGNAL bit_counter : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_bit_counter[0]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_bit_counter[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_bit_counter[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_din[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_start~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_io~input_o\ : std_logic;
SIGNAL \ALT_INV_received_parity~0_combout\ : std_logic;
SIGNAL \ALT_INV_parity~1_combout\ : std_logic;
SIGNAL \ALT_INV_parity~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \ALT_INV_next_state.TRANSMIT~q\ : std_logic;
SIGNAL \ALT_INV_Selector12~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \ALT_INV_received_parity~q\ : std_logic;
SIGNAL \ALT_INV_parity_bit~q\ : std_logic;
SIGNAL \ALT_INV_Equal3~0_combout\ : std_logic;
SIGNAL \ALT_INV_current_state.TRANSMIT~q\ : std_logic;
SIGNAL \ALT_INV_internal_io~q\ : std_logic;
SIGNAL \ALT_INV_received_data[5]~8_combout\ : std_logic;
SIGNAL \ALT_INV_received_data[6]~6_combout\ : std_logic;
SIGNAL \ALT_INV_received_data[7]~2_combout\ : std_logic;
SIGNAL \ALT_INV_received_data[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_done~0_combout\ : std_logic;
SIGNAL ALT_INV_bit_counter : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_current_state.IDLE~q\ : std_logic;
SIGNAL ALT_INV_received_data : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_current_state.RECEIVE~q\ : std_logic;
SIGNAL \ALT_INV_done~reg0_q\ : std_logic;
SIGNAL \ALT_INV_Selector12~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;

BEGIN

ww_start <= start;
ww_din <= din;
ww_clk <= clk;
ww_rst <= rst;
io <= ww_io;
dout <= ww_dout;
done <= ww_done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_bit_counter[0]~DUPLICATE_q\ <= NOT \bit_counter[0]~DUPLICATE_q\;
\ALT_INV_bit_counter[2]~DUPLICATE_q\ <= NOT \bit_counter[2]~DUPLICATE_q\;
\ALT_INV_bit_counter[3]~DUPLICATE_q\ <= NOT \bit_counter[3]~DUPLICATE_q\;
\ALT_INV_din[7]~input_o\ <= NOT \din[7]~input_o\;
\ALT_INV_din[6]~input_o\ <= NOT \din[6]~input_o\;
\ALT_INV_din[5]~input_o\ <= NOT \din[5]~input_o\;
\ALT_INV_din[4]~input_o\ <= NOT \din[4]~input_o\;
\ALT_INV_din[1]~input_o\ <= NOT \din[1]~input_o\;
\ALT_INV_din[3]~input_o\ <= NOT \din[3]~input_o\;
\ALT_INV_din[0]~input_o\ <= NOT \din[0]~input_o\;
\ALT_INV_din[2]~input_o\ <= NOT \din[2]~input_o\;
\ALT_INV_start~input_o\ <= NOT \start~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_io~input_o\ <= NOT \io~input_o\;
\ALT_INV_received_parity~0_combout\ <= NOT \received_parity~0_combout\;
\ALT_INV_parity~1_combout\ <= NOT \parity~1_combout\;
\ALT_INV_parity~0_combout\ <= NOT \parity~0_combout\;
\ALT_INV_Add1~0_combout\ <= NOT \Add1~0_combout\;
\ALT_INV_Add0~0_combout\ <= NOT \Add0~0_combout\;
\ALT_INV_next_state.TRANSMIT~q\ <= NOT \next_state.TRANSMIT~q\;
\ALT_INV_Selector12~1_combout\ <= NOT \Selector12~1_combout\;
\ALT_INV_Selector12~0_combout\ <= NOT \Selector12~0_combout\;
\ALT_INV_process_0~0_combout\ <= NOT \process_0~0_combout\;
\ALT_INV_received_parity~q\ <= NOT \received_parity~q\;
\ALT_INV_parity_bit~q\ <= NOT \parity_bit~q\;
\ALT_INV_Equal3~0_combout\ <= NOT \Equal3~0_combout\;
\ALT_INV_current_state.TRANSMIT~q\ <= NOT \current_state.TRANSMIT~q\;
\ALT_INV_internal_io~q\ <= NOT \internal_io~q\;
\ALT_INV_received_data[5]~8_combout\ <= NOT \received_data[5]~8_combout\;
\ALT_INV_received_data[6]~6_combout\ <= NOT \received_data[6]~6_combout\;
\ALT_INV_received_data[7]~2_combout\ <= NOT \received_data[7]~2_combout\;
\ALT_INV_received_data[0]~0_combout\ <= NOT \received_data[0]~0_combout\;
\ALT_INV_done~0_combout\ <= NOT \done~0_combout\;
ALT_INV_bit_counter(0) <= NOT bit_counter(0);
\ALT_INV_current_state.IDLE~q\ <= NOT \current_state.IDLE~q\;
ALT_INV_received_data(7) <= NOT received_data(7);
ALT_INV_received_data(6) <= NOT received_data(6);
ALT_INV_received_data(5) <= NOT received_data(5);
ALT_INV_received_data(4) <= NOT received_data(4);
ALT_INV_received_data(3) <= NOT received_data(3);
ALT_INV_received_data(2) <= NOT received_data(2);
ALT_INV_received_data(1) <= NOT received_data(1);
ALT_INV_bit_counter(1) <= NOT bit_counter(1);
ALT_INV_bit_counter(2) <= NOT bit_counter(2);
ALT_INV_bit_counter(3) <= NOT bit_counter(3);
\ALT_INV_current_state.RECEIVE~q\ <= NOT \current_state.RECEIVE~q\;
ALT_INV_received_data(0) <= NOT received_data(0);
\ALT_INV_done~reg0_q\ <= NOT \done~reg0_q\;
\ALT_INV_Selector12~3_combout\ <= NOT \Selector12~3_combout\;
\ALT_INV_Mux0~4_combout\ <= NOT \Mux0~4_combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;

-- Location: IOOBUF_X89_Y36_N56
\dout[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(0));

-- Location: IOOBUF_X89_Y6_N39
\dout[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(1));

-- Location: IOOBUF_X89_Y36_N5
\dout[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(2));

-- Location: IOOBUF_X89_Y6_N56
\dout[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(3));

-- Location: IOOBUF_X89_Y36_N22
\dout[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[4]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(4));

-- Location: IOOBUF_X89_Y6_N22
\dout[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[5]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(5));

-- Location: IOOBUF_X89_Y6_N5
\dout[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[6]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(6));

-- Location: IOOBUF_X89_Y37_N56
\dout[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dout[7]~reg0_q\,
	devoe => ww_devoe,
	o => ww_dout(7));

-- Location: IOOBUF_X89_Y8_N5
\done~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \done~reg0_q\,
	devoe => ww_devoe,
	o => ww_done);

-- Location: IOOBUF_X89_Y9_N22
\io~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \internal_io~q\,
	oe => \ALT_INV_current_state.TRANSMIT~q\,
	devoe => ww_devoe,
	o => ww_io);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y9_N21
\io~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_io,
	o => \io~input_o\);

-- Location: IOIBUF_X89_Y8_N38
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X89_Y9_N4
\start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LABCELL_X88_Y21_N36
\next_state.RECEIVE~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.RECEIVE~0_combout\ = ( !\current_state.IDLE~q\ & ( (!\start~input_o\ & !\io~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_start~input_o\,
	datad => \ALT_INV_io~input_o\,
	dataf => \ALT_INV_current_state.IDLE~q\,
	combout => \next_state.RECEIVE~0_combout\);

-- Location: FF_X88_Y21_N32
\bit_counter[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector16~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_counter[0]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y21_N39
\done~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \done~0_combout\ = ( bit_counter(1) & ( (\bit_counter[3]~DUPLICATE_q\ & (((\bit_counter[2]~DUPLICATE_q\) # (\bit_counter[0]~DUPLICATE_q\)) # (\current_state.RECEIVE~q\))) ) ) # ( !bit_counter(1) & ( (\bit_counter[3]~DUPLICATE_q\ & 
-- \bit_counter[2]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000111000011110000011100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.RECEIVE~q\,
	datab => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	datac => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	datad => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	dataf => ALT_INV_bit_counter(1),
	combout => \done~0_combout\);

-- Location: LABCELL_X88_Y21_N54
\next_state.IDLE~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.IDLE~0_combout\ = ( \done~0_combout\ & ( !\rst~input_o\ ) ) # ( !\done~0_combout\ & ( (!\current_state.IDLE~q\ & !\rst~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_current_state.IDLE~q\,
	datad => \ALT_INV_rst~input_o\,
	dataf => \ALT_INV_done~0_combout\,
	combout => \next_state.IDLE~0_combout\);

-- Location: FF_X88_Y21_N38
\next_state.RECEIVE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.RECEIVE~0_combout\,
	ena => \next_state.IDLE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.RECEIVE~q\);

-- Location: FF_X88_Y21_N26
\current_state.RECEIVE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \next_state.RECEIVE~q\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.RECEIVE~q\);

-- Location: LABCELL_X88_Y21_N0
\next_state.IDLE~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.IDLE~1_combout\ = ( \current_state.IDLE~q\ & ( (!\current_state.RECEIVE~q\ & !\io~input_o\) ) ) # ( !\current_state.IDLE~q\ & ( (!\io~input_o\) # (\start~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100110011111111110011001111110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_start~input_o\,
	datac => \ALT_INV_current_state.RECEIVE~q\,
	datad => \ALT_INV_io~input_o\,
	dataf => \ALT_INV_current_state.IDLE~q\,
	combout => \next_state.IDLE~1_combout\);

-- Location: FF_X88_Y21_N2
\next_state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.IDLE~1_combout\,
	ena => \next_state.IDLE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.IDLE~q\);

-- Location: FF_X88_Y21_N44
\current_state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \next_state.IDLE~q\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.IDLE~q\);

-- Location: FF_X88_Y21_N10
\bit_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector13~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter(3));

-- Location: LABCELL_X88_Y21_N6
\received_data[7]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[7]~2_combout\ = ( \bit_counter[0]~DUPLICATE_q\ & ( (\bit_counter[2]~DUPLICATE_q\ & bit_counter(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datad => ALT_INV_bit_counter(1),
	dataf => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	combout => \received_data[7]~2_combout\);

-- Location: LABCELL_X88_Y21_N9
\Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = ( \received_data[7]~2_combout\ ) # ( !\received_data[7]~2_combout\ & ( bit_counter(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_bit_counter(3),
	dataf => \ALT_INV_received_data[7]~2_combout\,
	combout => \Selector13~0_combout\);

-- Location: FF_X88_Y21_N11
\bit_counter[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector13~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_counter[3]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y21_N30
\Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = ( \current_state.RECEIVE~q\ & ( !bit_counter(0) $ (((\bit_counter[3]~DUPLICATE_q\ & ((\bit_counter[2]~DUPLICATE_q\) # (bit_counter(1)))))) ) ) # ( !\current_state.RECEIVE~q\ & ( (!\bit_counter[3]~DUPLICATE_q\ & 
-- (((!bit_counter(0))))) # (\bit_counter[3]~DUPLICATE_q\ & ((!\bit_counter[2]~DUPLICATE_q\ & ((!bit_counter(0)) # (bit_counter(1)))) # (\bit_counter[2]~DUPLICATE_q\ & ((bit_counter(0)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110000010011111111000001001111101100000100111110110000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(1),
	datab => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	datac => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datad => ALT_INV_bit_counter(0),
	dataf => \ALT_INV_current_state.RECEIVE~q\,
	combout => \Selector16~0_combout\);

-- Location: FF_X88_Y21_N31
\bit_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector16~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter(0));

-- Location: FF_X88_Y21_N34
\bit_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector14~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter(2));

-- Location: MLABCELL_X87_Y21_N3
\Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (!bit_counter(1) & (bit_counter(0) & ((!bit_counter(3)) # (!bit_counter(2))))) # (bit_counter(1) & ((!bit_counter(0)) # ((bit_counter(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011101100101011001110110010101100111011001010110011101100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(1),
	datab => ALT_INV_bit_counter(0),
	datac => ALT_INV_bit_counter(3),
	datad => ALT_INV_bit_counter(2),
	combout => \Selector15~0_combout\);

-- Location: FF_X87_Y21_N26
\bit_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector15~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bit_counter(1));

-- Location: LABCELL_X88_Y21_N33
\Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = ( \bit_counter[0]~DUPLICATE_q\ & ( !bit_counter(2) $ (((!bit_counter(1)) # (\bit_counter[3]~DUPLICATE_q\))) ) ) # ( !\bit_counter[0]~DUPLICATE_q\ & ( bit_counter(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010000101011110101000010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(1),
	datac => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	datad => ALT_INV_bit_counter(2),
	dataf => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	combout => \Selector14~0_combout\);

-- Location: FF_X88_Y21_N35
\bit_counter[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector14~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_counter[2]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y21_N24
\received_data[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[0]~0_combout\ = ( !\bit_counter[3]~DUPLICATE_q\ & ( (!\bit_counter[2]~DUPLICATE_q\ & \current_state.RECEIVE~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datad => \ALT_INV_current_state.RECEIVE~q\,
	dataf => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	combout => \received_data[0]~0_combout\);

-- Location: LABCELL_X88_Y21_N21
\received_data[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[0]~1_combout\ = ( \bit_counter[0]~DUPLICATE_q\ & ( received_data(0) ) ) # ( !\bit_counter[0]~DUPLICATE_q\ & ( (!\received_data[0]~0_combout\ & (((received_data(0))))) # (\received_data[0]~0_combout\ & ((!bit_counter(1) & (\io~input_o\)) # 
-- (bit_counter(1) & ((received_data(0)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000011011111000100001101111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datab => \ALT_INV_received_data[0]~0_combout\,
	datac => ALT_INV_bit_counter(1),
	datad => ALT_INV_received_data(0),
	dataf => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	combout => \received_data[0]~1_combout\);

-- Location: FF_X88_Y21_N23
\received_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[0]~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(0));

-- Location: LABCELL_X88_Y21_N18
\received_data[3]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[3]~5_combout\ = ( \bit_counter[0]~DUPLICATE_q\ & ( (!\received_data[0]~0_combout\ & (((received_data(3))))) # (\received_data[0]~0_combout\ & ((!bit_counter(1) & ((received_data(3)))) # (bit_counter(1) & (\io~input_o\)))) ) ) # ( 
-- !\bit_counter[0]~DUPLICATE_q\ & ( received_data(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000001111111010000000111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datab => \ALT_INV_received_data[0]~0_combout\,
	datac => ALT_INV_bit_counter(1),
	datad => ALT_INV_received_data(3),
	dataf => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	combout => \received_data[3]~5_combout\);

-- Location: FF_X88_Y21_N20
\received_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[3]~5_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(3));

-- Location: LABCELL_X88_Y21_N57
\received_data[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[2]~4_combout\ = ( bit_counter(0) & ( received_data(2) ) ) # ( !bit_counter(0) & ( (!\received_data[0]~0_combout\ & (((received_data(2))))) # (\received_data[0]~0_combout\ & ((!bit_counter(1) & ((received_data(2)))) # (bit_counter(1) & 
-- (\io~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111101000000011111110100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datab => \ALT_INV_received_data[0]~0_combout\,
	datac => ALT_INV_bit_counter(1),
	datad => ALT_INV_received_data(2),
	dataf => ALT_INV_bit_counter(0),
	combout => \received_data[2]~4_combout\);

-- Location: FF_X88_Y21_N59
\received_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[2]~4_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(2));

-- Location: LABCELL_X88_Y21_N12
\received_data[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[1]~3_combout\ = ( \bit_counter[0]~DUPLICATE_q\ & ( (!bit_counter(1) & ((!\received_data[0]~0_combout\ & ((received_data(1)))) # (\received_data[0]~0_combout\ & (\io~input_o\)))) # (bit_counter(1) & (((received_data(1))))) ) ) # ( 
-- !\bit_counter[0]~DUPLICATE_q\ & ( received_data(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000010110111110000001011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(1),
	datab => \ALT_INV_received_data[0]~0_combout\,
	datac => \ALT_INV_io~input_o\,
	datad => ALT_INV_received_data(1),
	dataf => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	combout => \received_data[1]~3_combout\);

-- Location: FF_X88_Y21_N14
\received_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[1]~3_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(1));

-- Location: LABCELL_X88_Y21_N42
\received_data[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[6]~6_combout\ = ( \current_state.RECEIVE~q\ & ( (\bit_counter[2]~DUPLICATE_q\ & (!\bit_counter[3]~DUPLICATE_q\ & !bit_counter(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000000010000000100000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datab => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	datac => ALT_INV_bit_counter(0),
	dataf => \ALT_INV_current_state.RECEIVE~q\,
	combout => \received_data[6]~6_combout\);

-- Location: MLABCELL_X87_Y21_N12
\received_data[6]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[6]~10_combout\ = ( bit_counter(1) & ( (!\received_data[6]~6_combout\ & ((received_data(6)))) # (\received_data[6]~6_combout\ & (\io~input_o\)) ) ) # ( !bit_counter(1) & ( received_data(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000101111101010000010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datac => \ALT_INV_received_data[6]~6_combout\,
	datad => ALT_INV_received_data(6),
	dataf => ALT_INV_bit_counter(1),
	combout => \received_data[6]~10_combout\);

-- Location: FF_X87_Y21_N14
\received_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[6]~10_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(6));

-- Location: MLABCELL_X87_Y21_N39
\received_data[4]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[4]~7_combout\ = ( bit_counter(1) & ( received_data(4) ) ) # ( !bit_counter(1) & ( (!\received_data[6]~6_combout\ & ((received_data(4)))) # (\received_data[6]~6_combout\ & (\io~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111110101000001011111010100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datac => \ALT_INV_received_data[6]~6_combout\,
	datad => ALT_INV_received_data(4),
	dataf => ALT_INV_bit_counter(1),
	combout => \received_data[4]~7_combout\);

-- Location: FF_X87_Y21_N41
\received_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[4]~7_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(4));

-- Location: LABCELL_X88_Y21_N51
\received_parity~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_parity~0_combout\ = ( \current_state.RECEIVE~q\ & ( (!bit_counter(0) & !bit_counter(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(0),
	datad => ALT_INV_bit_counter(1),
	dataf => \ALT_INV_current_state.RECEIVE~q\,
	combout => \received_parity~0_combout\);

-- Location: LABCELL_X88_Y21_N45
\received_parity~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_parity~1_combout\ = ( \received_parity~0_combout\ & ( (!\bit_counter[2]~DUPLICATE_q\ & ((!\bit_counter[3]~DUPLICATE_q\ & ((\received_parity~q\))) # (\bit_counter[3]~DUPLICATE_q\ & (\io~input_o\)))) # (\bit_counter[2]~DUPLICATE_q\ & 
-- (((\received_parity~q\)))) ) ) # ( !\received_parity~0_combout\ & ( \received_parity~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000010110111110000001011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datab => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	datac => \ALT_INV_io~input_o\,
	datad => \ALT_INV_received_parity~q\,
	dataf => \ALT_INV_received_parity~0_combout\,
	combout => \received_parity~1_combout\);

-- Location: FF_X88_Y21_N47
received_parity : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_parity~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \received_parity~q\);

-- Location: MLABCELL_X87_Y21_N36
\received_data[7]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[7]~11_combout\ = ( \current_state.RECEIVE~q\ & ( (!bit_counter(3) & ((!\received_data[7]~2_combout\ & ((received_data(7)))) # (\received_data[7]~2_combout\ & (\io~input_o\)))) # (bit_counter(3) & (((received_data(7))))) ) ) # ( 
-- !\current_state.RECEIVE~q\ & ( received_data(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000100111101110000010011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datab => ALT_INV_bit_counter(3),
	datac => \ALT_INV_received_data[7]~2_combout\,
	datad => ALT_INV_received_data(7),
	dataf => \ALT_INV_current_state.RECEIVE~q\,
	combout => \received_data[7]~11_combout\);

-- Location: FF_X87_Y21_N38
\received_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[7]~11_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(7));

-- Location: LABCELL_X88_Y21_N15
\received_data[5]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[5]~8_combout\ = ( \bit_counter[2]~DUPLICATE_q\ & ( (\bit_counter[0]~DUPLICATE_q\ & !bit_counter(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	datad => ALT_INV_bit_counter(1),
	dataf => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	combout => \received_data[5]~8_combout\);

-- Location: MLABCELL_X87_Y21_N15
\received_data[5]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \received_data[5]~9_combout\ = ( \current_state.RECEIVE~q\ & ( (!bit_counter(3) & ((!\received_data[5]~8_combout\ & ((received_data(5)))) # (\received_data[5]~8_combout\ & (\io~input_o\)))) # (bit_counter(3) & (((received_data(5))))) ) ) # ( 
-- !\current_state.RECEIVE~q\ & ( received_data(5) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000100111101110000010011110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datab => ALT_INV_bit_counter(3),
	datac => \ALT_INV_received_data[5]~8_combout\,
	datad => ALT_INV_received_data(5),
	dataf => \ALT_INV_current_state.RECEIVE~q\,
	combout => \received_data[5]~9_combout\);

-- Location: FF_X87_Y21_N17
\received_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \received_data[5]~9_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => received_data(5));

-- Location: MLABCELL_X87_Y21_N6
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( received_data(5) & ( !received_data(6) $ (!received_data(4) $ (!\received_parity~q\ $ (received_data(7)))) ) ) # ( !received_data(5) & ( !received_data(6) $ (!received_data(4) $ (!\received_parity~q\ $ (!received_data(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110011010011001011010010110011010011001011001101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_received_data(6),
	datab => ALT_INV_received_data(4),
	datac => \ALT_INV_received_parity~q\,
	datad => ALT_INV_received_data(7),
	dataf => ALT_INV_received_data(5),
	combout => \process_0~0_combout\);

-- Location: IOIBUF_X89_Y9_N38
\din[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(7),
	o => \din[7]~input_o\);

-- Location: IOIBUF_X89_Y9_N55
\din[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(6),
	o => \din[6]~input_o\);

-- Location: MLABCELL_X87_Y21_N24
\parity~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \parity~1_combout\ = ( \din[6]~input_o\ & ( !\din[7]~input_o\ ) ) # ( !\din[6]~input_o\ & ( \din[7]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_din[7]~input_o\,
	dataf => \ALT_INV_din[6]~input_o\,
	combout => \parity~1_combout\);

-- Location: IOIBUF_X89_Y35_N95
\din[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(3),
	o => \din[3]~input_o\);

-- Location: IOIBUF_X89_Y8_N21
\din[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(1),
	o => \din[1]~input_o\);

-- Location: IOIBUF_X89_Y35_N78
\din[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(4),
	o => \din[4]~input_o\);

-- Location: IOIBUF_X89_Y36_N38
\din[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(0),
	o => \din[0]~input_o\);

-- Location: IOIBUF_X89_Y35_N44
\din[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(2),
	o => \din[2]~input_o\);

-- Location: IOIBUF_X89_Y8_N55
\din[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(5),
	o => \din[5]~input_o\);

-- Location: LABCELL_X85_Y21_N15
\parity~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \parity~0_combout\ = ( \din[2]~input_o\ & ( \din[5]~input_o\ & ( !\din[3]~input_o\ $ (!\din[1]~input_o\ $ (!\din[4]~input_o\ $ (!\din[0]~input_o\))) ) ) ) # ( !\din[2]~input_o\ & ( \din[5]~input_o\ & ( !\din[3]~input_o\ $ (!\din[1]~input_o\ $ 
-- (!\din[4]~input_o\ $ (\din[0]~input_o\))) ) ) ) # ( \din[2]~input_o\ & ( !\din[5]~input_o\ & ( !\din[3]~input_o\ $ (!\din[1]~input_o\ $ (!\din[4]~input_o\ $ (\din[0]~input_o\))) ) ) ) # ( !\din[2]~input_o\ & ( !\din[5]~input_o\ & ( !\din[3]~input_o\ $ 
-- (!\din[1]~input_o\ $ (!\din[4]~input_o\ $ (!\din[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110010110100101100110100110010110011010010110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[3]~input_o\,
	datab => \ALT_INV_din[1]~input_o\,
	datac => \ALT_INV_din[4]~input_o\,
	datad => \ALT_INV_din[0]~input_o\,
	datae => \ALT_INV_din[2]~input_o\,
	dataf => \ALT_INV_din[5]~input_o\,
	combout => \parity~0_combout\);

-- Location: MLABCELL_X87_Y21_N0
\Equal3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!bit_counter(1) & (bit_counter(0) & (!\bit_counter[2]~DUPLICATE_q\ & \bit_counter[3]~DUPLICATE_q\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000010000000000000001000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(1),
	datab => ALT_INV_bit_counter(0),
	datac => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datad => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	combout => \Equal3~0_combout\);

-- Location: LABCELL_X88_Y21_N3
\next_state.TRANSMIT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state.TRANSMIT~0_combout\ = ( \done~0_combout\ & ( (!\current_state.IDLE~q\ & (((\start~input_o\)))) # (\current_state.IDLE~q\ & (!\current_state.RECEIVE~q\ & ((!\io~input_o\)))) ) ) # ( !\done~0_combout\ & ( (\start~input_o\ & 
-- ((!\current_state.IDLE~q\) # ((!\current_state.RECEIVE~q\ & !\io~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000110000001100100011000000111010001100000011101000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_current_state.RECEIVE~q\,
	datab => \ALT_INV_start~input_o\,
	datac => \ALT_INV_current_state.IDLE~q\,
	datad => \ALT_INV_io~input_o\,
	dataf => \ALT_INV_done~0_combout\,
	combout => \next_state.TRANSMIT~0_combout\);

-- Location: FF_X88_Y21_N4
\next_state.TRANSMIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \next_state.TRANSMIT~0_combout\,
	ena => \next_state.IDLE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \next_state.TRANSMIT~q\);

-- Location: LABCELL_X85_Y21_N48
\current_state.TRANSMIT~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \current_state.TRANSMIT~feeder_combout\ = ( \next_state.TRANSMIT~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_next_state.TRANSMIT~q\,
	combout => \current_state.TRANSMIT~feeder_combout\);

-- Location: FF_X85_Y21_N50
\current_state.TRANSMIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \current_state.TRANSMIT~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.TRANSMIT~q\);

-- Location: LABCELL_X85_Y21_N54
\parity_bit~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \parity_bit~0_combout\ = ( \parity_bit~q\ & ( \current_state.TRANSMIT~q\ & ( (!\Equal3~0_combout\) # ((!\parity~1_combout\ $ (!\parity~0_combout\)) # (\rst~input_o\)) ) ) ) # ( !\parity_bit~q\ & ( \current_state.TRANSMIT~q\ & ( (\Equal3~0_combout\ & 
-- (!\rst~input_o\ & (!\parity~1_combout\ $ (!\parity~0_combout\)))) ) ) ) # ( \parity_bit~q\ & ( !\current_state.TRANSMIT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000110000000001111011011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_parity~1_combout\,
	datab => \ALT_INV_parity~0_combout\,
	datac => \ALT_INV_Equal3~0_combout\,
	datad => \ALT_INV_rst~input_o\,
	datae => \ALT_INV_parity_bit~q\,
	dataf => \ALT_INV_current_state.TRANSMIT~q\,
	combout => \parity_bit~0_combout\);

-- Location: FF_X85_Y21_N55
parity_bit : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \parity_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \parity_bit~q\);

-- Location: MLABCELL_X87_Y21_N54
\Selector12~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~3_combout\ = ( !\current_state.RECEIVE~q\ & ( (((\parity_bit~q\))) ) ) # ( \current_state.RECEIVE~q\ & ( !received_data(0) $ (!received_data(3) $ (!received_data(2) $ (!received_data(1) $ (!\process_0~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111100001111100101100110100100001111000011110110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_received_data(0),
	datab => ALT_INV_received_data(3),
	datac => ALT_INV_received_data(2),
	datad => ALT_INV_received_data(1),
	datae => \ALT_INV_current_state.RECEIVE~q\,
	dataf => \ALT_INV_process_0~0_combout\,
	datag => \ALT_INV_parity_bit~q\,
	combout => \Selector12~3_combout\);

-- Location: LABCELL_X88_Y21_N48
\Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = ( !\current_state.RECEIVE~q\ & ( !bit_counter(3) $ (((!bit_counter(0) & (!bit_counter(1) & !\bit_counter[2]~DUPLICATE_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111110000000011111111000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(0),
	datab => ALT_INV_bit_counter(1),
	datac => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datad => ALT_INV_bit_counter(3),
	dataf => \ALT_INV_current_state.RECEIVE~q\,
	combout => \Selector12~0_combout\);

-- Location: MLABCELL_X87_Y21_N48
\Selector12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = ( \bit_counter[3]~DUPLICATE_q\ & ( bit_counter(1) & ( ((!\current_state.RECEIVE~q\ & (!\bit_counter[2]~DUPLICATE_q\ & !bit_counter(0)))) # (\internal_io~q\) ) ) ) # ( !\bit_counter[3]~DUPLICATE_q\ & ( bit_counter(1) & ( 
-- (\internal_io~q\ & \current_state.RECEIVE~q\) ) ) ) # ( \bit_counter[3]~DUPLICATE_q\ & ( !bit_counter(1) & ( (\internal_io~q\ & (((\current_state.RECEIVE~q\ & !bit_counter(0))) # (\bit_counter[2]~DUPLICATE_q\))) ) ) ) # ( !\bit_counter[3]~DUPLICATE_q\ & ( 
-- !bit_counter(1) & ( (\internal_io~q\ & \current_state.RECEIVE~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000101010000010100010001000100011101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_internal_io~q\,
	datab => \ALT_INV_current_state.RECEIVE~q\,
	datac => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	datad => ALT_INV_bit_counter(0),
	datae => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	dataf => ALT_INV_bit_counter(1),
	combout => \Selector12~1_combout\);

-- Location: MLABCELL_X87_Y21_N21
\Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = ( bit_counter(1) & ( !bit_counter(2) ) ) # ( !bit_counter(1) & ( !bit_counter(2) $ (!bit_counter(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_bit_counter(2),
	datad => ALT_INV_bit_counter(0),
	dataf => ALT_INV_bit_counter(1),
	combout => \Add0~0_combout\);

-- Location: MLABCELL_X87_Y21_N9
\Add1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = ( \bit_counter[0]~DUPLICATE_q\ & ( !bit_counter(1) ) ) # ( !\bit_counter[0]~DUPLICATE_q\ & ( bit_counter(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_bit_counter(1),
	dataf => \ALT_INV_bit_counter[0]~DUPLICATE_q\,
	combout => \Add1~0_combout\);

-- Location: MLABCELL_X87_Y21_N30
\Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = ( !\Add1~0_combout\ & ( (!bit_counter(0) & (((\din[7]~input_o\ & ((!\Add0~0_combout\)))))) # (bit_counter(0) & ((((\Add0~0_combout\))) # (\din[6]~input_o\))) ) ) # ( \Add1~0_combout\ & ( ((!bit_counter(0) & (\din[5]~input_o\ & 
-- ((!\Add0~0_combout\)))) # (bit_counter(0) & (((\Add0~0_combout\) # (\din[4]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001110100011101000011000011111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[6]~input_o\,
	datab => ALT_INV_bit_counter(0),
	datac => \ALT_INV_din[5]~input_o\,
	datad => \ALT_INV_din[4]~input_o\,
	datae => \ALT_INV_Add1~0_combout\,
	dataf => \ALT_INV_Add0~0_combout\,
	datag => \ALT_INV_din[7]~input_o\,
	combout => \Mux0~4_combout\);

-- Location: MLABCELL_X87_Y21_N42
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( !\Add1~0_combout\ & ( (!\Add0~0_combout\ & ((((\Mux0~4_combout\))))) # (\Add0~0_combout\ & (((!\Mux0~4_combout\ & (\din[3]~input_o\)) # (\Mux0~4_combout\ & ((\din[2]~input_o\)))))) ) ) # ( \Add1~0_combout\ & ( (!\Add0~0_combout\ & 
-- ((((\Mux0~4_combout\))))) # (\Add0~0_combout\ & (((!\Mux0~4_combout\ & ((\din[1]~input_o\))) # (\Mux0~4_combout\ & (\din[0]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000010100000101000001010000010110101010111111111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add0~0_combout\,
	datab => \ALT_INV_din[0]~input_o\,
	datac => \ALT_INV_din[1]~input_o\,
	datad => \ALT_INV_din[2]~input_o\,
	datae => \ALT_INV_Add1~0_combout\,
	dataf => \ALT_INV_Mux0~4_combout\,
	datag => \ALT_INV_din[3]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: MLABCELL_X87_Y21_N18
\Selector12~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~2_combout\ = ( \Mux0~0_combout\ & ( (((\Selector12~3_combout\ & \Equal3~0_combout\)) # (\Selector12~1_combout\)) # (\Selector12~0_combout\) ) ) # ( !\Mux0~0_combout\ & ( ((\Selector12~3_combout\ & \Equal3~0_combout\)) # 
-- (\Selector12~1_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011111000011110101111100111111011111110011111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector12~3_combout\,
	datab => \ALT_INV_Selector12~0_combout\,
	datac => \ALT_INV_Selector12~1_combout\,
	datad => \ALT_INV_Equal3~0_combout\,
	dataf => \ALT_INV_Mux0~0_combout\,
	combout => \Selector12~2_combout\);

-- Location: FF_X87_Y21_N20
internal_io : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector12~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \current_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \internal_io~q\);

-- Location: MLABCELL_X87_Y21_N27
\dout[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dout[0]~0_combout\ = ( \bit_counter[2]~DUPLICATE_q\ & ( (!\rst~input_o\ & (\current_state.RECEIVE~q\ & \bit_counter[3]~DUPLICATE_q\)) ) ) # ( !\bit_counter[2]~DUPLICATE_q\ & ( (bit_counter(1) & (!\rst~input_o\ & (\current_state.RECEIVE~q\ & 
-- \bit_counter[3]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_bit_counter(1),
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_current_state.RECEIVE~q\,
	datad => \ALT_INV_bit_counter[3]~DUPLICATE_q\,
	dataf => \ALT_INV_bit_counter[2]~DUPLICATE_q\,
	combout => \dout[0]~0_combout\);

-- Location: FF_X87_Y21_N31
\dout[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(0),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[0]~reg0_q\);

-- Location: FF_X87_Y21_N4
\dout[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(1),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[1]~reg0_q\);

-- Location: FF_X87_Y21_N43
\dout[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(2),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[2]~reg0_q\);

-- Location: FF_X87_Y21_N11
\dout[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(3),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[3]~reg0_q\);

-- Location: FF_X87_Y21_N2
\dout[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(4),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[4]~reg0_q\);

-- Location: FF_X87_Y21_N55
\dout[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(5),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[5]~reg0_q\);

-- Location: FF_X87_Y21_N49
\dout[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(6),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[6]~reg0_q\);

-- Location: FF_X87_Y21_N8
\dout[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => received_data(7),
	sload => VCC,
	ena => \dout[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dout[7]~reg0_q\);

-- Location: LABCELL_X88_Y21_N27
\done~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \done~1_combout\ = ( \current_state.RECEIVE~q\ & ( ((\done~0_combout\ & \current_state.IDLE~q\)) # (\done~reg0_q\) ) ) # ( !\current_state.RECEIVE~q\ & ( (!\done~0_combout\ & (((\done~reg0_q\)))) # (\done~0_combout\ & ((!\current_state.IDLE~q\ & 
-- ((\done~reg0_q\))) # (\current_state.IDLE~q\ & (\io~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111101000000011111110100000011111111110000001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_io~input_o\,
	datab => \ALT_INV_done~0_combout\,
	datac => \ALT_INV_current_state.IDLE~q\,
	datad => \ALT_INV_done~reg0_q\,
	dataf => \ALT_INV_current_state.RECEIVE~q\,
	combout => \done~1_combout\);

-- Location: FF_X88_Y21_N28
\done~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \done~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \done~reg0_q\);

-- Location: LABCELL_X68_Y37_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


