# Single Cycle Processor for RV32I

The repository contains the source code for a single cycle processor designed to run the RISC-V 32-bit base intruction set (RV32I).

The processor is interfaced with UART to communicate with a computer so that the content of the registers, data memory or instruction memory can be observed, and modified.

The source code is found in the `src` folder.

1. `src/single_cycle_processor` - Verilog files for the processor

2. `src/uart` - Verilog files for UART communication

3. `src/top_single_cycle_processor_quartus.v` - Top level entity for the Quartus project

## Top Level Block Design
![Top Level Block Design](/src/block_design.jpeg)


## Simulation

> To do simulation as described below, [Icarus Verilog](https://bleyer.org/icarus/) and [GTKWave](https://gtkwave.sourceforge.net/) are required.

Once installed, follow these steps to run simulation. Otherwise, you are free to use any simulation tool you prefer.

> Note that you should start executing commands from the repository root.

1. `cd src/single_cycle_processor/src`

2. `iverilog -g2012 -o ../sim/processor_tb  ../sim/processor_tb.sv control.v control_main_decoder.v control_alu_decoder.v pc.v adder.sv imem.v register_file.v extend.v alu.v data_memory.v`

3. `cd ../sim`

4. `vvp processor_tb`

5. `gtkwave processor_tb.vcd`

![Waveform zoomed out](/src/single_cycle_processor/sim/single_cycle_processor_1.png)

![Waveform](/src/single_cycle_processor/sim/single_cycle_processor_2.png)

## Build Project

1. Clone the repository with `--recursive` flag, so that all submodules are also cloned.
```bash
git clone --recursive https://github.com/RISC-Processor/Single-Cycle-Processor.git
```

2. Add `bin` folder of your Quartus installation to the `PATH` (System Variables).
For example:
```bash
set PATH=C:\intelFPGA\<VERSION>\quartus\bin;%PATH%
```
> In Windows, use `Git Bash`, since Command Prompt/ PowerShell does not support the above command. Or do it manually.

<!--TODO: Find why and resolve the issue on how to run it in CMD.-->

3. In repo root, execute the following line to build the Quartus project.
```bash
./Hog/Do CREATE single_cycle_processor_quartus
```
> In Windows, use `Git Bash`, since Command Prompt/ PowerShell does not support the above command.

<!--TODO: Find why and resolve the issue on how to run it in CMD.-->

4. Navigate to `Projects/single_cycle_processor_quartus` folder and open `single_cycle_processor_quartus.qpf`.
