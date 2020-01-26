`timescale 1ns/100ps
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
		@(negedge clk_100MHz)//1
			{rst, M, D, SI} = 8'b0_01_1011_x;

		//Exercise the "no change" function. Note both D and SI are don't care		Q+ <- 1101
		@(negedge clk_100MHz)//2
			{rst, M, D, SI} =  8'b0_00_xxxx_x;

		//Exercise the "shift right" function with SI =0. Note D is don't care		Q+ <- 0110
		@(negedge clk_100MHz)//3
			{rst, M, D, SI} = 8'b0_11_xxxx_0;

		//Exercise the "shift right" function with SI = 1. Note both D is don't care	Q+ <- 1011
		@(negedge clk_100MHz)//4
			{rst, M, D, SI} = 8'b0_11_xxxx_1;

		//Exercise the "no change" function. Note both D and SI are don't care 		Q+ <- 1011
		@(negedge clk_100MHz)//5
			{rst, M, D, SI} = 8'b0_00_xxxx_x;

		//Exercise the "rotate left" function. Note both D and SI are don't care	Q+ <- 0111
		@(negedge clk_100MHz)//6
			{rst, M, D, SI} = 8'b0_10_xxxx_x;

		//Exercise the "rotate left" function. Note both D and SI are don't care	Q+ <- 1110
		@(negedge clk_100MHz)//7
			{rst, M, D, SI} = 8'b0_10_xxxx_x;

		//Exercise the "no change" function. Note both D and SI are don't care		Q+ <- 1110
		@(negedge clk_100MHz)//8
			{rst, M, D, SI} = 8'b0_00_xxxx_x;
		$finish;
	end

endmodule 