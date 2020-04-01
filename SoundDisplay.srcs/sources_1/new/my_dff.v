`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 03:46:03 PM
// Design Name: 
// Module Name: single_dff
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


module my_dff(input CLOCK,input [17:0] dff_clock,input dff_in, output reg dff_out = 0 );
    always @ (posedge CLOCK)
    begin
        dff_out <= (dff_clock == 0) ? dff_in : dff_out;
    end
endmodule

