`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2021 19:22:19
// Design Name: 
// Module Name: A_XNOR_B
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


module A_XNOR_B(
input [5:0] A,B,
output [5:0] X
    );
    
    assign X= A~^B;
endmodule
