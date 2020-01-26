`timescale 1ns / 1ps
/*****************************************************************************************************************
*File Name: mux4_to_1.v
*Project : 1
*Designer: Yamin Yee(Laura)
*Email: Yamin.Yee@student.csulb.edu
*Rev.Date: January 27, 2018
*
*Purpose: To design and implement a sequential circuit for 4_to_1 mux
*
*Notes: This module is simple. There are 4 bits Data in 'D' and 2 bits Data in 'M' and output 'Q'. I ues case statement
and I ues 2 bits register to name the Data in which are D[0], D[1], D[2], D[3]. 
*****************************************************************************************************************/
//module name and port lists
 module mux4_to_1( M, D, Q);
   //inputs
	input [3:0] D;
	input [1:0] M;
	//outputs
	output Q;
	
	//define wires
	wire Q;
	wire [1:0]M;
	wire [3:0]D;
	
	//using conditional statment V1
	assign Q = ( M == 0 )? D[0] : ( M == 1 )? D[1] : ( M == 2 )? D[2] : D[3];
	//when M is 0~ D[0] and etc

	
	//Using case statement V2
	//always@(*) 
		//case(M)
		//define how the bit and how the name works and
			//00 is 0 and so I named that bit should be D[0] and etc as the following
			//2'b00: Q = D[0];// 0 in binary is D[0]
			//2'b01: Q = D[1];// 1 in binary is D[1]
			//2'b10: Q=  D[2];// 2 in binary is D[2]
			//2'b11: Q = D[3];// 3 in binary is D[3]
			//default: Q = D[0];
		//endcase
		
		
endmodule 
