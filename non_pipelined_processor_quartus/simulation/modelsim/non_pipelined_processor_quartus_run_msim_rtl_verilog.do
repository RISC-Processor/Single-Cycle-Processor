transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/control_main_decoder.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/control_alu_decoder.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/control.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/register_file.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/processor.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/pc.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/extend.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/data_memory.v}
vlog -vlog01compat -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/alu.v}
vlog -sv -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/imem.sv}
vlog -sv -work work +incdir+D:/RISC-Processor/Non-Pipelined-Processor/source_files {D:/RISC-Processor/Non-Pipelined-Processor/source_files/adder.sv}

