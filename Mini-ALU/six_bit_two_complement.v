`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2021 19:06:12
// Design Name: 
// Module Name: six_bit_two_complement
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


module six_bit_two_complement(
input [5:0] X, 
output [5:0] Y
    );
    
    wire [5:0]x_not; 
    
    
   assign  x_not = ~X;  // Bitwise invert of X
    
   six_bit_ripple_adder I_adder (
   .x(x_not),
   .y(6'b000001), //the addition of 1
   .sel(1'b0),  //always set to 0 as X inverted above 
   .c_out(),
   .overflow(),
   .sum(Y)
  );
    
endmodule
