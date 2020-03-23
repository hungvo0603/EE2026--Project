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


module oled_board(input [4:0] volume_level, input theme, sw6, border_showing, volume_bar, components,
                  input clk_6p25, input [12:0] pix_idx, 
                  output reg [15:0] oled_dat_out); 
    
    parameter WHITE = 16'hFFFF;
    parameter BLACK = 16'h0;
    parameter BLUEBLUE = 16'h003F;
    parameter RED = 16'hF800;
    parameter BLUE = 16'h001F;
    parameter GREEN = 16'h07E0;
    parameter YELLOW = 16'hFFC0;
    parameter PINKPINK = 16'hFC70;
    //parameter 
    
    
    wire [6:0] width;
    wire [5:0] height;
    
    xy_coordinate (pix_idx, width, height);
    
    always @ (posedge clk_6p25) begin
        case (volume_level)
            0: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 0
            1: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57))) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57))) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57))) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57))) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 1
            2: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53))) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 2
            3: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 3
            4: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 4
            5: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 5
            6: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 6
            7: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 7
            8: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 8
            9: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else 
                        begin                             
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 9
            10: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 10
            11: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else 
                        begin
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 11
            12: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else 
                        begin
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 12 
            13: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else 
                        begin
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
            // endcase 13
            14: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else 
                        begin
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
        // endcase 14
            15: begin  
            if (components) begin
                if (!theme) begin // original theme: BLACK & WHITE border
                    if (!sw6) begin // one pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                     ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end 
                    else // three pixels border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                        begin
                            oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                     ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? BLACK : RED;
                        end else 
                        begin
                            oled_dat_out <= BLACK;
                        end
                    end
                end 
                else // alternative theme: PINKPINK & BLACK BORDER
                begin 
                    if (!sw6) begin // one-pixel border
                        if ((width==0) || (height==0) || (width==95) || (height==63)) 
                        begin
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                     ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else  
                        begin
                            oled_dat_out <= PINKPINK;
                        end
                    end 
                    else // three-pixel border
                    begin
                        if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                            oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                        end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                     ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                     ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                     ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                     ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                     ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                        begin // first layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                        end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                     ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                     ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                     ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                     ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                        begin // second layer
                            oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                        end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                     ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                     ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                     ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) )
                        begin
                            oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                        end else 
                        begin
                            oled_dat_out <= PINKPINK;   
                        end
                    end
                end
            end else
            begin
                oled_dat_out <= BLACK;
            end
        end
            default: begin  
                if (components) begin
                    if (!theme) begin // original theme: BLACK & WHITE border
                        if (!sw6) begin // one pixel border
                            if ((width==0) || (height==0) || (width==95) || (height==63)) 
                            begin
                                oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                            end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                         ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                         ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                         ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                         ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                         ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                            begin // first layer
                                oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                            end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                         ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                         ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                         ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                         ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                            begin // second layer
                                oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                            end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                         ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                         ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                         ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) ||
                                         ((width >= 42 && width <= 52) && (height <= 07 && height >= 06)) )
                            begin
                                oled_dat_out <= (!volume_bar) ? BLACK : RED;
                            end else 
                            begin
                                oled_dat_out <= BLACK;
                            end
                        end 
                        else // three pixels border
                        begin
                            if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) 
                            begin
                                oled_dat_out <= (!border_showing) ? BLACK : WHITE;
                            end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                         ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                         ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                         ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                         ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                         ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                            begin // first layer
                                oled_dat_out <= (!volume_bar) ? BLACK : GREEN;
                            end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                         ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                         ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                         ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                         ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                            begin // second layer
                                oled_dat_out <= (!volume_bar) ? BLACK : YELLOW;
                            end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                         ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                         ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                         ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) ||
                                         ((width >= 42 && width <= 52) && (height <= 07 && height >= 06)) )
                            begin
                                oled_dat_out <= (!volume_bar) ? BLACK : RED;
                            end else 
                            begin
                                oled_dat_out <= BLACK;
                            end
                        end
                    end 
                    else // alternative theme: PINKPINK & BLACK BORDER
                    begin 
                        if (!sw6) begin // one-pixel border
                            if ((width==0) || (height==0) || (width==95) || (height==63)) 
                            begin
                                oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                            end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                         ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                         ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                         ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                         ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                         ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                            begin // first layer
                                oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                            end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                         ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                         ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                         ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                         ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                            begin // second layer
                                oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                            end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                         ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                         ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                         ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) ||
                                         ((width >= 42 && width <= 52) && (height <= 07 && height >= 06)) )
                            begin
                                oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                            end else  
                            begin
                                oled_dat_out <= PINKPINK;
                            end
                        end 
                        else // three-pixel border
                        begin
                            if ((width<=2) || (height<=2) || (width>=93) || (height>=61)) begin                
                                oled_dat_out <= (!border_showing) ? PINKPINK : BLUEBLUE;
                            end else if (((width >= 42 && width <= 52) && (height <= 59 && height >= 57)) ||
                                         ((width >= 42 && width <= 52) && (height <= 55 && height >= 53)) ||
                                         ((width >= 42 && width <= 52) && (height <= 51 && height >= 49)) || 
                                         ((width >= 42 && width <= 52) && (height <= 47 && height >= 45)) ||
                                         ((width >= 42 && width <= 52) && (height <= 43 && height >= 41)) ||
                                         ((width >= 42 && width <= 52) && (height <= 39 && height >= 37)) ) 
                            begin // first layer
                                oled_dat_out <= (!volume_bar) ? PINKPINK : GREEN;
                            end else if (((width >= 42 && width <= 52) && (height <= 35 && height >= 34)) ||
                                         ((width >= 42 && width <= 52) && (height <= 32 && height >= 31)) ||
                                         ((width >= 42 && width <= 52) && (height <= 29 && height >= 28)) ||
                                         ((width >= 42 && width <= 52) && (height <= 26 && height >= 25)) ||
                                         ((width >= 42 && width <= 52) && (height <= 23 && height >= 22)) ) 
                            begin // second layer
                                oled_dat_out <= (!volume_bar) ? PINKPINK : YELLOW;
                            end else if (((width >= 42 && width <= 52) && (height <= 19 && height >= 18)) ||
                                         ((width >= 42 && width <= 52) && (height <= 16 && height >= 15)) ||
                                         ((width >= 42 && width <= 52) && (height <= 13 && height >= 12)) ||
                                         ((width >= 42 && width <= 52) && (height <= 10 && height >= 09)) ||
                                         ((width >= 42 && width <= 52) && (height <= 07 && height >= 06)) )
                            begin
                                oled_dat_out <= (!volume_bar) ? PINKPINK : RED;
                            end else 
                            begin
                                oled_dat_out <= PINKPINK;   
                            end
                        end
                    end
                end else
                begin
                    oled_dat_out <= BLACK;
                end
            end
        endcase
    end
endmodule
