# SPI Controller with Binary-Encoded Slave Select — Zynq UltraScale+

## Overview

This project implements a standard **SPI (Serial Peripheral Interface)** controller on the **AMD/Xilinx KV260** development board, using the **Zynq UltraScale+ MPSoC** architecture.

The design connects an AXI Quad SPI IP to the Processing System (PS) via an AXI interconnect, and reduces the number of physical output pins required for Slave Select (SS) signals by encoding 8 SS lines into 3 binary-encoded outputs using a custom RTL module.

This project is part of a larger effort to port the **PULSe** system from Zynq-7000 to Zynq UltraScale+ architecture.

---

## Key Features

- SPI Master controller implemented in Programmable Logic (PL)
- PS–PL communication via AXI4-Lite interface
- 8 Slave Select signals encoded into 3 binary output pins (8-to-3 priority encoder)
- Custom Verilog RTL module integrated into Vivado Block Design
- Target platform: **KV260 (Kria SOM)**
- Bitstream successfully generated and ready for hardware deployment

---

## Repository Structure

```
├── design_1.bd          # Vivado Block Design
├── encoder.v            # Custom 8-to-3 priority encoder (Verilog RTL)
├── constraints.xdc      # Physical pin assignments for KV260
└── README.md
```

---

## Block Design

The system consists of the following IP cores:

| IP Core | Role |
|---|---|
| Zynq UltraScale+ MPSoC | Processing System (PS) |
| AXI Interconnect | PS–PL AXI bus routing |
| Processor System Reset | Reset management |
| AXI Quad SPI | SPI Master controller |
| encoder_v1_0 (custom RTL) | 8-to-3 binary priority encoder |

---

## Slave Select Encoding

To reduce physical pin usage, 8 active-low SS signals from the AXI Quad SPI IP are encoded into 3 binary outputs:

| Active SS | A2 | A1 | A0 |
|---|---|---|---|
| SS0 | 0 | 0 | 0 |
| SS1 | 0 | 0 | 1 |
| SS2 | 0 | 1 | 0 |
| SS3 | 0 | 1 | 1 |
| SS4 | 1 | 0 | 0 |
| SS5 | 1 | 0 | 1 |
| SS6 | 1 | 1 | 0 |
| SS7 | 1 | 1 | 1 |

The encoder is implemented in Verilog (`encoder.v`) and integrated as a custom RTL module in the Block Design.

---

## Pin Assignment (KV260 — Bank 45, LVCMOS18)

| Signal | Package Pin | Description |
|---|---|---|
| spi_rtl_sck_io | H12 | SPI Clock |
| spi_rtl_io0_io | J12 | MOSI |
| spi_rtl_io1_io | G10 | MISO |
| addr_0[0] | F12 | Encoded SS — A0 |
| addr_0[1] | A12 | Encoded SS — A1 |
| addr_0[2] | B11 | Encoded SS — A2 |

---

## Tools & Technologies

- **Vivado 2025.2** — Synthesis, Implementation, Bitstream Generation
- **Verilog HDL** — Custom RTL encoder
- **Zynq UltraScale+ MPSoC** — Target SoC
- **AXI4-Lite** — PS–PL interface protocol
- **JTAG** — Hardware programming and debug

---

## How to Recreate the Project

> Tested on Vivado 2025.2 — KV260 (Kria SOM) target

**Step 1 — Clone the repository**
```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

**Step 2 — Open Vivado and source the Tcl script**

Open Vivado, then in the Tcl Console run:
```tcl
cd {/path/to/cloned/repo}
source Design_zynq.tcl
```

This will automatically recreate the full project including Block Design, IP cores, and constraints.

**Step 3 — Generate Bitstream**

In Vivado Flow Navigator:
```
Flow → Generate Bitstream
```
Or in Tcl Console:
```tcl
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
```

**Step 4 — Program the KV260**

Connect the board via JTAG, then in Tcl Console:
```tcl
open_hw_manager
connect_hw_server
open_hw_target
set_property PROGRAM.FILE {./Design_zynq.runs/impl_1/design_1_wrapper.bit} [get_hw_devices xczu5_0]
program_hw_devices [get_hw_devices xczu5_0]
```

---

## Project Status

| Task | Description | Status |
|------|-------------|--------|
| 1 | Block Design Creation | ✅ Complete |
| 2 | IP Configuration | ✅ Complete |
| 3 | I/O Configuration | ✅ Complete |
| 4 | Implementation & Bitstream Generation | ✅ Complete |
| 5 | Slave Select Expansion & Binary Encoding | ✅ Complete |
| 6 | Debug & Verification via Hardware Manager | ⏳ Pending — board unavailable |

---

## Background

This project was developed as part of an FPGA engineering internship, focusing on porting an existing Zynq-7000 design to the Zynq UltraScale+ platform (KV260). It demonstrates end-to-end PL design using Vivado IP Integrator, custom RTL integration, and physical pin planning. Hardware verification (Task 6) was not completed due to board unavailability at the time of development.
