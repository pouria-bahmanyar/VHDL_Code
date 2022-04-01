`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:13 11/27/2021
// Design Name:   signed_adder
// Module Name:   G:/VHDL_CODE/example_session_1/signed_adder/sigend_adder_TestBench.v
// Project Name:  signed_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signed_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sigend_adder_TestBench;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [0:0] Cin;

	// Outputs
	wire Cout;
	wire [15:0] Sum;

	// Instantiate the Unit Under Test (UUT)
	signed_adder uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Cout(Cout), 
		.Sum(Sum)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

