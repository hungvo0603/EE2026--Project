`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2020 16:07:23
// Design Name: 
// Module Name: Convert_mic_in
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


module Convert_mic_in(
    input basys_clk,
    input [24:0]clk3hz,
    input clk20k,
    input [11:0] mic_in,
    output reg [11:0] max_read
    );
    reg [11:0] temp_max = 0;
    always @ (posedge basys_clk)
    begin
        if (clk3hz == 0)
        begin
            max_read <= temp_max;
            temp_max <= 0;
        end
        if (clk20k == 0)
        begin
            temp_max <= (mic_in > temp_max) ? mic_in : temp_max;
        end
    end
endmodule
