`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 03:30:30 PM
// Design Name: 
// Module Name: stadium
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


module stadium(input CLOCK, input clk_6p25, input [12:0] pix_indx, 
               output reg [15:0] oled_dat_out);
    parameter WHITE = 16'hFFFF;
    parameter GREEN = 16'h07E0;
    parameter DARK_WHITE = 16'hFC70;
    parameter BLUE = 16'h001F;
    parameter RED = 16'hF800;
    parameter BLACK = 16'h0;
    
    wire [6:0] width;
    wire [5:0] height;
    
    xy_coordinate (pix_indx, width, height);
    
    wire clk_3hz;
    clk3hz clk_3 (CLOCK, clk_3hz);
    
    reg [5:0] height_goalkeeper = 30;
    reg reverse_goalkeeper = 0;
    reg [5:0] height_striker = 30;
    reg reverse_striker = 0;
    
    always @ (posedge clk_3hz) begin
        height_goalkeeper = (height_goalkeeper >= 11 && height_goalkeeper <= 51 && !reverse_goalkeeper) ? height_goalkeeper + 2 :
                            (height_goalkeeper >= 11 && height_goalkeeper <= 51 && reverse_goalkeeper) ? height_goalkeeper - 2 : 
                            (height_goalkeeper <= 11) ? height_goalkeeper + 2 :
                            (height_goalkeeper >= 51) ? height_goalkeeper - 2 : height_goalkeeper;
        reverse_goalkeeper = (height_goalkeeper <= 11) ? 0 :
                             (height_goalkeeper >= 51) ? 1 : reverse_goalkeeper;
    end
    
    always @ (posedge clk_6p25) begin
        // goal
        if ((width >= 80 && width <= 94) && (height >= 11 && height <= 12) ||
            (width >= 80 && width <= 94) && (height >= 51 && height <= 52) ||
            (width >= 80 && width <= 81) && (height >= 11 && height <= 51)) // horizontal bar
            oled_dat_out <= WHITE;        
        // penalty kick area
        else if ((width >= 23 && width <= 25) && (height >= 18 && height <= 45)) 
            oled_dat_out <= DARK_WHITE;
        // circle
        else if ((width >= 74 && width <= 75 && (height == 0 || height == 63)) ||
                 (width >= 73 && width <= 74 && (height == 1 || height == 62)) ||
                 (width >= 72 && width <= 73 && (height == 2 || height == 61)) ||
                 (width >= 71 && width <= 72 && (height == 3 || height == 60)) ||
                 (width >= 70 && width <= 71 && (height == 4 || height == 59)) ||
                 (width >= 69 && width <= 70 && (height == 5 || height == 58)) ||
                 (width >= 68 && width <= 69 && (height == 6 || height == 57)) ||
                 (width >= 67 && width <= 68 && (height == 7 || height == 56)) ||
                 (width >= 66 && width <= 67 && (height == 8 || height == 55)) ||
                 (width >= 65 && width <= 66 && (height == 9 || height == 54)) ||
                 (width >= 64 && width <= 65 && (height == 10 || height == 53)) ||
                 (width >= 63 && width <= 64 && (height == 11 || height == 52)) ||
                 (width >= 62 && width <= 63 && (height == 12 || height == 51)) ||
                 (width >= 61 && width <= 62 && (height == 13 || height == 50)) ||
                 (width >= 60 && width <= 61 && (height == 14 || height == 49)) ||
                 (width >= 59 && width <= 60 && (height == 15 || height == 48)) ||
                 (width >= 58 && width <= 59 && (height == 16 || height == 47)) ||
                 (width >= 57 && width <= 58 && (height == 17 || height == 46)) ||
                 (width >= 56 && width <= 57 && (height == 18 || height == 45)) ||
                 (width >= 55 && width <= 56 && (height >= 19 && height <= 44)) )
            oled_dat_out <= WHITE;
        // goalkeeper
        else if (((height <= 32 && height >= 30) && (width >= 74 && width <= 76)) || // head
                 ((height <= 38 && height >= 32) && (width == 75)) ||                 // body
                  (height == 34 && (width >= 71 && width <= 79)) ||                 // arms
                  (height == 38 && (width >= 73 && width <= 77)) ||                 // legs
                 ((width == 73 || width == 77) && (height >= 38 && height <= 41)))                                    
            oled_dat_out <= BLACK;
        // striker
        else if (((height <= 38 && height >= 32) && (width == 15)) ||                 // body
                 ((height <= 32 && height >= 30) && (width <= 16 && width >= 14)) || // head
                 ((height == 34) && (width == 16 || width == 14)) ||                // arms
                 ((height == 35) && (width == 17 || width == 13)) ||
                 ((height == 36) && (width == 18 || width == 12)) ||
                 ((height == 38) && (width == 16 || width == 14)) ||                // legs
                 ((height == 39) && (width == 17 || width == 13)) ||
                 ((height == 40) && (width == 18 || width == 12)) )
            oled_dat_out <= BLACK;
        else
            oled_dat_out <= GREEN;
    end
endmodule
