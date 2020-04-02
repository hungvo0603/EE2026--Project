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


module display_turn(input [6:0] width, input [5:0] height, input CLOCK, input [3:0] turnA, turnB, input turn,
                    output reg [15:0] oled_dat_out);
        parameter WHITE = 16'hFFFF;
        parameter GREEN = 16'h07E0;
        parameter DARK_WHITE = 16'hFC70;
        parameter BLUE = 16'h001F;
        parameter RED = 16'hF800;
        parameter BLACK = 16'h0;
        
        // turn = 0 : A
        // turn = 1 : B
        
        always @ (posedge CLOCK) begin
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
        end
endmodule
