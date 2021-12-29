`timescale 1fs / 1fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 17:39:09
// Design Name: 
// Module Name: seq_detector_top
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


module seq_detector_top(
  input	clk,rst_n, 
  output seq_detected,
  output lfsr_msb,
  output max_tick_reg,
  output [8:0] counter  // 21 -12 = 9(LFSR SIZE - SEQ DETECT SIZE) 
    );
    
    wire [20:0]	Q_out;
    wire clk_out;
    wire sh_en = 1'b1;
    assign lfsr_msb = Q_out[20]; //LFSR_msb will show the stream of bits in the testbench
    
 //fsm module   
 fsm_seq_det I_fsm_seq_det(
   .clk(clk_out) ,.rst_n(rst_n),
   .lfsr_ouptut(Q_out[20]), //output from lfsr gets passed in to our FSM 
   .seq_detected(seq_detected), .max_tick_reg(max_tick_reg), .counter(counter));
    
 // clock module that scales the clock for implementation on the board
  //don't need this module for the simulation
   clock I_clock(
   .CCLK(clk),
   .clkscale(2500),
   .clk(clk_out)
 );
    
 //LFSR module, output gets passed to FSM  
 lfsr_21_bit I_lfsr_21_bit(
  	.clk(clk_out) ,.sh_en(sh_en),.rst_n(rst_n),
 	.Q_out(Q_out),
    .max_tick_reg(max_tick_reg));
    
    
endmodule
