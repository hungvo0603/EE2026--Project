`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2020 13:12:03
// Design Name: 
// Module Name: display_score
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


module display_segment(
    input [31:0] CLK,
    input [16:0] fast_clock,
    input [3:0]score1, //A's score //left most // an[3]
    input [3:0]score2, //B's score
    input [3:0]figure1, //right most //an[0]
    input [3:0]figure2, //second right most //an[1]
    input pointer, //pointer = 0 => right most, pointer = 1 => second right most
    input turn, //turn = 0 => A's turn, // turn = 1 => B's turn
    input blink, //blink = 0 => bright, // blink = 1 => turn off
    input [3:0]mode,
    input goal,
    input [4:0] read_mic,
    input catch,
    input [1:0] status,
    output reg [3:0] an,
    output reg [7:0]seg
    );
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
    parameter [7:0]ba_que = 8'b01101101;
    parameter [7:0]char_H = 8'b10010001;
    parameter [7:0]char_I = 8'b10011111;
    parameter [7:0]char_L = 8'b11100011;
    parameter [7:0]char_W = 8'b10101011;
    parameter [7:0]char_M = 8'b01010111;
    parameter [7:0]char_E = 8'b01100001;
    parameter [7:0]char_A = 8'b00010001;
    parameter [7:0]char_N = 8'b11010101;
    parameter [7:0]char_B = 8'b11000001;
    parameter [7:0]char_D = 8'b10000101;
    parameter [7:0]char_R = 8'b11110101;
    parameter [7:0]null = 8'b11111111;
    wire [3:0] update_an;
    always @ (posedge CLK)
    begin
        if (fast_clock == 0)
        begin
            if (mode == 3)
            begin
                an <= update_an;
                if (status == 0)
                begin
                if (pointer == 0) //right most digit
                begin
                    if (turn == 0) //A's turn //left most digit
                    begin
                        if (an == 4'b1111 || an == 4'b1110)
                        begin
                            if (blink == 1) seg <= null;
                            else
                            begin
                            if (score1 == 0) seg <= num_0;
                            else if (score1 == 1) seg <= num_1;
                            else if (score1 == 2) seg <= num_2;
                            else if (score1 == 3) seg <= num_3;
                            else if (score1 == 4) seg <= num_4;
                            else if (score1 == 5) seg <= num_5;
                            else if (score1 == 6) seg <= num_6;
                            else if (score1 == 7) seg <= num_7;
                            else if (score1 == 8) seg <= num_8;
                            else if (score1 == 9) seg <= num_9;
                            end
                        end
                        else if (an == 4'b0111)
                        begin
                            //an <= update_an;
                            if (score2 == 0) seg = num_0;
                            else if (score2 == 1) seg <= num_1;
                            else if (score2 == 2) seg <= num_2;
                            else if (score2 == 3) seg <= num_3;
                            else if (score2 == 4) seg <= num_4;
                            else if (score2 == 5) seg <= num_5;
                            else if (score2 == 6) seg <= num_6;
                            else if (score2 == 7) seg <= num_7;
                            else if (score2 == 8) seg <= num_8;
                            else if (score2 == 9) seg <= num_9;                       
                        end
                        else if (an == 4'b1011)
                        begin
                            if (figure2 == 0) seg <= ba_que;
                            else if (figure2 == 1) seg <= num_0;
                            else if (figure2 == 2) seg <= num_1;
                            else if (figure2 == 3) seg <= num_2;
                            else if (figure2 == 4) seg <= num_3;
                            else if (figure2 == 5) seg <= num_4;
                            else if (figure2 == 6) seg <= num_5;
                            else if (figure2 == 7) seg <= num_6;
                            else if (figure2 == 8) seg <= num_7;
                            else if (figure2 == 9) seg <= num_8;
                            else if (figure2 == 10) seg <= num_9;
                        end
                        else if (an == 4'b1101)
                        begin
                            if (blink == 1) seg <= null;
                            else 
                            begin
                                if (figure1 == 0) seg <= ba_que;
                                else if (figure1 == 1) seg <= num_0;
                                else if (figure1 == 2) seg <= num_1;
                                else if (figure1 == 3) seg <= num_2;
                                else if (figure1 == 4) seg <= num_3;
                                else if (figure1 == 5) seg <= num_4;
                                else if (figure1 == 6) seg <= num_5;
                                else if (figure1 == 7) seg <= num_6;
                                else if (figure1 == 8) seg <= num_7;
                                else if (figure1 == 9) seg <= num_8;
                                else if (figure1 == 10) seg <= num_9;
                            end 
                        end
                    end
                    else if (turn == 1) //B's turn 
                    begin
                        if (an == 4'b1110 || an == 4'b1111)
                        begin
                            if (score1 == 0) seg <= num_0;
                            else if (score1 == 1) seg <= num_1;
                            else if (score1 == 2) seg <= num_2;
                            else if (score1 == 3) seg <= num_3;
                            else if (score1 == 4) seg <= num_4;
                            else if (score1 == 5) seg <= num_5;
                            else if (score1 == 6) seg <= num_6;
                            else if (score1 == 7) seg <= num_7;
                            else if (score1 == 8) seg <= num_8;
                            else if (score1 == 9) seg <= num_9;
                        end
                        else if (an == 4'b0111)
                        begin
                            if (blink == 1) seg <= null;
                            else 
                            begin 
                                if (score2 == 0) seg = num_0;
                                else if (score2 == 1) seg = num_1;
                                else if (score2 == 2) seg = num_2;
                                else if (score2 == 3) seg = num_3;
                                else if (score2 == 4) seg = num_4;
                                else if (score2 == 5) seg = num_5;
                                else if (score2 == 6) seg = num_6;
                                else if (score2 == 7) seg = num_7;
                                else if (score2 == 8) seg = num_8;
                                else if (score2 == 9) seg = num_9;                       
                            end
                        end
                        else if (an == 4'b1011)
                        begin
                            if (figure2 == 0) seg <= ba_que;
                            else if (figure2 == 1) seg <= num_0;
                            else if (figure2 == 2) seg <= num_1;
                            else if (figure2 == 3) seg <= num_2;
                            else if (figure2 == 4) seg <= num_3;
                            else if (figure2 == 5) seg <= num_4;
                            else if (figure2 == 6) seg <= num_5;
                            else if (figure2 == 7) seg <= num_6;
                            else if (figure2 == 8) seg <= num_7;
                            else if (figure2 == 9) seg <= num_8;
                            else if (figure2 == 10) seg <= num_9;
                        end
                        else if (an == 4'b1101)
                        begin
                        if (blink == 1) seg <= null;
                        else
                            begin
                                if (figure1 == 0) seg <= ba_que;
                                else if (figure1 == 1) seg <= num_0;
                                else if (figure1 == 2) seg <= num_1;
                                else if (figure1 == 3) seg <= num_2;
                                else if (figure1 == 4) seg <= num_3;
                                else if (figure1 == 5) seg <= num_4;
                                else if (figure1 == 6) seg <= num_5;
                                else if (figure1 == 7) seg <= num_6;
                                else if (figure1 == 8) seg <= num_7;
                                else if (figure1 == 9) seg <= num_8;
                                else if (figure1 == 10) seg <= num_9; 
                            end
                        end
                    end
                end
    
                else if (pointer == 1) //second right most
                begin
                    if (turn == 0) //A's turn //left most digit
                    begin
                        if (an == 4'b1111 || an == 4'b1110)
                        begin
                            if (blink == 1) seg <= null;
                            else begin
                                if (score1 == 0) seg = num_0;
                                else if (score1 == 1) seg = num_1;
                                else if (score1 == 2) seg = num_2;
                                else if (score1 == 3) seg = num_3;
                                else if (score1 == 4) seg = num_4;
                                else if (score1 == 5) seg = num_5;
                                else if (score1 == 6) seg = num_6;
                                else if (score1 == 7) seg = num_7;
                                else if (score1 == 8) seg = num_8;
                                else if (score1 == 9) seg = num_9;
                            end
                        end
                        else if (an == 4'b0111)
                        begin
                            if (score2 == 0) seg = num_0;
                            else if (score2 == 1) seg = num_1;
                            else if (score2 == 2) seg = num_2;
                            else if (score2 == 3) seg = num_3;
                            else if (score2 == 4) seg = num_4;
                            else if (score2 == 5) seg = num_5;
                            else if (score2 == 6) seg = num_6;
                            else if (score2 == 7) seg = num_7;
                            else if (score2 == 8) seg = num_8;
                            else if (score2 == 9) seg = num_9;                       
                        end
                        else if (an == 4'b1011)
                        begin
                            if (blink == 1) seg <= null;
                            else 
                            begin
                                if (figure2 == 0) seg <= ba_que;
                                else if (figure2 == 1) seg <= num_0;
                                else if (figure2 == 2) seg <= num_1;
                                else if (figure2 == 3) seg <= num_2;
                                else if (figure2 == 4) seg <= num_3;
                                else if (figure2 == 5) seg <= num_4;
                                else if (figure2 == 6) seg <= num_5;
                                else if (figure2 == 7) seg <= num_6;
                                else if (figure2 == 8) seg <= num_7;
                                else if (figure2 == 9) seg <= num_8;
                                else if (figure2 == 10) seg <= num_9;
                            end
                        end
                        else if (an == 4'b1101)
                        begin
                            if (figure1 == 0) seg <= ba_que;
                            else if (figure1 == 1) seg <= num_0;
                            else if (figure1 == 2) seg <= num_1;
                            else if (figure1 == 3) seg <= num_2;
                            else if (figure1 == 4) seg <= num_3;
                            else if (figure1 == 5) seg <= num_4;
                            else if (figure1 == 6) seg <= num_5;
                            else if (figure1 == 7) seg <= num_6;
                            else if (figure1 == 8) seg <= num_7;
                            else if (figure1 == 9) seg <= num_8;
                            else if (figure1 == 10) seg <= num_9; 
                        end
                    end
                    else if (turn == 1) //B's turn 
                    begin
                        if (an == 4'b1111 || an == 4'b1110 )
                        begin
                            if (score1 == 0) seg = num_0;
                            else if (score1 == 1) seg = num_1;
                            else if (score1 == 2) seg = num_2;
                            else if (score1 == 3) seg = num_3;
                            else if (score1 == 4) seg = num_4;
                            else if (score1 == 5) seg = num_5;
                            else if (score1 == 6) seg = num_6;
                            else if (score1 == 7) seg = num_7;
                            else if (score1 == 8) seg = num_8;
                            else if (score1 == 9) seg = num_9;
                        end
                        else if (an == 4'b0111)
                        begin
                            if (blink == 1) seg <= null;
                            else begin
                                if (score2 == 0) seg = num_0;
                                else if (score2 == 1) seg = num_1;
                                else if (score2 == 2) seg = num_2;
                                else if (score2 == 3) seg = num_3;
                                else if (score2 == 4) seg = num_4;
                                else if (score2 == 5) seg = num_5;
                                else if (score2 == 6) seg = num_6;
                                else if (score2 == 7) seg = num_7;
                                else if (score2 == 8) seg = num_8;
                                else if (score2 == 9) seg = num_9; 
                            end                      
                        end
                        else if (an == 4'b1011)
                        begin
                            if (blink == 1) seg <= null;                        
                            else begin
                                if (figure2 == 0) seg <= ba_que;
                                else if (figure2 == 1) seg <= num_0;
                                else if (figure2 == 2) seg <= num_1;
                                else if (figure2 == 3) seg <= num_2;
                                else if (figure2 == 4) seg <= num_3;
                                else if (figure2 == 5) seg <= num_4;
                                else if (figure2 == 6) seg <= num_5;
                                else if (figure2 == 7) seg <= num_6;
                                else if (figure2 == 8) seg <= num_7;
                                else if (figure2 == 9) seg <= num_8;
                                else if (figure2 == 10) seg <= num_9;
                            end
                        end
                        else if (an == 4'b1101)
                        begin
                            if (figure1 == 0) seg <= ba_que;
                            else if (figure1 == 1) seg <= num_0;
                            else if (figure1 == 2) seg <= num_1;
                            else if (figure1 == 3) seg <= num_2;
                            else if (figure1 == 4) seg <= num_3;
                            else if (figure1 == 5) seg <= num_4;
                            else if (figure1 == 6) seg <= num_5;
                            else if (figure1 == 7) seg <= num_6;
                            else if (figure1 == 8) seg <= num_7;
                            else if (figure1 == 9) seg <= num_8;
                            else if (figure1 == 10) seg <= num_9; 
                        end
                    end
                end
                end
                else if (status == 1)
                begin
                    if (an == 4'b1110 || an == 4'b1111) seg <= char_A;
                    else if (an == 4'b0111) seg <= char_W;
                    else if (an == 4'b1011) seg <= char_I;
                    else if (an == 4'b1101) seg <= char_N;                    
                end
                else if (status == 2)
                begin
                    if (an == 4'b1110 || an == 4'b1111) seg <= char_B;
                    else if (an == 4'b0111) seg <= char_W;
                    else if (an == 4'b1011) seg <= char_I;
                    else if (an == 4'b1101) seg <= char_N;                    
                end
                else if (status == 3)
                begin
                    if (an == 4'b1110 || an == 4'b1111) seg <= char_D;
                    else if (an == 4'b0111) seg <= char_R;
                    else if (an == 4'b1011) seg <= char_A;
                    else if (an == 4'b1101) seg <= char_W;                    
                end                
            end
            /*else if (mode == 0 || mode == 2) 
            begin
                an <= 4'b1111;
                seg <= 8'b11111111;
            end*/
            else if (mode == 1)
            //an <= update_an;
            begin
            an <= update_an;
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
            end
            else if (mode == 4)
            begin
            if (catch == 1)
            begin
                an <= update_an;
                if (!goal)
                begin
                    if (an == 4'b1110 || an == 4'b1111) seg<= char_M;
                    else if (an == 4'b0111) seg<= char_I;
                    else if (an == 4'b1011) seg<= num_5;
                    else if (an == 4'b1101) seg<= num_5;
                end
                else if (goal)
                begin
                    if (an == 4'b1110 || an == 4'b1111) seg<= num_9;
                    else if (an == 4'b0111) seg<= num_0;
                    else if (an == 4'b1011) seg<= char_A;
                    else if (an == 4'b1101) seg<= char_L;
                end
            end
            
            else 
            begin
                an <= update_an;
                if (pointer == 0) //right most digit
                begin
                    if (turn == 0) //A's turn //left most digit
                    begin
                        if (an == 4'b1111 || an == 4'b1110)
                        begin
                            if (blink == 1) seg <= null;
                            else
                            begin
                            if (score1 == 0) seg <= num_0;
                            else if (score1 == 1) seg <= num_1;
                            else if (score1 == 2) seg <= num_2;
                            else if (score1 == 3) seg <= num_3;
                            else if (score1 == 4) seg <= num_4;
                            else if (score1 == 5) seg <= num_5;
                            else if (score1 == 6) seg <= num_6;
                            else if (score1 == 7) seg <= num_7;
                            else if (score1 == 8) seg <= num_8;
                            else if (score1 == 9) seg <= num_9;
                            end
                        end
                        else if (an == 4'b0111)
                        begin
                            //an <= update_an;
                            if (score2 == 0) seg = num_0;
                            else if (score2 == 1) seg <= num_1;
                            else if (score2 == 2) seg <= num_2;
                            else if (score2 == 3) seg <= num_3;
                            else if (score2 == 4) seg <= num_4;
                            else if (score2 == 5) seg <= num_5;
                            else if (score2 == 6) seg <= num_6;
                            else if (score2 == 7) seg <= num_7;
                            else if (score2 == 8) seg <= num_8;
                            else if (score2 == 9) seg <= num_9;                       
                        end
                        else if (an == 4'b1011)
                        begin
                            if (figure2 == 0) seg <= ba_que;
                            else if (figure2 == 1) seg <= num_0;
                            else if (figure2 == 2) seg <= num_1;
                            else if (figure2 == 3) seg <= num_2;
                            else if (figure2 == 4) seg <= num_3;
                            else if (figure2 == 5) seg <= num_4;
                            else if (figure2 == 6) seg <= num_5;
                            else if (figure2 == 7) seg <= num_6;
                            else if (figure2 == 8) seg <= num_7;
                            else if (figure2 == 9) seg <= num_8;
                            else if (figure2 == 10) seg <= num_9;
                        end
                        else if (an == 4'b1101)
                        begin
                            if (blink == 1) seg <= null;
                            else 
                            begin
                                if (figure1 == 0) seg <= ba_que;
                                else if (figure1 == 1) seg <= num_0;
                                else if (figure1 == 2) seg <= num_1;
                                else if (figure1 == 3) seg <= num_2;
                                else if (figure1 == 4) seg <= num_3;
                                else if (figure1 == 5) seg <= num_4;
                                else if (figure1 == 6) seg <= num_5;
                                else if (figure1 == 7) seg <= num_6;
                                else if (figure1 == 8) seg <= num_7;
                                else if (figure1 == 9) seg <= num_8;
                                else if (figure1 == 10) seg <= num_9;
                            end 
                        end
                    end
                    else if (turn == 1) //B's turn 
                    begin
                        if (an == 4'b1110 || an == 4'b1111)
                        begin
                            if (score1 == 0) seg <= num_0;
                            else if (score1 == 1) seg <= num_1;
                            else if (score1 == 2) seg <= num_2;
                            else if (score1 == 3) seg <= num_3;
                            else if (score1 == 4) seg <= num_4;
                            else if (score1 == 5) seg <= num_5;
                            else if (score1 == 6) seg <= num_6;
                            else if (score1 == 7) seg <= num_7;
                            else if (score1 == 8) seg <= num_8;
                            else if (score1 == 9) seg <= num_9;
                        end
                        else if (an == 4'b0111)
                        begin
                            if (blink == 1) seg <= null;
                            else 
                            begin 
                                if (score2 == 0) seg = num_0;
                                else if (score2 == 1) seg = num_1;
                                else if (score2 == 2) seg = num_2;
                                else if (score2 == 3) seg = num_3;
                                else if (score2 == 4) seg = num_4;
                                else if (score2 == 5) seg = num_5;
                                else if (score2 == 6) seg = num_6;
                                else if (score2 == 7) seg = num_7;
                                else if (score2 == 8) seg = num_8;
                                else if (score2 == 9) seg = num_9;                       
                            end
                        end
                        else if (an == 4'b1011)
                        begin
                            if (figure2 == 0) seg <= ba_que;
                            else if (figure2 == 1) seg <= num_0;
                            else if (figure2 == 2) seg <= num_1;
                            else if (figure2 == 3) seg <= num_2;
                            else if (figure2 == 4) seg <= num_3;
                            else if (figure2 == 5) seg <= num_4;
                            else if (figure2 == 6) seg <= num_5;
                            else if (figure2 == 7) seg <= num_6;
                            else if (figure2 == 8) seg <= num_7;
                            else if (figure2 == 9) seg <= num_8;
                            else if (figure2 == 10) seg <= num_9;
                        end
                        else if (an == 4'b1101)
                        begin
                        if (blink == 1) seg <= null;
                        else
                            begin
                                if (figure1 == 0) seg <= ba_que;
                                else if (figure1 == 1) seg <= num_0;
                                else if (figure1 == 2) seg <= num_1;
                                else if (figure1 == 3) seg <= num_2;
                                else if (figure1 == 4) seg <= num_3;
                                else if (figure1 == 5) seg <= num_4;
                                else if (figure1 == 6) seg <= num_5;
                                else if (figure1 == 7) seg <= num_6;
                                else if (figure1 == 8) seg <= num_7;
                                else if (figure1 == 9) seg <= num_8;
                                else if (figure1 == 10) seg <= num_9; 
                            end
                        end
                    end
                end
    
                else if (pointer == 1) //second right most
                begin
                    if (turn == 0) //A's turn //left most digit
                    begin
                        if (an == 4'b1111 || an == 4'b1110)
                        begin
                            if (blink == 1) seg <= null;
                            else begin
                                if (score1 == 0) seg = num_0;
                                else if (score1 == 1) seg = num_1;
                                else if (score1 == 2) seg = num_2;
                                else if (score1 == 3) seg = num_3;
                                else if (score1 == 4) seg = num_4;
                                else if (score1 == 5) seg = num_5;
                                else if (score1 == 6) seg = num_6;
                                else if (score1 == 7) seg = num_7;
                                else if (score1 == 8) seg = num_8;
                                else if (score1 == 9) seg = num_9;
                            end
                        end
                        else if (an == 4'b0111)
                        begin
                            if (score2 == 0) seg = num_0;
                            else if (score2 == 1) seg = num_1;
                            else if (score2 == 2) seg = num_2;
                            else if (score2 == 3) seg = num_3;
                            else if (score2 == 4) seg = num_4;
                            else if (score2 == 5) seg = num_5;
                            else if (score2 == 6) seg = num_6;
                            else if (score2 == 7) seg = num_7;
                            else if (score2 == 8) seg = num_8;
                            else if (score2 == 9) seg = num_9;                       
                        end
                        else if (an == 4'b1011)
                        begin
                            if (blink == 1) seg <= null;
                            else 
                            begin
                                if (figure2 == 0) seg <= ba_que;
                                else if (figure2 == 1) seg <= num_0;
                                else if (figure2 == 2) seg <= num_1;
                                else if (figure2 == 3) seg <= num_2;
                                else if (figure2 == 4) seg <= num_3;
                                else if (figure2 == 5) seg <= num_4;
                                else if (figure2 == 6) seg <= num_5;
                                else if (figure2 == 7) seg <= num_6;
                                else if (figure2 == 8) seg <= num_7;
                                else if (figure2 == 9) seg <= num_8;
                                else if (figure2 == 10) seg <= num_9;
                            end
                        end
                        else if (an == 4'b1101)
                        begin
                            if (figure1 == 0) seg <= ba_que;
                            else if (figure1 == 1) seg <= num_0;
                            else if (figure1 == 2) seg <= num_1;
                            else if (figure1 == 3) seg <= num_2;
                            else if (figure1 == 4) seg <= num_3;
                            else if (figure1 == 5) seg <= num_4;
                            else if (figure1 == 6) seg <= num_5;
                            else if (figure1 == 7) seg <= num_6;
                            else if (figure1 == 8) seg <= num_7;
                            else if (figure1 == 9) seg <= num_8;
                            else if (figure1 == 10) seg <= num_9; 
                        end
                    end
                    else if (turn == 1) //B's turn 
                    begin
                        if (an == 4'b1111 || an == 4'b1110 )
                        begin
                            if (score1 == 0) seg = num_0;
                            else if (score1 == 1) seg = num_1;
                            else if (score1 == 2) seg = num_2;
                            else if (score1 == 3) seg = num_3;
                            else if (score1 == 4) seg = num_4;
                            else if (score1 == 5) seg = num_5;
                            else if (score1 == 6) seg = num_6;
                            else if (score1 == 7) seg = num_7;
                            else if (score1 == 8) seg = num_8;
                            else if (score1 == 9) seg = num_9;
                        end
                        else if (an == 4'b0111)
                        begin
                            if (blink == 1) seg <= null;
                            else begin
                                if (score2 == 0) seg = num_0;
                                else if (score2 == 1) seg = num_1;
                                else if (score2 == 2) seg = num_2;
                                else if (score2 == 3) seg = num_3;
                                else if (score2 == 4) seg = num_4;
                                else if (score2 == 5) seg = num_5;
                                else if (score2 == 6) seg = num_6;
                                else if (score2 == 7) seg = num_7;
                                else if (score2 == 8) seg = num_8;
                                else if (score2 == 9) seg = num_9; 
                            end                      
                        end
                        else if (an == 4'b1011)
                        begin
                            if (blink == 1) seg <= null;                        
                            else begin
                                if (figure2 == 0) seg <= ba_que;
                                else if (figure2 == 1) seg <= num_0;
                                else if (figure2 == 2) seg <= num_1;
                                else if (figure2 == 3) seg <= num_2;
                                else if (figure2 == 4) seg <= num_3;
                                else if (figure2 == 5) seg <= num_4;
                                else if (figure2 == 6) seg <= num_5;
                                else if (figure2 == 7) seg <= num_6;
                                else if (figure2 == 8) seg <= num_7;
                                else if (figure2 == 9) seg <= num_8;
                                else if (figure2 == 10) seg <= num_9;
                            end
                        end
                        else if (an == 4'b1101)
                        begin
                            if (figure1 == 0) seg <= ba_que;
                            else if (figure1 == 1) seg <= num_0;
                            else if (figure1 == 2) seg <= num_1;
                            else if (figure1 == 3) seg <= num_2;
                            else if (figure1 == 4) seg <= num_3;
                            else if (figure1 == 5) seg <= num_4;
                            else if (figure1 == 6) seg <= num_5;
                            else if (figure1 == 7) seg <= num_6;
                            else if (figure1 == 8) seg <= num_7;
                            else if (figure1 == 9) seg <= num_8;
                            else if (figure1 == 10) seg <= num_9; 
                        end
                    end
                end
            end
            end
            else 
            begin
                an <= 4'b1111;
                seg <= 8'b11111111;
            end
        end
    end
    update_an update(an,update_an); 
endmodule
