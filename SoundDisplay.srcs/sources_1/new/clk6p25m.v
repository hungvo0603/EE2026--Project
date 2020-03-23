`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 03:54:31 PM
// Design Name: 
// Module Name: clk6p25m
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


module clk6p25m(input basys_clock,
                output reg clock_out = 0);
    reg [2:0] COUNTER = 0;
    
    always @ (posedge basys_clock) begin
        COUNTER <= COUNTER + 1;
        clock_out <= (COUNTER == 0) ? ~clock_out : clock_out;
    end
endmodule
