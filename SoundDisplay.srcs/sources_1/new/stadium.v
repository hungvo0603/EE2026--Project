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


module stadium(input clk_6p25, freeze, input [12:0] pix_indx, input sw15, btnc, input [4:0] actual, target,
               input [3:0] turnA, turnB, input turn, input [1:0] status,
               output reg [15:0] oled_dat_out, output reg GOAL = 0, output reg MISS = 0);
    parameter WHITE = 16'hFFFF;
    parameter GREEN = 16'h07E0;
    parameter DARK_WHITE = 16'hFC70;
    parameter BLUE = 16'h001F;
    parameter RED = 16'hF800;
    parameter BLACK = 16'h0;
    
    wire [6:0] width;
    wire [5:0] height;
    
    xy_coordinate (pix_indx, width, height);
    
    wire [15:0] oled_dat_turn;
    display_turn (.CLOCK(clk_6p25), .width(width), .height(height), .turn(turn), .turnA(turnA), .status(status),
                  .turnB(turnB), .oled_dat_out(oled_dat_turn));
    
//    wire clk_6hz;
//    clk6Hz clk_6 (CLOCK, clk_6hz);
    
    reg [5:0] height_goalkeeper = 30;
    reg reverse_goalkeeper = 0;
    reg [5:0] height_striker = 17;
    reg [6:0] width_striker = 11;
 
    reg [18:0] counter_ball = 0; // 25hz
    reg [6:0] width_ball = 19;
    reg [5:0] height_ball = 31;
    reg stop_ball = 0;
//    reg reset = 0;
    reg [20:0] counter = 0;
    reg disableMode = 0;
    reg freeze_gk = 0;
    reg [2:0] mode = 0;
    
    // display all on the board
    always @ (posedge clk_6p25) begin
        if (btnc) mode <= 1;
        if (freeze && disableMode) begin
            // CHANGING 
            counter <= counter + 1;
            if (counter == 0) begin
                // goalkeeper moving
                if (!freeze_gk) begin
                    if (mode >= 1)  begin             
                        if (actual == target) begin
                            height_goalkeeper <= (height_goalkeeper <= 41) ? height_goalkeeper + 2 : height_goalkeeper;
                        end else if (target <= actual + 2 && target > actual) begin // goslkeeper moves down
                            height_goalkeeper <= (!reverse_goalkeeper) ? height_goalkeeper - 2 : height_goalkeeper + 2;
                        end else if ((target >= actual - 2 && target < actual && actual >= 2) ||
                                     (target == 0 && actual <= 1)) begin // goalkeeper moves up
                            height_goalkeeper <= (!reverse_goalkeeper) ? height_goalkeeper + 2 : height_goalkeeper - 2;
                        end else begin // stands still
                            height_goalkeeper <= height_goalkeeper;
                        end
                    end
                    
                    reverse_goalkeeper <= (height_goalkeeper <= 11) ? 0 :
                                         (height_goalkeeper >= 41) ? 1 : reverse_goalkeeper;
                end
                
                // striker moving
                if (mode == 1 && sw15) begin
                    if (width_striker >= 11 && width_striker <= 15)                
                        width_striker <= width_striker + 1;
                    else if (width_striker < 11) width_striker <= width_striker + 1;
                    else if (width_striker > 15) begin
                        mode <= 2;
                    end
                    else width_striker <= width_striker;      
                end
            
                if (mode == 1 && sw15) begin
                    height_striker <= (height_striker >= 17 && height_striker <= 21) ? height_striker + 1 :
                                      (height_striker <= 17) ? height_striker + 1 :
                                      (height_striker >= 21) ? height_striker - 1 : height_striker;
                end
                
                
                if (mode == 2) mode <= 3;
                if (mode == 3 && !GOAL) mode <= 4;            
            
            end
            

        
            // DRAWING
            // ball
            if ((width >= width_ball && width <= width_ball+3) && (height >= height_ball && height <= height_ball+3))
                oled_dat_out <= RED;
            // goal
            else if ((width >= 80 && width <= 94) && (height >= 11 && height <= 12) ||
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
            else if (((height <= height_goalkeeper + 2 && height >= height_goalkeeper) && (width >= 74 && width <= 76)) || // head
                     ((height <= height_goalkeeper + 8 && height >= height_goalkeeper + 2) && (width == 75)) ||                 // body
                      (height == height_goalkeeper + 4 && (width >= 71 && width <= 79)) ||                 // arms
                      (height == height_goalkeeper + 8 && (width >= 73 && width <= 77)) ||                 // legs
                     ((width == 73 || width == 77) && (height >= height_goalkeeper + 8 && height <= height_goalkeeper + 11)))                                    
                oled_dat_out <= BLACK;
            else
                oled_dat_out <= GREEN;
            
            // striker
            if (mode <= 1 && sw15) begin
                if   (((height <= height_striker + 8 && height >= height_striker + 2) && (width == width_striker - 1)) ||                 // body
                     ((height <= height_striker + 2 && height >= height_striker) && (width >= width_striker - 2  && width <= width_striker)) || // head
                     ((height == height_striker + 4) && (width == width_striker || width == width_striker - 2)) ||                // arms
                     ((height == height_striker + 5) && (width == width_striker + 1 || width == width_striker - 3)) ||
                     ((height == height_striker + 6) && (width == width_striker + 2 || width == width_striker - 4)) ||
                     ((height == height_striker + 8) && (width == width_striker || width == width_striker - 2)) ||                // legs
                     ((height == height_striker + 9) && (width == width_striker + 1 || width == width_striker - 3)) ||
                     ((height == height_striker + 10) && (width == width_striker + 2 || width == width_striker - 4)))
                oled_dat_out <= BLACK;
            // kick stand
            end else if (mode == 2 && sw15) begin 
                if   (((height <= 29 && height >= 23) && (width == 15)) ||                 // body
                     ((height <= 23 && height >= 21) && (width >= 14  && width <= 16)) || // head
                     ((height == 25) && (width == 16 || width == 14)) ||                // arms
                     ((height == 26) && (width == 17 || width == 13)) ||
                     ((height == 27) && (width == 18 || width == 12)) ||
                     (height == 29 && width == 16) || (height == 29 && width == 15) || // legs
                     (height == 30 && width == 17) || (height == 30 && width == 15) ||
                     (height == 31 && width == 17) || (height == 31 && width == 14) ||
                     (height == 32 && width == 17) || (height == 32 && width == 13))
                oled_dat_out <= BLACK;
            // kick the ball 
            end else if ((mode == 3 || mode == 4) && sw15) begin
                if  (((height <= 29 && height >= 23) && (width == 15)) ||                 // body
                    ((height <= 23 && height >= 21) && (width >= 14  && width <= 16)) || // head
                    ((height == 25) && (width == 16 || width == 14)) ||                // arms
                    ((height == 26) && (width == 17 || width == 13)) ||
                    ((height == 27) && (width == 18 || width == 12)) ||
                    ((height == 29 || height == 30) && width == 15)  || (height == 29 && width == 16) || // legs
                    ((height == 31 || height == 32) && width == 14) || (height == 30 && width == 17) ||
                    (height == 31 && width == 18) || (height == 32 && width == 19))
                oled_dat_out <= BLACK;
            end
            
            if (mode == 4 && sw15) begin
                counter_ball <= counter_ball + 1;
                if (counter_ball == 0) begin
                    width_ball <= (stop_ball) ? width_ball : width_ball + 4; // cases
                    height_ball <= (stop_ball) ? height_ball : height_ball + 1;
                    // +4 +1 // +4 -1 // +4 -2 // +4 +2 // +4 +0
                    if (!stop_ball) begin
                        width_ball <= width_ball + 4;
                        height_ball <= (target == actual) ? height_ball :
                                       (target <= actual + 2 && target > actual) ? height_ball + 1 :
                                       ((target >= actual - 2 && target < actual) || (target == 0 && actual <= 1)) ? height_ball - 1 :
                                       (target > actual + 2) ? height_ball + 2 : height_ball - 2;
                    end else begin
                        width_ball <= width_ball;
                        height_ball <= height_ball;
                    end
                end // 90 94 11 52
                if ((width_ball >= 71 && height_ball >= height_goalkeeper && height_ball <= height_goalkeeper + 11) ||
                    (width_ball >= 80 && (height_ball >= 52 || height_ball <= 11)) ||
                    (height_ball == 61 || height_ball == 0))
                begin
                    stop_ball = 1; // the goalkeeper caught the ball // or the ball goes out eventually
                    mode <= 3;
                    freeze_gk = 1;
                    GOAL = 0;
                    MISS = 1;
                end
                else if (((width_ball >= 85) && (width_ball <= 94)) && (height_ball >= 11) && (height_ball <= 51)) begin
                    stop_ball = 1;
                    mode <= 3;
                    GOAL = 1;
                    MISS = 0;
                    freeze_gk = 1;
                end
            end
        end else begin
            disableMode = 1;
            width_ball = 19;
            height_ball = 31;
            height_goalkeeper = 30;
            width_striker = 11;
            height_striker = 17;
            reverse_goalkeeper <= 0;
            mode <= 0;
            oled_dat_out <= oled_dat_turn;
            stop_ball = 0;
            GOAL = 0;
            MISS = 0;
            freeze_gk = 0;
        end

    end
endmodule
