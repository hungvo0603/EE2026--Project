`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 03:46:45 PM
// Design Name: 
// Module Name: clk3hz
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


module clk3hz(input clock,output reg clock_out = 0);
    reg [23:0] counter = 0;
    always @ (posedge clock) begin
        counter <= counter + 1;
        clock_out <= (counter == 0) ? ~clock_out : clock_out;
    end
endmodule
