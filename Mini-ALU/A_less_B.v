`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2021 19:29:36
// Design Name: 
// Module Name: A_less_B
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


module A_less_B(

input [5:0]a,b,
    output wire a_less_b
  
    );
    
   wire [7:0] a_append; 
   wire [7:0] b_append;
   wire a_gt_or_eq_b;
   
     assign a_append = a[5] ? {2'b11, a}   : {2'b00, a}; //if b is a negative number the two most significant bits to 1 and if positive to 0
     assign b_append = b[5] ? {2'b11, b}   : {2'b00, b};
    
 //IF THE MOST SIGNIFICANT BIT OF A IS 0, THE NUMBER IS POSITIVE SO APPEND TWO ZEROS, 
//IF THE MOST SIGNIFICANT BIT OF A IS 1, ITS NEGATIVE SO APPEND TO 1'S 
//TO THE EXTRA UNUSED BITS, THIS WILL TAKE CARE OF THE EXTRA TWO BITS 
        
 eight_bit_gt_or_et I_eight_bit_gt_or_et(

.a(a_append),
.b(b_append),
.a_gt_or_eq_b (a_gt_or_eq_b)
   

    );
 //so we have greeater than value, we just invert to get the less than value 
    assign a_less_b= ~a_gt_or_eq_b;
endmodule
