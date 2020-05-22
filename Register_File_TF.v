`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:13:00 05/05/2020
// Design Name:   Register_File
// Module Name:   C:/Users/acer/Documents/Arquitectura/Procesador_ARMV8/Register_File_TF.v
// Project Name:  Procesador_ARMV8
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_File
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_File_TF;

	// Inputs
	reg i_clk = 0;
	reg [4:0] i_rn = 0;
	reg [4:0] i_rm = 1;
	reg [4:0] i_rd;
	reg i_dataWr;
	reg i_regWr = 0;

	// Outputs
	wire [63:0] o_reg0;
	wire [63:0] o_reg1;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.i_clk(i_clk), 
		.i_rn(i_rn), 
		.i_rm(i_rm), 
		.o_reg0(o_reg0), 
		.o_reg1(o_reg1), 
		.i_rd(i_rd), 
		.i_dataWr(i_dataWr), 
		.i_regWr(i_regWr)
	);

	always #10 i_clk=~i_clk;
	initial begin
		// // Initialize Inputs
		// i_clk = 0;
		// i_rn = 0;
		// i_rm = 0;
		// i_rd = 0;
		// i_dataWr = 0;
		// i_regWr = 0;

		// // Wait 100 ns for global reset to finish
		// #100;
        
		// // Add stimulus here

	end
      
endmodule

