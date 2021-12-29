`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2021 18:49:56
// Design Name: 
// Module Name: fxn_menu
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


module fxn_menu(
input [5:0] A,B,minus_A, minus_B, A_plus_B, A_minus_B, A_XNOR_B,
input A_lt_B, 
input [2:0] fxn,
output reg [5:0] X

    );
    
    always @ (*) begin 
    
    case (fxn)  //switch case with different fxn options 
    
    3'b000: X= A;
    3'b001: X = B;
    3'b010: X = minus_A;
    3'b011: X = minus_B;
    3'b100: X = {5'd0,A_lt_B}; //because A_lt_B is 1 bit and X is 5 bits
    3'b101: X = A_XNOR_B;
    3'b110: X = A_plus_B;
    default: X = A_minus_B;
    
    endcase
    
    end 
    
endmodule
