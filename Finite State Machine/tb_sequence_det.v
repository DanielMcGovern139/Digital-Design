`timescale 1fs / 1fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2021 17:56:47
// Design Name: 
// Module Name: tb_sequence_det
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


module tb_sequence_det(

    );
 reg clk;
wire max_tick_reg;
reg rst_n;
reg sh_en;
wire seq_detected;
wire lfsr_msb;
wire [8:0] counter;

seq_detector_top dut(.clk(clk), .sh_en(sh_en), .rst_n(rst_n), .max_tick_reg(max_tick_reg),.seq_detected(seq_detected), 
                      .lfsr_msb(lfsr_msb), .counter(counter));

initial
begin
    sh_en = 1'b1;
   end
  
  initial
begin
    rst_n = 1'b0; //setting reset to low to intialise the seed 
    #4;
    rst_n = 1'b1; //then back to 1 to start LFSR
    //#2097152
    #4194304; // (2^21)x2
    //#20000;
    //#2000;
    $finish; 
  
  end

initial begin 
	        clk	= 1'b0;
			forever	#1	clk	=	!clk;
			
			end 



    

endmodule
