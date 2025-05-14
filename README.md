**UART Communication in VHDL for Xilinx FPGA** 

__📦 Project Overview__

This project implements a complete UART (Universal Asynchronous Receiver/Transmitter) communication interface in VHDL, designed for synthesis on Xilinx FPGA boards. The goal is to provide a reliable and configurable UART module that enables serial communication with a PC or other peripheral devices.

It's suitable for educational purposes as well as integration into larger FPGA-based systems requiring serial communication.

**⚙️ Features**
  • Configurable baud rate (default: 9600 bps)
  • Full-duplex communication: transmit (TX) and receive (RX)
  • 8N1 protocol (8 data bits, no parity, 1 stop bit)
  • Optional FIFO buffers for TX and RX
  • Fully verified through simulation and hardware testing

**🧰 Technologies Used:**
  • VHDL 2008
  • Xilinx Vivado / ISE
  • Simulation: ModelSim / GHDL
  • Tested on: Xilinx Nexys 4 / Basys 3

**📁 Project Structure**


**🚀 Getting Started**
  1. Create a new project in Vivado / ISE
  2. Add the .vhd source files
  3. Include the .xdc constraints file with UART TX/RX pin mappings
  4. Generate the bitstream and upload it to your FPGA board
**📌 Notes**
  • Make sure the system clock frequency matches the expected UART timing.
  • For higher baud rates, timing analysis and proper constraints are critical.

**📃 License**
This project is released under the MIT License.
