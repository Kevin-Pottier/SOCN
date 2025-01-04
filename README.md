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
   git clone https://github.com/Kevin-Pottier/SOCN.git
   cd SOCN
   ```

# DAY 1: Sinusoidal Signal Generator for an 8051 Microcontroller on ASIC

This project demonstrates the implementation of a sinusoidal signal generator using an 8051 microcontroller integrated into an ASIC. It covers coding in C, assembly adjustments, VHDL modifications, and ModelSim simulations, while addressing various challenges encountered during the design and implementation phases.

---

## Overview

The main objective of this project is to generate a sine wave using the 8051 microcontroller by:
1. Calculating sine values programmatically in C.
2. Storing these values in the ROM of the microcontroller.
3. Displaying the sine wave on an output register in a VHDL-implemented system.

The project highlights real-world design and debugging challenges, including bypassing startup code, handling timing issues, and implementing missing instructions.

---

## Implementation Steps and Explanations

### Step 1: Coding the Initial C File

#### Objective
Generate a sine wave table programmatically using the C programming language, store it in ROM, and prepare it for simulation.

#### Process
1. Write a C program (`gensin.c`) to calculate sine values for the desired number of points:
   ```c
   sin(i * 2.0 * M_PI / nbpoints)
   ```

then compile the file 
   ```bash
   make -f Makefile_soft SRC=test all  # Compile the C code
   make compile_msim                  # Compile the VHDL model
   make sim &                          # Launch ModelSim
   ```

Problem: Program Counter Halts

- Observation: The Program Counter (PC) stopped at a specific address in ModelSim.
- Analysis: The startup code could not execute due to missing initialization logic.
- Solution: Bypass the startup code by jumping directly into the main function. Modify line 180 in test.asm:

   ```asm
   LJMP _main
   ```

- Then restart the simulation on ModelSim
   ```bash
   restart -f
   run 80us
   ```

### Step 2: Storing the Sine Table in ROM

#### Objective
Store the sine wave values generated from the C program in the ROM to save RAM space and ensure they persist during program execution.

---

#### Process

1. **Generate Sine Values**  
   Use the `gensin.c` program to compute sine wave values normalized between 0 and 255. The values will be stored in an array to be later placed in ROM.

2. **Copy Values to ROM**  
   Insert the generated sine values into the `SINV[]` array in the `gensin_simple.c` file. Use the `_code` keyword to ensure the array is stored in ROM:
   ```c
   _code unsigned char SINV[] = {
       127, 135, 143, 151, 159, 166, 174, 181, 188, 195, 202, 208, 214, 220, 
       225, 230, 235, 239, 242, 246, 248, 250, 252, 253, 254, 255, 254, 253,
       252, 250, 248, 246, 242, 239, 235, 230, 225, 220, 214, 208, 202, 195,
       188, 181, 174, 166, 159, 151, 143, 135, 127, 119, 111, 103, 95, 88,
       80, 73, 66, 59, 52, 46, 40, 34, 29, 24, 19, 15, 12, 8, 6, 4, 2, 1, 0
   };
   ```
3. **Compile the Software**
   Compile the updated C file to generate the corresponding assembly:
   ```bash
   make -f Makefile_soft SRC=gensin_simple all
   ```
4. **Adjust Assembly for ROM Usage**
Open the gensin_simple.asm file and find line 180. Replace the startup code reference with _main to jump directly into the main program:
    ```asm
      LJMP _main
    ```
5. **Recompile the Assembly**
Recompile the assembly code to ensure the changes are applied:
   ```bash
   make -f Makefile_soft SRC=gensin_simple asm
   ```
### Step 3: Adjusting the VHDL Implementation

#### Objective
Enable the CPU to process the sine wave generation loop by implementing missing instructions (`mov16`) and ensuring the VHDL design supports their execution.

---

#### Process

1. **Identify Missing Instruction**  
   During simulation, it was observed that the `mov16` instruction, used for moving 16-bit data, was not implemented in the VHDL CPU model. This caused the program to hang during execution.

2. **Modify the VHDL Code**  
   Open the `DAX.vhdl` file in the `VHDL/S51CPU/` directory and locate the section handling the `mov16` instruction. Add the following logic:
   - Specify the size of the operand:
     ```vhdl
     OpNb <= 3;
     ```
   - Set the control signal for the `mov16` operation:
     ```vhdl
     CMDDPTRISEL <= CMDDPTRIDATA16;
     ```

3. **Compile the Updated VHDL Code**  
   Recompile the VHDL files to apply the changes:
   ```bash
   make compile_msim
4. **Simulate and Verify**
Launch ModelSim to verify the sine wave generation:
   ```bash
   make sim &
   ```
- Observe the output register `P` in the simulation waveform. The sine wave values should now be visible, indicating that the `mov16` instruction is functioning correctly.

### Step 4: Correcting the Sine Wave Period

#### Objective
Ensure the sine wave output has the correct period of 1 ms as specified in the project requirements.

---

#### Problem
- **Observation:** The generated sine wave had a period of 40 µs instead of the expected 1 ms.
- **Analysis:** Each sine sample was being output every 400 ns due to the loop executing too quickly, resulting in a sine wave that was 25 times faster than required.

---

#### Process

1. **Calculate Required Delay**  
   - Each sine sample should be output every 10,000 ns (1 ms period for 100 samples).
   - The current delay per sample is only 400 ns.
   - The additional delay required:  
     ```
     10,000 ns - 400 ns = 9,600 ns
     ```
   - Each `nop` (no-operation) instruction introduces a 50 ns delay. Therefore, the number of `nop` instructions required:
     ```
     9,600 ns ÷ 50 ns = 192 nops
     ```

2. **Add `nop` Instructions**  
   - Insert 192 `nop` instructions into the assembly loop to create the required delay:
     ```asm
     nop
     nop
     nop
     ...
     ```

3. **Recompile the Assembly**  
   Compile the updated assembly file to apply the changes:
   ```bash
   make -f Makefile_soft SRC=gensin_simple asm
   ```
   
4. **Simulate and Verify**

   - Run the simulation in ModelSim to observe the updated sine wave:
   ```bash
   make sim &
   
- Check the output register `P` in the waveform and confirm the sine wave period is now `1 ms`.

1. **Additional Issues and Solutions**
   - `sjump` Range Limitation
   - Problem: The sjump (short jump) instruction used in the loop has a maximum range of 128 bytes, but the added nop instructions caused the loop to exceed this range.
   - Solution: Replace sjump with a ljump (long jump) to handle the extended range:
   ```asm
    ljmp target_label
   ```
2. **Conditional Jump (jc) Limitation**
   - Problem: A jc (conditional jump) cannot directly be replaced with a long jump.
   - Solution: Use a dummy label to redirect the jc to a long jump:
   ```asm
    jc dummy_label
    dummy_label: ljmp target_label
   ```
3. **Loop Overhead**
    - Problem: A small timing discrepancy of 50 ns remained due to the overhead of reinitializing the loop counter (i).
    - Solution: Document the overhead and note it for future optimization.
