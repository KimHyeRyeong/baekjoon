transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/cpu.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/register_file.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/barrel_rotator.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/barrel_shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/shift_right.v}

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/cpu {C:/Users/user/Desktop/cpu/cpu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  cpu_tb

add wave *
view structure
view signals
run -all
