`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2020 03:27:12 PM
// Design Name: 
// Module Name: oled_board
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


module oled_board(input CLOCK, input [4:0] volume_level, input theme, sw6, border_showing, volume_bar, components,
                  input clk_6p25, input [12:0] pix_idx, input btu, btd,
                  output reg [15:0] oled_dat_out); 
    //parameter 
    parameter WHITE = 16'hFFFF;
    parameter BLACK = 16'h0;
    parameter BLUEBLUE = 16'h003F;
    parameter RED = 16'hF800;
    parameter BLUE = 16'h001F;
    parameter GREEN = 16'h07E0;
    parameter YELLOW = 16'hFFC0;
    parameter PINKPINK = 16'hFC70;
    
    wire up_pressed, down_pressed;
    reset button_up (CLOCK, btu, up_pressed);
    reset button_down (CLOCK, btd, down_pressed);
    
    wire clk_6hz;
    clk6Hz clock6 (CLOCK, clk_6hz);
    
    reg [6:0] width_min = 42;
    reg [6:0] width_max = 52;
    
    wire [6:0] width;
    wire [5:0] height;
    
    xy_coordinate (pix_idx, width, height);
    
    always @ (posedge clk_6hz) begin
        if (up_pressed) begin
            width_min = (width_min >= 22) ? width_min - 1 : width_min;
            width_max = (width_max <= 72) ? width_max + 1 : width_max;
        end
        
        if (down_pressed) begin
            width_min = (width_min <= 46) ? width_min + 1 : width_min;
            width_max = (width_max >= 48) ? width_max - 1 : width_max;
        end
    end
    
    always @ (posedge clk_6p25) begin       
        // changing height of the volume bar
        if (components) begin
            if (!sw6) begin // one pixel border
                if ((width==0) || (height==0) || (width==95) || (height==63)) 
                    case ({border_showing, theme}) 
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= WHITE;
                        2'b11: oled_dat_out <= BLUEBLUE;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 59 && height >= 57) && volume_level >= 1)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase     
                else if ((width >= width_min && width <= width_max) && (height <= 55 && height >= 53) && volume_level >= 2) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 51 && height >= 49) && volume_level >= 3)  
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 47 && height >= 45) && volume_level >= 4) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 43 && height >= 41) && volume_level >= 5) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 39 && height >= 37) && volume_level >= 6) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 35 && height >= 34) && volume_level >= 7)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 32 && height >= 31) && volume_level >= 8)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase  
                else if ((width >= width_min && width <= width_max) && (height <= 29 && height >= 28) && volume_level >= 9) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 26 && height >= 25) && volume_level >= 10) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 23 && height >= 22) && volume_level >= 11) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 19 && height >= 18) && volume_level >= 12)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 16 && height >= 15) && volume_level >= 13)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 13 && height >= 12) && volume_level >= 14) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 10 && height >= 09) && volume_level >= 15) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 07 && height >= 06) && volume_level >= 16)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else 
                begin
                    oled_dat_out <= (theme) ? PINKPINK : BLACK;
                end
            end 
            else // three pixels border
            begin
                if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                    case ({border_showing, theme}) 
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= WHITE;
                        2'b11: oled_dat_out <= BLUEBLUE;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 59 && height >= 57) && volume_level >= 1)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase     
                else if ((width >= width_min && width <= width_max) && (height <= 55 && height >= 53) && volume_level >= 2) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 51 && height >= 49) && volume_level >= 3)  
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 47 && height >= 45) && volume_level >= 4) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 43 && height >= 41) && volume_level >= 5) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase
                else if ((width >= width_min && width <= width_max) && (height <= 39 && height >= 37) && volume_level >= 6) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= GREEN;
                        2'b11: oled_dat_out <= GREEN;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 35 && height >= 34) && volume_level >= 7)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 32 && height >= 31) && volume_level >= 8)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase  
                else if ((width >= width_min && width <= width_max) && (height <= 29 && height >= 28) && volume_level >= 9) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 26 && height >= 25) && volume_level >= 10) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 23 && height >= 22) && volume_level >= 11) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= YELLOW;
                        2'b11: oled_dat_out <= YELLOW;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 19 && height >= 18) && volume_level >= 12)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 16 && height >= 15) && volume_level >= 13)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 13 && height >= 12) && volume_level >= 14) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 10 && height >= 09) && volume_level >= 15) 
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else if ((width >= width_min && width <= width_max) && (height <= 07 && height >= 06) && volume_level >= 16)
                    case ({volume_bar, theme})
                        2'b00: oled_dat_out <= BLACK;
                        2'b01: oled_dat_out <= PINKPINK;
                        2'b10: oled_dat_out <= RED;
                        2'b11: oled_dat_out <= RED;
                    endcase 
                else 
                begin
                    oled_dat_out <= (theme) ? PINKPINK : BLACK;
                end
            end 
        end else oled_dat_out <= BLACK;
    end 
            
   
endmodule
