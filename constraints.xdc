## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## UART RX/TX
set_property PACKAGE_PIN U1 [get_ports rx]
set_property PACKAGE_PIN V1 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports {rx tx}]
