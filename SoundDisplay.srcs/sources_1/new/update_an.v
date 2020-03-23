`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2020 15:30:07
// Design Name: 
// Module Name: update_an
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


module update_an(
    input [3:0] input_an,
    output [3:0] output_an
    );
    assign output_an = (input_an == 4'b1110 || input_an == 4'b1111) ? 4'b0111 : ~(~input_an >> 1);
endmodule
