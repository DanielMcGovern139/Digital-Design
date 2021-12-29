`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2021 15:37:03
// Design Name: 
// Module Name: clock
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


module clock(
  input CCLK,
  input [31:0] clkscale,
  output reg clk
    );
    
  reg [31:0] clkq = 0;
  
  always@(posedge CCLK)
     begin
       clkq = clkq + 1;
         if(clkq > clkscale)
           begin
             clk = ~clk;
             clkq = 0;
           end
           end
endmodule
