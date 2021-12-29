`timescale 1fs / 1fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 17:13:54
// Design Name: 
// Module Name: fsm_seq_det
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


module fsm_seq_det(

  input	clk,rst_n,
  input lfsr_ouptut,
  output  seq_detected,
  input  max_tick_reg,

  output reg [8:0] counter

    );
    
    reg [3:0] curr_state, nxt_state;


//110001110010 
//ABCDEFGHIJKL   

localparam IDLE = 4'b0000;  // Reset state 
localparam   A  = 4'b0001;  // 1 is detected 
localparam   B  = 4'b0010;  // 11 is detected 
localparam   C  = 4'b0011;  // 110 is detected 
localparam   D  = 4'b0100;  // 1100 is detected 
localparam   E  = 4'b0101;  // 11000 is detected
localparam   F  = 4'b0110;  // 110001 is detected
localparam   G  = 4'b0111;  // 1100011 is detected
localparam   H  = 4'b1000;  // 11000111 is detected
localparam   I  = 4'b1001;  // 110001110 is detected
localparam   J  = 4'b1010;  // 1100011100 is detected
localparam   K  = 4'b1011;  // 11000111001 is detected
localparam   L  = 4'b1100;  // 110001110010 is detected


assign    seq_detected = (curr_state == L) ? 1'b1 : 1'b0; //if the current state has reached L, we have decected the 
                                                          //sequence so we set seq_detected high else it stays low

always @ (posedge clk) begin //rising edge clk
if(!rst_n) begin
		 curr_state	<=	IDLE; //current state to IDLE
		 counter ='d0; //set the counter to 0
		 end
		 
		 else begin 
	  
		    curr_state <= nxt_state;
   if (nxt_state == L)//if this is true then we have seen our sequence 
                      //and we append count by 1
   begin
   counter <= counter +1;
   end 
 
     if (max_tick_reg) //if the max_tick_reg is high..then we have completed full LFSR
                       //cycle so we set the counter back to 0 to start again..
     counter <='d0;
   
end

end


always @ (*) begin //in this always block we go through our sequence 110001110010
                   //moving to the next state if the right bit is seen or going back to a 
                   //previous state if the wrong bit is seen
case (curr_state)

IDLE : begin 
        if (lfsr_ouptut)
          nxt_state = A;
         else 
           nxt_state  =IDLE;
       end 
 
 A : begin 
        if (lfsr_ouptut)
          nxt_state  = B;
         else 
           nxt_state  = IDLE;
       end 
B : begin 
        if (!lfsr_ouptut)
          nxt_state  = C;
         else 
           nxt_state  = A;
       end 
 C : begin 
        if (!lfsr_ouptut)
          nxt_state  = D;
         else 
           nxt_state  = A;
       end 
 D : begin 
        if (!lfsr_ouptut)
          nxt_state  = E;
         else 
           nxt_state  = A;
       end 
 E : begin 
        if (lfsr_ouptut)
          nxt_state  = F;
         else 
           nxt_state  = IDLE;
       end 
 F : begin 
        if (lfsr_ouptut)
          nxt_state  = G;
         else 
           nxt_state  =IDLE;
       end 
 G : begin 
        if (lfsr_ouptut)
          nxt_state  = H;
         else 
           nxt_state  = C;
       end 
 H : begin 
        if (!lfsr_ouptut)
          nxt_state  = I;
         else 
           nxt_state  =A;
       end 
 I : begin 
        if (!lfsr_ouptut)
          nxt_state  = J;
         else 
           nxt_state  =A;
       end 
 J : begin 
        if (lfsr_ouptut)
          nxt_state  = K;
         else 
           nxt_state = E;
       end 
 K : begin 
        if (!lfsr_ouptut)
          nxt_state  = L;
         else 
          nxt_state  = A;
       end 
       
        
 L:  begin
     if (lfsr_ouptut)
          nxt_state =A;
         else 
           nxt_state  =IDLE;
       end 
 
      
    
default: 
         nxt_state = IDLE; //our default is back to our idle setting

          
endcase
end


    
    
    
    
    
endmodule
