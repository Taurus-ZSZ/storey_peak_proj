# pin assignments

# clocks
set_location_assignment PIN_M23 -to CLK_125M
set_location_assignment PIN_AF34 -to CLK_PCIE1
set_location_assignment PIN_AF35 -to "CLK_PCIE1(n)"
set_location_assignment PIN_AF6 -to CLK_PCIE2
set_location_assignment PIN_AF5 -to "CLK_PCIE2(n)"
set_location_assignment PIN_T7 -to CLK_QSFP_OSC
set_location_assignment PIN_T6 -to "CLK_QSFP_OSC(n)"

set_instance_assignment -name IO_STANDARD "SSTL-135" -to CLK_125M
set_instance_assignment -name IO_STANDARD HCSL -to CLK_PCIE1
set_instance_assignment -name IO_STANDARD HCSL -to CLK_PCIE2
set_instance_assignment -name IO_STANDARD LVDS -to CLK_QSFP_OSC

# leds
set_location_assignment PIN_A8 -to leds[7]
set_location_assignment PIN_B8 -to leds[6]
set_location_assignment PIN_C8 -to leds[5]
set_location_assignment PIN_C9 -to leds[4]
set_location_assignment PIN_C10 -to leds[3]
set_location_assignment PIN_B10 -to leds[2]
set_location_assignment PIN_A10 -to leds[1]
set_location_assignment PIN_A11 -to leds[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[7]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[6]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[5]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[4]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[3]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[2]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[1]
set_instance_assignment -name IO_STANDARD "2.5 V" -to leds[0]

# I2C (IDT)
set_location_assignment PIN_N7 -to I2C_IDT_SCL
set_location_assignment PIN_P7 -to I2C_IDT_SDA
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_IDT_SCL
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_IDT_SDA
set_instance_assignment -name SLEW_RATE 0 -to I2C_IDT_SDA
set_instance_assignment -name SLEW_RATE 0 -to I2C_IDT_SCL
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_IDT_SCL
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_IDT_SDA

# I2C (QSFP0)
set_location_assignment PIN_AB24 -to I2C_QSFP0_SCL
set_location_assignment PIN_AC24 -to I2C_QSFP0_SDA
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_QSFP0_SCL
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_QSFP0_SDA
set_instance_assignment -name SLEW_RATE 0 -to I2C_QSFP0_SDA
set_instance_assignment -name SLEW_RATE 0 -to I2C_QSFP0_SCL
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_QSFP0_SCL
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_QSFP0_SDA

# I2C (QSFP1)
set_location_assignment PIN_AA25 -to I2C_QSFP1_SCL
set_location_assignment PIN_AB25 -to I2C_QSFP1_SDA
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_QSFP1_SCL
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_QSFP1_SDA
set_instance_assignment -name SLEW_RATE 0 -to I2C_QSFP1_SDA
set_instance_assignment -name SLEW_RATE 0 -to I2C_QSFP1_SCL
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_QSFP1_SCL
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_QSFP1_SDA

# Remote and Local Temperature Sensor I2C
set_location_assignment PIN_AW26 -to I2C_MON_SCL
set_location_assignment PIN_AV26 -to I2C_MON_SDA
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_MON_SCL
set_instance_assignment -name IO_STANDARD "2.5 V" -to I2C_MON_SDA
set_instance_assignment -name SLEW_RATE 0 -to I2C_MON_SCL
set_instance_assignment -name SLEW_RATE 0 -to I2C_MON_SDA
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_MON_SCL
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to I2C_MON_SDA
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to I2C_MON_SCL
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to I2C_MON_SDA

# QSFP 0
 set_location_assignment PIN_U4 -to XCVR_QSFP0_TX[0]
 set_location_assignment PIN_R4 -to XCVR_QSFP0_TX[1]
 set_location_assignment PIN_N4 -to XCVR_QSFP0_TX[2]
 set_location_assignment PIN_L4 -to XCVR_QSFP0_TX[3]
 set_location_assignment PIN_V2 -to XCVR_QSFP0_RX[0]
 set_location_assignment PIN_T2 -to XCVR_QSFP0_RX[1]
 set_location_assignment PIN_P2 -to XCVR_QSFP0_RX[2]
 set_location_assignment PIN_M2 -to XCVR_QSFP0_RX[3]

 set_location_assignment PIN_M1 -to "XCVR_QSFP0_RX[3](n)"
 set_location_assignment PIN_P1 -to "XCVR_QSFP0_RX[2](n)"
 set_location_assignment PIN_T1 -to "XCVR_QSFP0_RX[1](n)"
 set_location_assignment PIN_V1 -to "XCVR_QSFP0_RX[0](n)"
 set_location_assignment PIN_L3 -to "XCVR_QSFP0_TX[3](n)"
 set_location_assignment PIN_N3 -to "XCVR_QSFP0_TX[2](n)"
 set_location_assignment PIN_R3 -to "XCVR_QSFP0_TX[1](n)"
 set_location_assignment PIN_U3 -to "XCVR_QSFP0_TX[0](n)"

 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_RX[3]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_RX[2]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_RX[1]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_RX[0]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_TX[3]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_TX[2]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_TX[1]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP0_TX[0]

# QSFP 1
 set_location_assignment PIN_J4 -to XCVR_QSFP1_TX[0]
 set_location_assignment PIN_G4 -to XCVR_QSFP1_TX[1]
 set_location_assignment PIN_E4 -to XCVR_QSFP1_TX[2]
 set_location_assignment PIN_C4 -to XCVR_QSFP1_TX[3]
 set_location_assignment PIN_K2 -to XCVR_QSFP1_RX[0]
 set_location_assignment PIN_H2 -to XCVR_QSFP1_RX[1]
 set_location_assignment PIN_F2 -to XCVR_QSFP1_RX[2]
 set_location_assignment PIN_D2 -to XCVR_QSFP1_RX[3]

 set_location_assignment PIN_J3 -to "XCVR_QSFP1_TX[0](n)"
 set_location_assignment PIN_G3 -to "XCVR_QSFP1_TX[1](n)"
 set_location_assignment PIN_E3 -to "XCVR_QSFP1_TX[2](n)"
 set_location_assignment PIN_C3 -to "XCVR_QSFP1_TX[3](n)"
 set_location_assignment PIN_K1 -to "XCVR_QSFP1_RX[0](n)"
 set_location_assignment PIN_H1 -to "XCVR_QSFP1_RX[1](n)"
 set_location_assignment PIN_F1 -to "XCVR_QSFP1_RX[2](n)"
 set_location_assignment PIN_D1 -to "XCVR_QSFP1_RX[3](n)"

 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_RX[3]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_RX[2]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_RX[1]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_RX[0]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_TX[3]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_TX[2]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_TX[1]
 set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to XCVR_QSFP1_TX[0]

# PCIe

set_location_assignment PIN_AB28 -to PCIE1_PERSTN
set_instance_assignment -name IO_STANDARD "2.5 V" -to PCIE1_PERSTN

set_location_assignment PIN_AV38 -to PCIE1_SERIAL_RX[0]
set_location_assignment PIN_AT38 -to PCIE1_SERIAL_RX[1]
set_location_assignment PIN_AP38 -to PCIE1_SERIAL_RX[2]
set_location_assignment PIN_AM38 -to PCIE1_SERIAL_RX[3]
set_location_assignment PIN_AH38 -to PCIE1_SERIAL_RX[4]
set_location_assignment PIN_AF38 -to PCIE1_SERIAL_RX[5]
set_location_assignment PIN_AD38 -to PCIE1_SERIAL_RX[6]
set_location_assignment PIN_AB38 -to PCIE1_SERIAL_RX[7]

set_location_assignment PIN_AV39 -to "PCIE1_SERIAL_RX[0](n)"
set_location_assignment PIN_AT39 -to "PCIE1_SERIAL_RX[1](n)"
set_location_assignment PIN_AP39 -to "PCIE1_SERIAL_RX[2](n)"
set_location_assignment PIN_AM39 -to "PCIE1_SERIAL_RX[3](n)"
set_location_assignment PIN_AH39 -to "PCIE1_SERIAL_RX[4](n)"
set_location_assignment PIN_AF39 -to "PCIE1_SERIAL_RX[5](n)"
set_location_assignment PIN_AD39 -to "PCIE1_SERIAL_RX[6](n)"
set_location_assignment PIN_AB39 -to "PCIE1_SERIAL_RX[7](n)"

set_location_assignment PIN_AU36 -to PCIE1_SERIAL_TX[0]
set_location_assignment PIN_AR36 -to PCIE1_SERIAL_TX[1]
set_location_assignment PIN_AN36 -to PCIE1_SERIAL_TX[2]
set_location_assignment PIN_AL36 -to PCIE1_SERIAL_TX[3]
set_location_assignment PIN_AG36 -to PCIE1_SERIAL_TX[4]
set_location_assignment PIN_AE36 -to PCIE1_SERIAL_TX[5]
set_location_assignment PIN_AC36 -to PCIE1_SERIAL_TX[6]
set_location_assignment PIN_AA36 -to PCIE1_SERIAL_TX[7]

set_location_assignment PIN_AU37 -to "PCIE1_SERIAL_TX[0](n)"
set_location_assignment PIN_AR37 -to "PCIE1_SERIAL_TX[1](n)"
set_location_assignment PIN_AN37 -to "PCIE1_SERIAL_TX[2](n)"
set_location_assignment PIN_AL37 -to "PCIE1_SERIAL_TX[3](n)"
set_location_assignment PIN_AG37 -to "PCIE1_SERIAL_TX[4](n)"
set_location_assignment PIN_AE37 -to "PCIE1_SERIAL_TX[5](n)"
set_location_assignment PIN_AC37 -to "PCIE1_SERIAL_TX[6](n)"
set_location_assignment PIN_AA37 -to "PCIE1_SERIAL_TX[7](n)"

set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[0]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[1]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[2]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[3]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[4]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[5]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[6]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_RX[7]

set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[0]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[1]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[2]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[3]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[4]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[5]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[6]
set_instance_assignment -name IO_STANDARD "1.5-V PCML" -to PCIE1_SERIAL_TX[7]
