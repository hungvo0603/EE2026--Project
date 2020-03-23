`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 03:10:23 PM
// Design Name: 
// Module Name: clk_div_20kHz
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


module clk20k(input CLOCK, output reg CLOCKOUT);
    reg [11:0] COUNTER = 0;
    
    always @ (posedge CLOCK) begin
        COUNTER <= (COUNTER == 2499) ? 0 : COUNTER + 1;
        CLOCKOUT <= (COUNTER == 0) ? ~CLOCKOUT : CLOCKOUT;
    end
endmodule
