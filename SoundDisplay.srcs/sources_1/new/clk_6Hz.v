`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 03:01:08 PM
// Design Name: 
// Module Name: clk_6Hz
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


module clk6Hz(input CLOCK, output reg CLOCKOUT = 0);
    reg [22:0] counter = 0;
    
    always @ (posedge CLOCK) begin
        counter <= counter + 1;
        CLOCKOUT <= (counter == 0) ? ~CLOCKOUT : CLOCKOUT;
    end
endmodule

