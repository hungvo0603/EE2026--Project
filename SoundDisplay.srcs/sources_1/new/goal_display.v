`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 12:36:31 AM
// Design Name: 
// Module Name: goal_display
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


module goal_display(input clk_6p25, input [12:0] pix_indx, input goal, input miss,
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
    
    always @ (posedge clk_6p25) begin
        if (goal) begin
            if ((width >= 30 && width <= 36 && height >= 25 && height <= 26) ||
                (width >= 30 && width <= 31 && height >= 27 && height <= 33) || 
                (width >= 30 && width <= 34 && height >= 34 && height <= 35) || 
                (width >= 35 && width <= 36 && height >= 30 && height <= 35) ||
                (width >= 33 && width <= 34 && height >= 30 && height <= 31))
                oled_dat_out <= BLACK; // G 
            else if ((width >= 39 && width <= 45 && height >= 25 && height <= 26) ||
                     (width >= 39 && width <= 40 && height >= 25 && height <= 35) ||
                     (width >= 44 && width <= 45 && height >= 25 && height <= 35) ||
                     (width >= 39 && width <= 45 && height >= 34 && height <= 35))
                oled_dat_out <= BLACK; // O
            else if ((width >= 48 && width <= 54 && height >= 25 && height <= 26) ||
                     (width >= 48 && width <= 49 && height >= 27 && height <= 35) ||
                     (width >= 53 && width <= 54 && height >= 27 && height <= 35) ||
                     (width >= 49 && width <= 53 && height >= 30 && height <= 31))
                oled_dat_out <= BLACK; // A
            else if ((width >= 58 && width <= 63 && height >= 34 && height <= 35) ||
                     (width >= 58 && width <= 59 && height >= 25 && height <= 35))
                oled_dat_out <= BLACK; // L
            else if ((width >= 66 && width <= 67 && height >= 25 && height <= 32) ||
                     (width >= 66 && width <= 67 && height >= 34 && height <= 35))
                oled_dat_out <= BLACK;
            else
                oled_dat_out <= WHITE;
        end
        else if (miss) begin
            if (((width >= 25 && width <= 26) || (width >= 31 && width <= 32)) && height >= 25 && height <= 35 ||
                 ((width >= 27 && width <= 30) && height >= 25 && height <= 26))
                oled_dat_out <= BLACK; // N
            else if (((width >= 35 && width <= 36) || (width >= 40 && width <= 41)) && (height >= 25 && height <= 35) ||
                (width >= 37 && width <= 39) && ((height >= 25 && height <= 26) || (height >= 34 && height <= 35)))
                oled_dat_out <= BLACK; // O
            else if (((width >= 44 && width <= 45) || (width >= 49 && width <= 50)) && (height >= 25 && height <= 35) ||
                      (width >= 46 && width <= 48) && ((height >= 25 && height <= 26) || (height >= 34 && height <= 35)))
                oled_dat_out <= BLACK; // O
            else if (((width >= 53 && width <= 54) || (width >= 59 && width <= 60)) && (height >= 25 && height <= 35) ||
                      (width >= 55 && width <= 58) && ((height >= 25 && height <= 26) || (height >= 34 && height <= 35) ||
                      (height >= 29 && height <= 30)))
                oled_dat_out <= BLACK; // B
            else if (((width >= 62 && width <= 63) || (width >= 66 && width <= 67) || (width >= 70 && width <= 71)) &&
                      (height >= 34 && height <= 35))
                oled_dat_out <= BLACK;
            else oled_dat_out <= WHITE;
        end
        else oled_dat_out <= BLACK;
    end
endmodule

//            if ((width >= 25 && width <= 31 && height >= 25 && height <= 26) ||
//                (width >= 25 && width <= 26 && height >= 27 && height <= 29) ||
//                (width >= 30 && width <= 31 && height >= 31 && height <= 33) ||
//                (width >= 25 && width <= 31 && height >= 30 && height <= 31) ||
//                (width >= 25 && width <= 31 && height >= 34 && height <= 35))
//                oled_dat_out <= BLACK; // S
//            else if (((width >= 34 && width <= 35) || (width >= 40 && width <= 41) && height >= 25 && height <= 35) ||
//                      (width >= 36 && width <= 39 && height >= 30 && height <= 31))
//                oled_dat_out <= BLACK; // H
//            else if (((width >= 44 && width <= 45) || (width >= 49 && width <= 50) && height >= 25 && height <= 35) ||
//                      (width >= 46 && width <= 48) && ((height >= 25 && height <= 26) || height >= 30 && height <= 31))
//                oled_dat_out <= BLACK; // A