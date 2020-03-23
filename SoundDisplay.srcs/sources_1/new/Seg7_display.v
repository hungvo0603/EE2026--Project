`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2020 15:24:07
// Design Name: 
// Module Name: Seg7_display
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


module Seg7_display(
    input CLOCK,
    input [16:0]fast_clock,
    input [4:0]read_mic, //varies from 0-16
    input [3:0] mode,
    output reg [3:0] an,
    output reg [7:0] seg
    );
    wire [3:0] new_an;
    parameter [7:0]num_0 = 8'b00000011;
    parameter [7:0]num_1 = 8'b10011111;
    parameter [7:0]num_2 = 8'b00100101;
    parameter [7:0]num_3 = 8'b00001101;
    parameter [7:0]num_4 = 8'b10011001;
    parameter [7:0]num_5 = 8'b01001001;
    parameter [7:0]num_6 = 8'b01000001;
    parameter [7:0]num_7 = 8'b00011111;
    parameter [7:0]num_8 = 8'b00000001;
    parameter [7:0]num_9 = 8'b00001001;
    parameter [7:0]char_H = 8'b10010001;
    parameter [7:0]char_I = 8'b11110011;
    parameter [7:0]char_L = 8'b11100011;
    parameter [7:0]char_W = 8'b10101011;
    parameter [7:0]char_M = 8'b01010111;
    parameter [7:0]char_E = 8'b01100001;
    always @ (posedge CLOCK)
    begin
        if (fast_clock == 0)
        begin
            if (mode == 0 || mode == 2) an = 4'b1111;
            else if (mode == 1)
            begin
            if ( read_mic == 16)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_H;
                else if (an == 4'b0111) seg <= char_I;
                else if (an == 4'b1011) seg <= num_1;
                else if (an == 4'b1101) seg <= num_6;
            end
            else if (read_mic == 15)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_H;
                else if (an == 4'b0111) seg <= char_I;
                else if (an == 4'b1011) seg <= num_1;
                else if (an == 4'b1101) seg <= num_5;
            end
            else if (read_mic == 14)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_H;
                else if (an == 4'b0111) seg <= char_I;
                else if (an == 4'b1011) seg <= num_1;
                else if (an == 4'b1101) seg <= num_4;
            end
            else if (read_mic == 13)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_H;
                else if (an == 4'b0111) seg <= char_I;
                else if (an == 4'b1011) seg <= num_1;
                else if (an == 4'b1101) seg <= num_3;
            end
            else if (read_mic == 12)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_H;
                else if (an == 4'b0111) seg <= char_I;
                else if (an == 4'b1011) seg <= num_1;
                else if (an == 4'b1101) seg <= num_2;
            end
            else if (read_mic == 11)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_H;
                else if (an == 4'b0111) seg <= char_I;
                else if (an == 4'b1011) seg <= num_1;
                else if (an == 4'b1101) seg <= num_1;
            end
            else if (read_mic == 10)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_M;
                else if (an == 4'b0111) seg <= char_E;
                else if (an == 4'b1011) seg <= num_1;
                else if (an == 4'b1101) seg <= num_0;
            end
            else if (read_mic == 9)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_M;
                else if (an == 4'b0111) seg <= char_E;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_9;
            end
            else if (read_mic == 8)
            begin
                if (an == 4'b1110 || an ==4'b1111) seg <= char_M;
                else if (an == 4'b0111) seg <= char_E;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_8;
            end
            else if (read_mic == 7)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_M;
                else if (an == 4'b0111) seg <= char_E;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_7;
            end
            else if (read_mic == 6)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_M;
                else if (an == 4'b0111) seg <= char_E;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_6;
            end
            else if (read_mic == 5)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_L;
                else if (an == 4'b0111) seg <= char_W;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_5;
            end
            else if (read_mic == 4)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_L;
                else if (an == 4'b0111) seg <= char_W;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_4;
            end
            else if (read_mic == 3)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_L;
                else if (an == 4'b0111) seg <= char_W;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_3;
            end
            else if (read_mic == 2)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_L;
                else if (an == 4'b0111) seg <= char_W;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_2;
            end
            else if (read_mic == 1)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_L;
                else if (an == 4'b0111) seg <= char_W;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_1;
            end
            else if (read_mic == 0)
            begin
                if (an == 4'b1110 || an == 4'b1111) seg <= char_L;
                else if (an == 4'b0111) seg <= char_W;
                else if (an == 4'b1011) seg <= num_0;
                else if (an == 4'b1101) seg <= num_0;
            end
            an <= new_an;
            end
        end
    end
    update_an update(an,new_an);
endmodule
