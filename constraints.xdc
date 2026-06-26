# SCK
set_property PACKAGE_PIN H12 [get_ports {spi_rtl_sck_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_rtl_sck_io}]
# MOSI
set_property PACKAGE_PIN J12 [get_ports {spi_rtl_io0_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_rtl_io0_io}]
# MISO
set_property PACKAGE_PIN G10 [get_ports {spi_rtl_io1_io}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_rtl_io1_io}]
# Encoder output A0, A1, A2
set_property PACKAGE_PIN F12 [get_ports {addr_0[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {addr_0[0]}]
set_property PACKAGE_PIN A12 [get_ports {addr_0[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {addr_0[1]}]
set_property PACKAGE_PIN B11 [get_ports {addr_0[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {addr_0[2]}]
# ss_t
set_property PACKAGE_PIN A11 [get_ports {spi_rtl_ss_t}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_rtl_ss_t}]