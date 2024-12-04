# Synthesis Project: Integrating an MCU into an ASIC

This project focuses on designing an ASIC embedding a microcontroller based on the 8051 architecture. It is conducted as part of the ESEO-EOC program for the 2024-2025 academic year and consists of several practical sessions.

## Objectives

- **Design of custom digital circuits**: Learn how to integrate a microcontroller into an ASIC.
- **Development of embedded applications**: Create C and assembly applications to utilize the integrated microcontroller.
- **Logical synthesis and simulation**: Validate the design through simulations and optimize the circuit in terms of area, frequency, and power consumption.

---

## Project Overview

### Project Architecture
The ASIC is built around an 8051 microcontroller core with specific peripherals, including:
- A **digital sinusoidal signal generator**.
- A **programmable timer**.
- A **brown-out detector (BOD)** to manage power-on conditions.

### Key Steps

1. **Day 1: Coding and RTL Simulation**
   - Write an embedded application in C.
   - Perform RTL simulation (behavioral model) to validate the integration of the CPU and application.

2. **Day 2: Peripherals Design and Integration**
   - Specify and implement a timer in VHDL.
   - Conduct a full system simulation with the modified application.

3. **Day 3: Logic Synthesis**
   - Analyze timing and resource usage.
   - Perform netlist simulations (functional and annotated).

4. **Day 4: Optimization**
   - Conduct static timing analysis.
   - Optimize the circuit for area, frequency, and power consumption.

5. **Day 5: Mixed Simulation**
   - Integrate an analog model (voltage supervisor) using VHDL-AMS.
   - Perform mixed simulation with SPICE + VHDL-AMS.

---

## Project Structure

### Directories

- `VHDL/`: Contains VHDL files for CPU and peripheral modules.
- `C/`: Embedded applications written in C.
- `Scripts/`: Scripts for compilation and simulation.
- `Doc/`: Technical documentation, including the 8051 instruction set.

### Key Files

- `TopAppliS51.vhdl`: Description of the top-level VHDL module.
- `Makefile_soft`: Makefile for compiling C applications.
- `Makefile_msim`: Makefile for compiling and simulating hardware designs.
- `gensin.c`: Application generating a sinusoidal signal.
- `S51Timer.vhdl`: Description of the timer peripheral.

---

## Getting Started

1. **Install the Project**
   ```bash
   git clone <REPO>.git
   cd SOCN
