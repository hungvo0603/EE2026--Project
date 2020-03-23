`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 03:46:03 PM
// Design Name: 
// Module Name: single_pulse
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


module reset(input dff_clock,input d,output q_out);
    wire slowclock, one_out, two_out;
    
    clk3hz slowclk (dff_clock, slowclock);
    single_dff dff_one (slowclock, d, one_out);
    single_dff dff_two (slowclock, one_out, two_out);
    
    assign q_out = one_out & ~two_out;
    
endmodule
