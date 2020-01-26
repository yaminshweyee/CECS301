`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:28:51 02/05/2018
// Design Name:   top_level_USR
// Module Name:   C:/Users/Laura Rice/Documents/CECS 301 Labs/Lab1_301/universalshiftregisterf_tb.v
// Project Name:  Lab1_301
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level_USR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module CECS301_Lab1_tb();

//inputs
	reg clk_100MHz, rst, SI;
	reg[1:0] M;
	reg[3:0] D;

//outputs
	wire[3:0] Q;

//Instantitate the Unit Under Test
	shift_reg4
		uut(
		     .clk(clk_100MHz), .rst(rst), .SI(SI), 
		     .M(M), .D(D), 
                     .Q(Q)
                   );

//Generate clock with a 10 ns period
  	always
	   #5 clk_100MHz = ~clk_100MHz;

//Initialize inputs

	initial begin
		$timeformat(-9, 1, "ns", 6);
		clk_100MHz = 0; rst = 0; M = 0; D = 0; SI = 0;

		//These two clks take care of rst
		@(negedge clk_100MHz)
		rst = 1;
		@(negedge clk_100MHz)
		rst = 0;

		//Exercise the "load" function with D = 0xD (1101). Note SI is don't care 	Q+ <- 1101
		@(negedge clk_100MHz)
			{rst, M, D, SI} = 8'b0_01_1011_x;

		//Exercise the "no change" function. Note both D and SI are don't care		Q+ <- 1101
		@(negedge clk_100MHz)
			{rst, M, D, SI} =  8'b0_00_xxxx_x;

		//Exercise the "shift right" function with SI =0. Note D is don't care		Q+ <- 0110
		@(negedge clk_100MHz)
			{rst, M, D, SI} = 8'b0_11_xxxx_0;

		//Exercise the "shift right" function with SI = 1. Note both D is don't care	Q+ <- 1011
		@(negedge clk_100MHz)
			{rst, M, D, SI} = 8'b0_11_xxxx_1;

		//Exercise the "no change" function. Note both D and SI are don't care 		Q+ <- 1011
		@(negedge clk_100MHz)
			{rst, M, D, SI} = 8'b0_00_xxxx_x;

		//Exercise the "rotate left" function. Note both D and SI are don't care	Q+ <- 0111
		@(negedge clk_100MHz)
			{rst, M, D, SI} = 8'b0_10_xxxx_x;

		//Exercise the "rotate left" function. Note both D and SI are don't care	Q+ <- 1110
		@(negedge clk_100MHz)
			{rst, M, D, SI} = 8'b0_10_xxxx_x;

		//Exercise the "no change" function. Note both D and SI are don't care		Q+ <- 1110
		@(negedge clk_100MHz)
			{rst, M, D, SI} = 8'b0_00_xxxx_x;
		$finish;
	end

endmodule 