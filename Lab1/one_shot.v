`timescale 1ns / 1ps
/*****************************************************************************************************************
*File Name: d_flip_flop.v
*Project : 1
*Designer: Yamin Yee(Laura)
*Email: Yamin.Yee@student.csulb.edu
*Rev.Date: January 27, 2018
*
*Purpose: To design and implement a sequential circuit for one_shot pulse module 
*
*Notes: One shot basically uses shift register to getthe sample from the singnal until they reach the sample to able to
generate the pulse until you are able stable enough. 
*****************************************************************************************************************/
//the following template provides a one-shot pulse
//from a non-clock input(D_in)
//name of the module and port lists 
module one_shot (clk_in, D_in, rst, D_out);
	//inputs
	input D_in, clk_in, rst;
	//outputs
	output D_out;
	//name wire
	wire D_out;
	//registers
	reg q9, q8, q7, q6, q5, q4, q3, q2, q1, q0;

//create the debounced, one-shot output pulse

	assign D_out = !q9 & q8 & q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;

	always@(posedge clk_in or posedge rst)
		//if rst is active, all the registered outputs will goes to zero
		if (rst == 1'b1)
			{q9,q8, q7, q6,q5, q4, q3, q2, q1, q0} <= 10'b0;
		else begin
	//shift in the new sample that's on the D_in input
			q9 <= q8 ; q8 <= q7 ; q7 <= q6 ; q6 <= q5; q5 <= q4;
			q4 <= q3; q3 <= q2 ; q2 <= q1; q1 <= q0; q0 <= D_in;
   end
	//create the debounced, one-shot output pulse
	assign D_out =!q9 & q8 & q7 & q6 & q5 & q4 & q3 & q2 & q1 & q0;
						
endmodule 



