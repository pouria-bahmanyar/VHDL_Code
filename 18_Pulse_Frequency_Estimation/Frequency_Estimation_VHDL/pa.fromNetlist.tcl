
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name IF_FFT -dir "D:/Projects/37/Digital IFM/IF_FFT/planAhead_run_1" -part xc6vlx130tff1156-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Projects/37/Digital IFM/IF_FFT/IF_FFT_Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Projects/37/Digital IFM/IF_FFT} {ipcore_dir} }
add_files [list {ipcore_dir/Bin_Offset_Calculator.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FFT_128p.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FFT_SQRT.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/SQRT.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "IF_FFT_Top.ucf" [current_fileset -constrset]
add_files [list {IF_FFT_Top.ucf}] -fileset [get_property constrset [current_run]]
link_design
