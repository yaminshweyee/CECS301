`timescale 1ns / 1ps
/*****************************************************************************************************************
*File Name: d_flip_flop.v
*Project : 1
*Designer: Yamin Yee(Laura)
*Email: Yamin.Yee@student.csulb.edu
*Rev.Date: January 27, 2018
*
*Purpose: To design and implement a sequential circuit for Top level diagram for Universal Shift Register
*
*Notes: Since this is the top_level Schimetic and so we need to use two wires in order to able to connecct each
and so I named w0 and w1 to connect clk_5ooHz and one shot modules or verilog. So as the top level, there are 6 inputs 
and one output. Since I am using sturctural verilog and so I used wires.
*****************************************************************************************************************/
//module name and    port lists
module top_level_USR( clk_100MHz, rst, D_in, M, SI, D, Q);
	//inputs
	input clk_100MHz, rst, D_in, SI;
	input [1:0] M;
	input [3:0] D;
	//outputs
	output[3:0] Q;

	//name wires to connect clk_500hz, one shot and shift reg
	wire w0,w1;
	
	          //clk_500hz( clk_in,      rst, clk_out);
	clk_500hz clk_500hz  ( clk_100MHz,  rst,      w0);
	
         //one_shot (clk, D_in, rst, D_out);
	one_shot one_shot (w0, D_in, rst,    w1);
	
	         //shift_reg4( D, clk, Q, M, SI, rst );
	shift_reg4 shift_reg4( D, w1,  Q, M, SI, rst );

endmodule
