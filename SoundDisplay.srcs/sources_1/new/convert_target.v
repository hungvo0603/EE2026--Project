`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 09:16:25 PM
// Design Name: 
// Module Name: convert_target
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


module convert_target(input [3:0] figure1, figure2, output [4:0] target);
    assign target = (figure1 - 1) + ((figure2)-1)*10;
endmodule
