`timescale 1fs / 1fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 17:06:49
// Design Name: 
// Module Name: lfsr_21_bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lfsr_21_bit
	
#(parameter	seed =21'b10110011111101000000) //given seed value
 (
  input	clk,sh_en,rst_n,
  output [20:0]	Q_out,
  output reg max_tick_reg
  );	
  
  reg  [20:0] Q_state;
  wire [20:0] Q_ns;
  wire Q_fb;
  
  
  always @	(posedge clk ) begin
		if(!rst_n) begin
		 Q_state	<=	seed;
		 max_tick_reg  <= 1'b0;
		 end
		 else
		 begin
		    if(sh_en) begin
			   Q_state	<=	Q_ns;
			
	         	if (Q_ns == seed) 
                    max_tick_reg <= 1'b1; //we have completed a full LFSR cycle so max tick reg goes high
                else 
                  max_tick_reg <=1'b0;

       end
       end
       end 

				
//next	state	logic
assign	Q_fb	=	Q_state[20]	^	Q_state[18]; //feedback XOR
assign	Q_ns	=	{Q_state[19:0], Q_fb}; //append the feedback to the new Q




//output	logic
assign	Q_out	=	Q_state;




  
endmodule
