
//////////////////////////////////////////////////////////////////////////////////
// CompanB: 
// Engineer: 
// 
// Create Date: 09.10.2021 14:00:54
// Design Name: 
// Module Name: tb_adder
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



// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps

`timescale 1 ns/10 ps
module tb_ALU(

    );

   // signal declaration
   reg  [5:0] A, B; //A, B and and sel
   reg [2:0] fxn;
   wire [5:0] X;
  
  ALU dut  // Design Under Test (DUT)
      (.A(A), .B(B) , .fxn(fxn), .X(X)); 
    

   //  test vector generator
   
   initial
   
   begin
      // test vector 1 - both positive
      A = 6'd4;
      B = 6'd3;
      fxn = 3'b000;
      # 100;
      // test vector 2 - both negative
      A = 6'b111011; //used binary to convert to negative number so this negative 5
      B = 6'b111011;
      fxn = 3'b001;
      # 100;
      // test vector 3 - both negative 
      A = 6'b111011;
      B = 6'b111011;
      fxn = 3'b010;
      # 100;
      // test vector 4 -  1 positive, 1 negative
      A = 6'd20;
      B = 6'b110000; //-16
      fxn = 3'b011;
      # 100;
      // test vector 5 - 2 positive, 
      A = 6'd27;
      B = 6'd29;
      fxn = 3'b100;
      # 100;
      // test vector 6 - both positive
      A = 6'd3;
      B = 6'd5;
      fxn = 3'b101;
      # 100;
      // test vector 7 - both positive
      A = 6'd2;
      B = 6'd3;
      fxn = 3'b110;
      # 100;
      // test vector 8
	  A = 6'd5;
      B = 6'd6;
      fxn = 3'b111;
      # 100;
      // stop simulation
      $stop;
   end
   initial 
   begin
   $display("A, B, fxn, X ");
   $monitor("%d %b %b  %b", $time, A, B, fxn, X); 
   end 
   

endmodule

