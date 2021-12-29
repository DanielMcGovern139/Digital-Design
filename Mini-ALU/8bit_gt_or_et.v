`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2021 17:20:11
// Design Name: 
// Module Name: 8bit_gt_or_et
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


module eight_bit_gt_or_et(

input [7:0]a,b,
    output wire a_gt_or_eq_b


    );
    
    wire eq[3:0];
    wire [3:0]  a_gt_b;

    wire num_eq;
    
     // Checking if numbers are equal using the 2bit comparator module
    
       eq2 eq_0 (.aeqb(eq[0]), .a(a[1:0]), .b(b[1:0]));
       eq2 eq_1 (.aeqb(eq[1]), .a(a[3:2]), .b(b[3:2]));
       eq2 eq_2 (.aeqb(eq[2]), .a(a[5:4]), .b(b[5:4]));
       eq2 eq_3 (.aeqb(eq[3]), .a(a[7:6]), .b(b[7:6]));
       
       assign num_eq =eq[0] & eq[1] & eq[2] & eq[3];

    //Checking if numbers are greater than using 2bit greater than module 
    
     two_bit_greater I_two_bit_greater_7_6 (.a(a[7:6]),.b(b[7:6]), .a_gt_b(a_gt_b[3])  );
     two_bit_greater I_two_bit_greater_5_4 (.a(a[5:4]),.b(b[5:4]), .a_gt_b(a_gt_b[2])  );
     two_bit_greater I_two_bit_greater_3_2 (.a(a[3:2]),.b(b[3:2]), .a_gt_b(a_gt_b[1])  );
     two_bit_greater I_two_bit_greater_1_0 (.a(a[1:0]),.b(b[1:0]), .a_gt_b(a_gt_b[0])  );

     assign  a_gt_or_eq_b =  num_eq | a_gt_b[3] | eq[3]&a_gt_b[2] | eq[3]& eq[2] & a_gt_b[1]  |  eq[3]& eq[2] & eq[1] & a_gt_b[0];
  
  //If all the eq's are equal then  A is equal to B                  
  //if bits A7 and A6 are greater than B7 and B6 then A is greater than B as it does not matter about the other bits 
  //If Bits A7 and A6 are equal to B7 anbd B6 and A5 and A4 are greater than B5 and B4 then A is geater than B
  //If Bits A7 and A6 are equal to B7 anbd B6 and Bits A5 and A4 are equal to B5 and B4 and A3 and A2 are greater than B3 and B2 then A is geater than B
  //and so on until get to end 
    
endmodule