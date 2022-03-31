#
# Created by System Generator     Thu Jan 12 11:44:37 2017
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {NGC Netlist}
    set Project {counter_sysgen_cw}
    set DSPFamily {Spartan6}
    set DSPDevice {xc6slx9}
    set DSPPackage {tqg144}
    set DSPSpeed {-2}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {100}
    set CreateInterfaceDocument {off}
    set NewXSTParser {1}
	if { [ string equal $Compilation {IP Packager} ] == 1 } {
		set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
		set IP_Library_Text {SysGen}
		set IP_Vendor_Text {Xilinx}
		set IP_Version_Text {1.0}
		set IP_Categories_Text {System Generator for DSP}
		set IP_Common_Repos {0}
		set IP_Dir {}
		set IP_LifeCycle_Menu {1}
		set IP_Description    {}
		
	}
    set ProjectFiles {
        {{counter_sysgen_cw.vhd} -view All}
        {{counter_sysgen.vhd} -view All}
        {{counter_sysgen_cw.ucf}}
        {{counter_sysgen_cw.xdc}}
        {{D:\Examples\SysGen_Example\SysGen_Model\counter_sysgen.slx}}
    }
    set TopLevelModule {counter_sysgen_cw}
    set SynthesisConstraintsFile {counter_sysgen_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
