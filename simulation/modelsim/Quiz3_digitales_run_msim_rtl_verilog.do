transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/abner/Desktop/Quiz3_digitales {/home/abner/Desktop/Quiz3_digitales/FSM.sv}
vlog -sv -work work +incdir+/home/abner/Desktop/Quiz3_digitales {/home/abner/Desktop/Quiz3_digitales/Quiz3_digitales.sv}
vlog -sv -work work +incdir+/home/abner/Desktop/Quiz3_digitales {/home/abner/Desktop/Quiz3_digitales/SerialInputRegister.sv}
vlog -sv -work work +incdir+/home/abner/Desktop/Quiz3_digitales {/home/abner/Desktop/Quiz3_digitales/mux_2to1.sv}

vlog -sv -work work +incdir+/home/abner/Desktop/Quiz3_digitales {/home/abner/Desktop/Quiz3_digitales/general_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  general_tb

add wave *
view structure
view signals
run -all
