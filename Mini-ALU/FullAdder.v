`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2021 13:20:56
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(a, b, cin, s, cout);
  // 3C7 LabD 2010
  // a and b are the bits to add
  // cin is carry in
  input wire a, b, cin;
  
  // s is the sum of a and b. cout is any carry out bit
  // wires since just using assign here
  output wire s, cout;

  // logic for sum and carry
  assign s = cin ^ a ^ b; 
  assign cout = (b & cin) | (a & cin) | (a & b); //there will be a carry if two
                                                 //of these are 1

   
endmodule
