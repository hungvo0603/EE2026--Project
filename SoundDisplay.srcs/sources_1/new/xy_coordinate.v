`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2020 03:30:05 PM
// Design Name: 
// Module Name: xy_coordinate
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


module xy_coordinate(input [12:0] pix_idx, output [6:0] width_out, output [5:0] height_out);
    assign width_out = pix_idx % 96;
    assign height_out = pix_idx / 96;
endmodule
