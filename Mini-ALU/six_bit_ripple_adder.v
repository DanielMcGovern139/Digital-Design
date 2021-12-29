module six_bit_ripple_adder(
  input[5:0] x,y,
  input sel,  // sel = 0 (Addition,  sel = sub 1)
  output c_out,
  output overflow,
  output [5:0] sum
  );
  

wire [4:0] carry; //internal carry wires


////6 different blocks using carry to link and sel to invert all y bits if 1
FullAdder FA0(
    .a(x[0]), 
    .b(y[0]^sel), //if sel is set to one we will subtract
    .cin(sel),
    .s(sum[0]),
    .cout(carry[0]));
    

FullAdder FA1(
    .a(x[1]), 
    .b(y[1]^sel),
    .cin(carry[0]),
    .s(sum[1]),
    .cout(carry[1]));

FullAdder FA2(
    .a(x[2]), 
    .b(y[2]^sel),
    .cin(carry[1]),
    .s(sum[2]),
    .cout(carry[2]));


FullAdder FA3(
    .a(x[3]), 
    .b(y[3]^sel),
    .cin(carry[2]),
    .s(sum[3]),
    .cout(carry[3]));
   
FullAdder FA4(
    .a(x[4]), 
    .b(y[4]^sel),
    .cin(carry[3]),
    .s(sum[4]),
    .cout(carry[4]));

FullAdder FA5(
    .a(x[5]), 
    .b(y[5]^sel),
    .cin(carry[4]),
    .s(sum[5]),
    .cout(c_out));
    
    
    assign overflow = c_out ^ carry[4];  //if we have a carry after the 4th or 5th sum we know the number is too big so this will put the overflow high.  
    //If there is a carry after both 4 and 5 there is no overflow 

endmodule    