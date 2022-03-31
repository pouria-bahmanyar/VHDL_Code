


// Declare the module black box
module counter_sysgen_cw (
    ce , 
    clk , 
    gateway_in , 
    gateway_out 
    ); // synthesis black_box 


	// Inputs
	input ce;
	input clk;
	input gateway_in;

	// Outputs
	output [7:0] gateway_out;


//synthesis attribute box_type counter_sysgen_cw "black_box"
endmodule
