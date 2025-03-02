# Single Cycle Non-Pipelined Processor for RV32I

The repository contains the source code for a single cycle non-pipelined processor designed to run the RISC-V 32-bit base intruction set (RV32I).

The processor is interfaced with UART to communicate with a computer so that the content of the registers, data memory or instruction memory can be observed, and modified.

The source code is found in the `src` folder.

1. `src/non_pipelined_processor` - Verilog files for the processor

2. `src/uart` - Verilog files for UART communication

3. `src/top_non_pipelined_processor_quartus.v` - Top level entity for the Quartus project

## Simulation

To use Icarus Verilog (`iverilog`) for simulation, use need `iverilog` and `gtkwave` installed in your system.

Then follow following steps to run simulation.

> Note that you should start executing commands from the repository root.

1. `cd src/non_pipelined_processor/src`

2. `iverilog -g2012 -o ../sim/processor_tb  ../sim/processor_tb.sv control.v control_main_decoder.v control_alu_decoder.v pc.v adder.sv imem.v register_file.v extend.v alu.v data_memory.v`

3. `cd ../sim`

4. `vvp processor_tb`

5. `gtkwave processor_tb.vcd`

## Build Project

1. Clone the repository with `--recursive` flag, so that all submodules are also cloned.
<!--TODO: Change the link to point to RISC-Processor-->
```bash
git clone --recursive https://github.com/linukaratnayake/DSD-Non-Pipelined-Processor.git
```

<!--This step should be removed once merged to the main branch.-->
2. Checkout to branch `using-hog`.
```bash
git checkout using-hog
```

<!--This step should be removed once merged to the main branch.-->
3. Run
```bash
git submodule update
``` 

4. Add `bin` folder of your Quartus installation to the `PATH` (System Variables).
```bash
set PATH=C:\intelFPGA\<VERSION>\quartus\bin;%PATH%
```
> Use `Git Bash`, since Windows Command Prompt/ PowerShell does not support the above command. Or do it manually.

<!--TODO: Find why and resolve the issue on how to run it in CMD.-->

5. In repo root, execute the following line to build the Quartus project.
```bash
./Hog/Do CREATE non_pipelined_processor_quartus
```
> Use `Git Bash`, since Windows Command Prompt/ PowerShell does not support the above command.

<!--TODO: Find why and resolve the issue on how to run it in CMD.-->

6. Navigate to `Projects/non_pipelined_processor_quartus` folder and open `non_pipelined_processor_quartus.qpf`.