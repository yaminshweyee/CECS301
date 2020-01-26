`timescale 1ns / 1ps
/*****************************************************************************************************************
*File Name: shift_reg4.v
*Project : 1
*Designer: Yamin Yee(Laura)
*Email: Yamin.Yee@student.csulb.edu
*Rev.Date: January 27, 2018
*
*Purpose: To design and implement a sequential circuit for shift register which includes 4 muxs and 4 flips flops
*
*Notes: So this module, we have inputs which are D,clk, M, SI and rst. But there are 4 muxs and 4 fip flops inside this 
universal shift register. So this module is only combine the 4 modules of muxs and 4 flip flops. Need to connect with wires
and make sure that the port list should be the serially created as before mux moules and flip flop modules  
 
*****************************************************************************************************************/
module shift_reg4( D, clk, Q, M, SI, rst );
	//inputs
	input [1:0] M;
	input [3:0] D;
	input clk, SI, rst;
	//outputs
	output [3:0]Q;
	
	//define or name wires
	wire q3, q2, q1, q0;
	
		//name as seriallly according to my ports and there should be 4 mux
		//module mux4_to_1( M,           D,            Q); 
		mux4_to_1 mux0(M[1:0],{Q[1], Q[3], D[0], Q[0]}, q0);
		mux4_to_1 mux1(M[1:0],{Q[2], Q[0], D[1], Q[1]}, q1);
		mux4_to_1 mux2(M[1:0],{Q[3], Q[1], D[2], Q[2]}, q2);
		mux4_to_1 mux3(M[1:0],{  SI, Q[2], D[3], Q[3]}, q3);
		
		
		//name as serially according to my ports and there should be 4 flipflops
		//modd_flip_flop(clk,  D,   Q , rst); 
		d_flip_flop bit0(clk, q0, Q[0], rst);
		d_flip_flop bit1(clk, q1, Q[1], rst);
		d_flip_flop bit2(clk, q2, Q[2], rst);
		d_flip_flop bit3(clk, q3, Q[3], rst);
		
		
endmodule
