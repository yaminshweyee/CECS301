`timescale 1ns / 1ps
/*****************************************************************************************************************
*File Name: clk_500hz.v
*Project : 1
*Designer: Yamin Yee(Laura)
*Email: Yamin.Yee@student.csulb.edu
*Rev.Date: January 27, 2018
*
*Purpose: To design and implement clock divider module 
*
*Notes: In order to keep know the real time in circuit, we need to start with an input clk with known frequency
So we need to build the counter to keep track of the clock .There is a limit to know how fast that counter to operate.
****************************************************************************************************************/
//module name and port lists 
module clk_500hz( clk_100MHz, rst, clk_out);
	//inputs
	input clk_100MHz, rst;
	//output
	output clk_out;
	//register 
	reg clk_out;
	//define integer 
	integer i;
	
	//***********************************************************************
	// The following verilog code will "divide" an incoming clock by the 32-bit decimal value
	// specified in the "if condition"
	//
	//The value of the counter that counts the incoming clock ticks is equal to [(Incoming Freq/ Outgoing Freq) / 2]
	//the value of the counter that counts the incoming clk ticks = [(100M Hz)/ (500 Hz)]/2 = 10^5
	//************************************************************************
    
	 always@(posedge clk_100MHz , posedge rst) begin
			if(rst == 1'b1) begin 
			//when rst is active, the input clk will go slows or low & input integer will be 0
				i = 0;
				clk_out = 0;
			end
			// got a clk, so increase the counter and
		   //test to see if half a period has elapsed 
			else begin
				i = i +1;
				//if the ineger is greater or equal to the value of the counter, then clk_out will not equal to clk_out
				if (i >= 100000) begin
					clk_out = ~clk_out;
					i = 0;
				end //if
			end // else
			
		end //always
		
endmodule
