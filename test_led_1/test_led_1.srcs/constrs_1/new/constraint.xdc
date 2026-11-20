## This file is a general .xdc for the ZYBO Rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used signals according to the project
#############################################
##Clock signal
##IO_L11P_T1_SRCC_35
###############################################	
#set_property PACKAGE_PIN L16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports clk]

#create_generated_clock -name clk\-source [get_ports clk] \-divide_by 17 \[get_pins {instance_name/mmcm_inst/clk}]

##############################################
###Switches
##############################################

###IO_L19N_T3_VREF_35
set_property PACKAGE_PIN G15 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

###IO_L24P_T3_34
#set_property PACKAGE_PIN P15 [get_ports {switch2_0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {switch2_0}]

##IO_L4N_T0_34
#set_property PACKAGE_PIN W13 [get_ports {A1_0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {A1_0}]

##IO_L9P_T1_DQS_34
#set_property PACKAGE_PIN T16 [get_ports {A0_0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {A0_0}]

#############################################
##Buttons
#############################################

##IO_L20N_T3_34
#set_property PACKAGE_PIN R18 [get_ports {Button_3}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Button_3}]

###IO_L24N_T3_34
#set_property PACKAGE_PIN P16 [get_ports {Button_2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Button_2}]

###IO_L18P_T2_34
#set_property PACKAGE_PIN V16 [get_ports {Button_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Button_1}]

###IO_L7P_T1_34
#set_property PACKAGE_PIN Y16 [get_ports {Button_0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Button_0}]

#############################################
##LEDs
##IO_L23P_T3_35
#############################################

#set_property PACKAGE_PIN M14 [get_ports {y}]
#set_property IOSTANDARD LVCMOS33 [get_ports {y}]

##IO_L23N_T3_35
#set_property PACKAGE_PIN M15 [get_ports {y_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {y_1}]

##IO_0_35
#set_property PACKAGE_PIN G14 [get_ports {y_2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {y_2}]

##IO_L3N_T0_DQS_AD1N_35
#set_property PACKAGE_PIN D18 [get_ports T_x1]
#set_property IOSTANDARD LVCMOS33 [get_ports T_x1]


#############################################
##Pmod Header JB

#############################################

##IO_L15P_T2_DQS_34
set_property PACKAGE_PIN T20 [get_ports {a1}]
set_property IOSTANDARD LVCMOS33 [get_ports {a1}]

##IO_L15N_T2_DQS_34
set_property PACKAGE_PIN U20 [get_ports {a2}]
set_property IOSTANDARD LVCMOS33 [get_ports {a2}]

##IO_L16P_T2_34
set_property PACKAGE_PIN V20 [get_ports {a3}]
set_property IOSTANDARD LVCMOS33 [get_ports {a3}]

##IO_L16N_T2_34
set_property PACKAGE_PIN W20 [get_ports {a4}]
set_property IOSTANDARD LVCMOS33 [get_ports {a4}]

##IO_L17P_T2_34
set_property PACKAGE_PIN Y18 [get_ports {a5}]
set_property IOSTANDARD LVCMOS33 [get_ports {a5}]

##IO_L17N_T2_34
set_property PACKAGE_PIN Y19 [get_ports {a6}]
set_property IOSTANDARD LVCMOS33 [get_ports {a6}]

##IO_L22P_T3_34
set_property PACKAGE_PIN W18 [get_ports {a7}]
set_property IOSTANDARD LVCMOS33 [get_ports {a7}]

##IO_L22N_T3_34
set_property PACKAGE_PIN W19 [get_ports {a8}]
set_property IOSTANDARD LVCMOS33 [get_ports {a8}]

#############################################
##Pmod Header JC

#############################################

##IO_L10P_T1_34
set_property PACKAGE_PIN V15 [get_ports {b1}]
set_property IOSTANDARD LVCMOS33 [get_ports {b1}]

##IO_L10N_T1_34
set_property PACKAGE_PIN W15 [get_ports {b2}]
set_property IOSTANDARD LVCMOS33 [get_ports {b2}]

##IO_L1P_T0_34
set_property PACKAGE_PIN T11 [get_ports {b3}]
set_property IOSTANDARD LVCMOS33 [get_ports {b3}]

##IO_L1N_T0_34
set_property PACKAGE_PIN T10 [get_ports {b4}]
set_property IOSTANDARD LVCMOS33 [get_ports {b4}]

##IO_L10P_T1_34
set_property PACKAGE_PIN W14 [get_ports {b5}]
set_property IOSTANDARD LVCMOS33 [get_ports {b5}]

##IO_L10N_T1_34
set_property PACKAGE_PIN Y14 [get_ports {b6}]
set_property IOSTANDARD LVCMOS33 [get_ports {b6}]

##IO_L1P_T0_34
set_property PACKAGE_PIN T12 [get_ports {b7}]
set_property IOSTANDARD LVCMOS33 [get_ports {b7}]

##IO_L1N_T0_34
set_property PACKAGE_PIN U12 [get_ports {b8}]
set_property IOSTANDARD LVCMOS33 [get_ports {b8}]

#############################################
##Pmod Header JD
##IO_L5N_T0_34
#############################################

#--------------------------------------


#set_property PACKAGE_PIN T15 [get_ports {d_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {d_1}]

##IO_L5P_T0_34
#set_property PACKAGE_PIN T14 [get_ports {e_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {e_1}]

###IO_L6N_T0_VREF_34
##set_property PACKAGE_PIN R14 [get_ports {dp}]
##set_property IOSTANDARD LVCMOS33 [get_ports {dp}]

###IO_L6P_T0_34
#set_property PACKAGE_PIN P14 [get_ports {c_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {c_1}]

###IO_L11N_T1_SRCC_34
##set_property PACKAGE_PIN U15 [get_ports {b1}]
##set_property IOSTANDARD LVCMOS33 [get_ports {b1}]

##IO_L11P_T1_SRCC_34
#set_property PACKAGE_PIN U14 [get_ports {b0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b0}]

##IO_L21N_T3_DQS_34
#set_property PACKAGE_PIN V18 [get_ports {d_en}]
#set_property IOSTANDARD LVCMOS33 [get_ports {d_en}]

##IO_L21P_T3_DQS_34
#set_property PACKAGE_PIN V17 [get_ports {b2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b2}]

##############################################
###Pmod Header JE (note: there is a difference in order of pin definition for JE)
###IO_L4P_T0_34
##############################################

#set_property PACKAGE_PIN V12 [get_ports {b_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {b_1}]

###IO_L18N_T2_34
#set_property PACKAGE_PIN W16 [get_ports {a_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {a_1}]

###IO_25_35
#set_property PACKAGE_PIN J15 [get_ports {f_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {f_1}]

###IO_L19P_T3_35
#set_property PACKAGE_PIN H15 [get_ports {g_1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_1}]

###IO_L3N_T0_DQS_34
#set_property PACKAGE_PIN V13 [get_ports {Tl2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {Tl2}]

##IO_L9N_T1_DQS_34
#set_property PACKAGE_PIN U17 [get_ports {je[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[5]}]

##IO_L20P_T3_34
#set_property PACKAGE_PIN T17 [get_ports {je[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[6]}]

##IO_L7N_T1_34
#set_property PACKAGE_PIN Y17 [get_ports {je[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {je[7]}]

