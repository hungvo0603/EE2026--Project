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


module my_2_dff(input CLOCK, input [17:0]dff_clock, input dff_input, output pulse);
    
    wire dff_out_one;
    wire dff_out_two;
    
    my_dff first_mod(CLOCK,dff_clock,dff_input,dff_out_one);
    my_dff second_mod(CLOCK,dff_clock,dff_out_one,dff_out_two);
    assign pulse = dff_out_one & ~dff_out_two;
endmodule


