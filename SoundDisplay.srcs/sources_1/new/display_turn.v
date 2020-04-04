`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 09:04:25 PM
// Design Name: 
// Module Name: display_turn
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


module display_turn(input [6:0] width, input [5:0] height, input CLOCK, 
                    input [3:0] turnA, turnB, input turn, input [1:0] status,
                    output reg [15:0] oled_dat_out);
        parameter WHITE = 16'hFFFF;
        parameter GREEN = 16'h07E0;
        parameter DARK_WHITE = 16'hFC70;
        parameter BLUE = 16'h001F;
        parameter RED = 16'hF800;
        parameter BLACK = 16'h0;
        parameter YELLOW = 16'hDFE0;
        parameter PINK = 16'hF81F;
        
        // turn = 0 : A
        // turn = 1 : B
        
        always @ (posedge CLOCK) begin
            if (!status) begin
                if (turn) begin 
                    case (turnB)   
                        0:
                            if ((width >= 48 && width <= 67) && ((height >= 20 && height <= 21) || (height >= 49 && height <= 50)) ||
                                (height >= 20 && height <= 50) && ((width >= 48 && width <= 49) || (width >= 66 && width <= 67)))  
                            oled_dat_out <= BLACK;
                            else oled_dat_out <= WHITE;            
                        1:
                            if (width >= 64 && width <= 65 && height >= 20 && height <= 50)
                                oled_dat_out <= BLACK; // 1
                            else oled_dat_out <= WHITE;
                        2: // wrong
                            if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || (height >= 34 && height <= 35)
                                || (height >= 49 && height <= 50))) || 
                                (width >= 64 && width <= 65 && height >= 20 && height <= 35) ||
                                (width >= 45 && width <= 46 && height >= 36 && height <= 50))
                                oled_dat_out <= BLACK; // 2
                            else oled_dat_out <= WHITE;
                        3:
                            if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                                 (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                                 (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                                oled_dat_out <= BLACK; // 3
                            else oled_dat_out <= WHITE;
                        4:
                        if ((width >= 45 && width <= 46 && height >= 20 && height <= 35) ||
                            (width >= 64 && width <= 65 && height >= 20 && height <= 50) ||
                            (width >= 45 && width <= 65 && height >= 35 && height <= 36))
                                oled_dat_out <= BLACK; // 4
                            else oled_dat_out <= WHITE;
                        5:
                            if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                                 (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                                 (width >= 45 && width <= 46 && height >= 20 && height <= 35) ||
                                 (width >= 64 && width <= 65 && height >= 36 && height <= 50))
                                oled_dat_out <= BLACK; // 5
                            else oled_dat_out <= WHITE;
                        6:
                            if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                                (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                                (width >= 45 && width <= 46 && height >= 20 && height <= 50) ||
                                (width >= 64 && width <= 65 && height >= 36 && height <= 50))
                                oled_dat_out <= BLACK; // 6  
                            else oled_dat_out <= WHITE;                
                        7:
                            if (((width >= 45 && width <= 65) && (height >= 20 && height <= 21)) ||
                                (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                                oled_dat_out <= BLACK; // 7  
                            else oled_dat_out <= WHITE;                    
                        8:
                            if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                                (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                                (width >= 45 && width <= 46 && height >= 20 && height <= 50) ||
                                (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                                oled_dat_out <= BLACK; // 8   
                            else oled_dat_out <= WHITE;              
                        9:
                            if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                                (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                                (width >= 45 && width <= 46 && height >= 20 && height <= 35) ||
                                (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                                oled_dat_out <= BLACK; // 9  
                            else oled_dat_out <= WHITE;             
                    endcase
                    
                    if ((width >= 20 && width <= 35 && height >= 20 && height <= 21) || 
                        (width >= 20 && width <= 21 && height >= 20 && height <= 50) ||
                        (width >= 20 && width <= 40 && height >= 49 && height <= 50) ||
                        (width >= 39 && width <= 40 && height >= 35 && height <= 50) ||
                        (width >= 34 && width <= 35 && height >= 20 && height <= 34) ||
                        (width >= 20 && width <= 40 && height >= 35 && height <= 36))
                        oled_dat_out <= BLACK; // B
                end else begin
                    case (turnA)
                    0:
                        if ((width >= 48 && width <= 67) && ((height >= 20 && height <= 21) || (height >= 49 && height <= 50)) ||
                            (height >= 20 && height <= 50) && ((width >= 48 && width <= 49) || (width >= 66 && width <= 67)))  
                        oled_dat_out <= BLACK;
                        else oled_dat_out <= WHITE;           
                    1:
                        if (width >= 64 && width <= 65 && height >= 20 && height <= 50)
                            oled_dat_out <= BLACK; // 1
                        else oled_dat_out <= WHITE;
                    2: 
                        if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || (height >= 34 && height <= 35)
                            || (height >= 49 && height <= 50))) || 
                            (width >= 64 && width <= 65 && height >= 20 && height <= 35) ||
                            (width >= 45 && width <= 46 && height >= 36 && height <= 50))
                            oled_dat_out <= BLACK; // 2
                        else oled_dat_out <= WHITE;
                    3:
                        if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                             (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                             (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                            oled_dat_out <= BLACK; // 3
                        else oled_dat_out <= WHITE;
                    4:
                        if ((width >= 45 && width <= 46 && height >= 20 && height <= 35) ||
                            (width >= 64 && width <= 65 && height >= 20 && height <= 50) ||
                            (width >= 45 && width <= 65 && height >= 35 && height <= 36))
                            oled_dat_out <= BLACK; // 4
                        else oled_dat_out <= WHITE;
                    5:
                        if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                             (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                             (width >= 45 && width <= 46 && height >= 20 && height <= 35) ||
                             (width >= 64 && width <= 65 && height >= 36 && height <= 50))
                            oled_dat_out <= BLACK; // 5
                        else oled_dat_out <= WHITE;
                    6:
                        if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                            (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                            (width >= 45 && width <= 46 && height >= 20 && height <= 50) ||
                            (width >= 64 && width <= 65 && height >= 36 && height <= 50))
                            oled_dat_out <= BLACK; // 6  
                        else oled_dat_out <= WHITE;                
                    7:
                        if (((width >= 45 && width <= 65) && (height >= 20 && height <= 21)) ||
                            (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                            oled_dat_out <= BLACK; // 7  
                        else oled_dat_out <= WHITE;                    
                    8:
                        if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                            (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                            (width >= 45 && width <= 46 && height >= 20 && height <= 50) ||
                            (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                            oled_dat_out <= BLACK; // 8   
                        else oled_dat_out <= WHITE;              
                    9:
                        if (((width >= 45 && width <= 65) && ((height >= 20 && height <= 21) || 
                            (height >= 34 && height <= 35) || (height >= 49 && height <= 50))) ||
                            (width >= 45 && width <= 46 && height >= 20 && height <= 35) ||
                            (width >= 64 && width <= 65 && height >= 20 && height <= 50))
                            oled_dat_out <= BLACK; // 9  
                        else oled_dat_out <= WHITE;             
                endcase                
                    
                    if ((width >= 20 && width <= 40 && height >= 20 && height <= 21) || 
                       (width >= 20 && width <= 40 && height >= 34 && height <= 35) ||
                       (((width >= 20 && width <= 21) || (width >= 39 && width <= 40)) && (height >= 20 && height <= 50)))
                       oled_dat_out <= BLACK; // A            
                end
            end else if (status == 1) begin
                if ((width >= 35 && width <= 55 && ((height >= 20 && height <= 21) || (height >= 34 && height <= 35))) ||
                    ((width >= 35 && width <= 36) || (width >= 54 && width <= 55)) && height >= 20 && height <= 50)
                    oled_dat_out <= BLACK; // A
                else if ((width >= 40 && width <= 50 && height >= 16 && height <= 17) ||
                         (width >= 38 && width <= 40 && height >= 15 && height <= 16) ||
                         (width >= 50 && width <= 52 && height >= 15 && height <= 16) ||
                         (width >= 38 && width <= 39 && height >= 9 && height <= 15) ||
                         (width >= 51 && width <= 52 && height >= 9 && height <= 15) ||
                         (width >= 39 && width <= 40 && height >= 10 && height <= 11) ||
                         (width >= 50 && width <= 51 && height >= 10 && height <= 11) ||
                         (width >= 41 && width <= 42 && height >= 11 && height <= 12) ||
                         (width >= 48 && width <= 49 && height >= 11 && height <= 12) ||
                         (width >= 43 && width <= 44 && height >= 13 && height <= 14) ||
                         (width >= 46 && width <= 47 && height >= 13 && height <= 14) ||
                         ((width == 44 || width == 46) && height >= 10 && height <= 14) ||
                         ((width == 45 && height == 9)))
                    oled_dat_out <= YELLOW; // crown
                else oled_dat_out <= WHITE;
            end else if (status == 2) begin
                if ((width >= 35 && width <= 50 && height >= 20 && height <= 21) || 
                    (width >= 35 && width <= 36 && height >= 20 && height <= 50) ||
                    (width >= 35 && width <= 55 && height >= 49 && height <= 50) ||
                    (width >= 54 && width <= 55 && height >= 35 && height <= 50) ||
                    (width >= 49 && width <= 50 && height >= 20 && height <= 34) ||
                    (width >= 35 && width <= 55 && height >= 35 && height <= 36))
                oled_dat_out <= BLACK; // B
                else if ((width >= 38 && width <= 48 && height >= 16 && height <= 17) ||
                         (width >= 36 && width <= 38 && height >= 15 && height <= 16) ||
                         (width >= 48 && width <= 50 && height >= 15 && height <= 16) ||
                         (width >= 36 && width <= 37 && height >= 9 && height <= 15) ||
                         (width >= 49 && width <= 50 && height >= 9 && height <= 15) ||
                         (width >= 37 && width <= 38 && height >= 10 && height <= 11) ||
                         (width >= 48 && width <= 49 && height >= 10 && height <= 11) ||
                         (width >= 39 && width <= 40 && height >= 11 && height <= 12) ||
                         (width >= 46 && width <= 47 && height >= 11 && height <= 12) ||
                         (width >= 41 && width <= 42 && height >= 13 && height <= 14) ||
                         (width >= 44 && width <= 45 && height >= 13 && height <= 14) ||
                         ((width == 42 || width == 44) && height >= 10 && height <= 14) ||
                         ((width == 43 && height == 9)))
                    oled_dat_out <= YELLOW; // crown
                else oled_dat_out <= WHITE;                    
            end else if (status == 3) begin
                if ((width >= 39 && width <= 43 && height >= 19 && height <= 23) ||
                    (width == 41 && height >= 20 && height <= 35) ||
                    (width >= 34 && width <= 48 && height == 26) ||
                    ((width == 40 || width == 42) && height == 36) ||
                    ((width == 39 || width == 43) && height == 37) ||
                    ((width == 38 || width == 44) && height == 38) ||
                    ((width == 37 || width == 45) && height == 39) ||
                    ((width == 36 || width == 46) && height == 40) ||
                    ((width == 35 || width == 47) && height == 41) ||
                    ((width == 34 || width == 48) && height == 42))
                    oled_dat_out <= PINK;
                else if ((width >= 54 && width <= 58 && height >= 19 && height <= 23) ||
                        (width == 56 && height >= 20 && height <= 35) ||
                        (width >= 49 && width <= 63 && height == 26) ||
                        ((width == 55 || width == 57) && height == 36) ||
                        ((width == 54 || width == 58) && height == 37) ||
                        ((width == 53 || width == 59) && height == 38) ||
                        ((width == 52 || width == 60) && height == 39) ||
                        ((width == 51 || width == 61) && height == 40) ||
                        ((width == 50 || width == 62) && height == 41) ||
                        (((width == 49 || width == 63) && height == 42)))
                    oled_dat_out <= PINK;
                else oled_dat_out <= 16'h1850;
            end
        end
endmodule
