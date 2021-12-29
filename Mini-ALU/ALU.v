`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2021 18:46:36
// Design Name: 
// Module Name: ALU
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


module ALU(

input [5:0] A,B,
output [5:0] X,
input [2:0] fxn
    );
    
wire [5:0] minus_A, minus_B, A_plus_B, A_minus_B, A_XNOR_B;
wire A_lt_B;
wire [2:0] fxn;
wire [5:0] X;
    
    //instantaneous blocks   
six_bit_two_complement I_minus_A ( .X(A), .Y(minus_A));
six_bit_two_complement I_minus_B ( .X(B), .Y(minus_B));
  
  
A_less_B I_A_less_B (.a_less_b(A_lt_B), .a(A), .b(B));


A_XNOR_B  I_A_XNOR_B (.A(A), .B(B), .X(A_XNOR_B));
   
six_bit_ripple_adder I_adder (
   .x(A),
   .y(B),
   .sel(1'b0),  
   .c_out(),
   .overflow(),
   .sum(A_plus_B)
  );

six_bit_ripple_adder I_sub (
   .x(A),
   .y(B),
   .sel(1'b1),  
   .c_out(),
   .overflow(),
   .sum(A_minus_B)
  );


    
fxn_menu I_fxn_menu (  .X(X), .A(A), .B(B), .fxn(fxn), .minus_A(minus_A), .minus_B(minus_B), .A_XNOR_B(A_XNOR_B), 
                       .A_minus_B(A_minus_B), .A_plus_B(A_plus_B), .A_lt_B(A_lt_B));

    
    
endmodule
