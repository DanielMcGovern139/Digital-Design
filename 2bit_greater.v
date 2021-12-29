`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2021 18:01:05
// Design Name: 
// Module Name: 2bit_greater
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


// Listing 1.1
module two_bit_greater
   
   (
    input [1:0]a,b,
    output wire a_gt_b
   );

  assign a_gt_b = (a[1]& ~b[1]) | (a[0]& ~b[1] & ~b[0]) | (a[1] & a[0] & ~b[0]);

endmodule


