`timescale 1ns / 1ps
/*****************************************************************************************************************
*File Name: d_flip_flop.v
*Project : 1
*Designer: Yamin Yee(Laura)
*Email: Yamin.Yee@student.csulb.edu
*Rev.Date: January 13, 2018
*
*Purpose: To design and implement a sequential circuit for dflip flop 
*
*Notes: This module is pretty stratight forward. If the reset is active, the output Q will get zero. Otherwise Q will 
follow D values. 
*****************************************************************************************************************/
//name of the module and port lists
module d_flip_flop( clk, D, Q, rst);
	//inputs
	input clk, D, rst;
	//outputs
	output reg Q;
	
		always@(posedge clk, posedge rst)
			begin
			//if rst is acitve, Q will goes to 0
				if(rst)
					Q <= 1'b0;
			//if not, Q will follow D
				else
					Q <= D; 
			end
endmodule
