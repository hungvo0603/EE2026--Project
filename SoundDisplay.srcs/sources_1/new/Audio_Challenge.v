`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2020 10:05:06
// Design Name: 
// Module Name: Audio_Challenge
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


module Audio_Challenge(
    input [31:0] CLK,
    input [17:0] press_clk,
    input [16:0] fast_clk,
    input [25:0] blink_clk,
    input [3:0] mode,
    input  btnC,btnR,btnL,btnU,btnD,
    input [4:0] convert_max,
    input [4:0] convert_max_slow,
    output [3:0] an,
    output [7:0] seg,
    output reg [3:0] figure1 = 0, figure2 = 0, turnA = 0, turnB = 0, 
    output reg turn = 0
    );
    reg goal = 0;
    reg [3:0] score1 = 0;
    reg [3:0] score2 = 0;
    //reg [3:0] figure1 = 0;
    //reg [3:0] figure2 = 0;
    wire [3:0] reset_score1;
    wire [3:0] reset_score2;
    wire [3:0] reset_fig1;
    wire [3:0] reset_fig2;
    wire [3:0]temp_mode;
    reg pointer = 0;
//    reg turn = 0;
    reg blink = 0;
    reg [3:0]new_mode = 0;
    reg catch = 0;
    reg [1:0]status = 0; 
    // 0: nothing happen
    // 1: A wins
    // 2: B wins
    // 3: draw
//    reg [3:0]turnA = 0;
//    reg [3:0]turnB = 0;
    reg [4:0] upper = 16;
    reg [4:0] below = 0;
    always @ (posedge CLK)
    begin
        if (mode == 3)
        begin
            catch <= 0;
            if (press_clk == 0)
            begin
                if (btnR == 1|| btnL == 1) pointer <= ~pointer;
                if (btnU == 1 && btnD == 0)
                begin
                    if (pointer == 0)
                    begin
                        figure1 <= (figure1 == 10) ? 0 : figure1 + 1;
                        figure2 <= figure2;                       
                    end
                    else if (pointer == 1)
                    begin
                        figure1 <= figure1;
                        figure2 <= (figure2 == 2) ? 0 : figure2 + 1;
                    end                    
                end
                else if (btnD == 1 && btnU == 0)
                begin
                if (pointer == 0)
                    begin
                        figure1 <= (figure1 == 0) ? 10 : figure1 - 1;
                        figure2 <= figure2;                       
                    end
                    else if (pointer == 1)
                    begin
                        figure1 <= figure1;
                        figure2 <= (figure2 == 0) ? 2 : figure2 - 1;
                    end                                                        
                end
            end
            if (turnA == 3 && turnB == 3)
            begin
                if ((score1 > score2 ) && (score1 - score2 == 3)) status <= 1;
                else if ((score2 > score1) && (score2 - score1 == 3)) status <= 2;
                else status <= 0;                
            end 
            else if (turnA == 4 && turnB == 3)
            begin
                 if ((score1 > score2) && (score1 - score2 == 3)) status <= 1;
                 else if ((score2 > score1) && (score2 - score1 == 2)) status <= 2;
                 else status <= 0;
            end
            else if (turnA == 4 && turnB == 4)
            begin
                if ((score1 > score2) &&(score1 - score2 == 2)) status <= 1;
                else if ((score2 > score1)&&(score2 - score1 == 2 )) status <= 2;
                else status <= 0;
            end
            else if (turnA == 5 && turnB == 4)
            begin
                if ((score1 > score2)&&(score1 - score2 == 2)) status <= 1;
                else if ((score2 > score1) && (score2 - score1 == 1)) status <= 2;
                else status <= 0;               
            end
            else if (turnA == turnB && turnA > 4 && turnA < 9)
            begin
                if (score1 > score2) status <= 1;
                else if (score1 < score2) status <= 2;
                else status <= 0;
            end 
            else if (turnA == 9 && turnB == 9)
            begin
                if (score1 > score2) status <= 1;
                else if (score1 < score1) status <= 2;
                else if (score1 == score2) status <= 3;
            end
        end
        else if (mode == 4 || mode == 5 || mode == 6)
        begin
            upper <= ((figure1 - 1) + 10*(figure2 - 1) > 13) ? 16 : (figure1 - 1) + 10*(figure2 - 1) + 3;
            below <= ((figure1 - 1) + 10*(figure2 - 1) < 3) ? 0 : (figure1 - 1) + 10*(figure2 - 1) - 3;
            if (press_clk == 0)
            begin
                if (btnC == 1)
                begin
                    turn <= ~turn;
                    if ((convert_max_slow > below) &&(convert_max_slow < upper) ) 
                    begin
                        goal <= 1;
                        if (turn == 0) 
                        begin     
                            score1 <= score1 + 1;
                            turnA <= turnA + 1;
                        end                   
                        else
                        begin 
                            score2 <= score2 + 1;
                            turnB <= turnB + 1;
                        end
                    end
                    else 
                    begin
                        goal <= 0;
                        if (turn == 0) turnA <= turnA + 1;
                        else turnB <= turnB + 1;
                    end
                    catch <= 1;
                    if (mode >= 5) begin
                        figure1 <= 0;
                        figure2 <= 0;
                    end
                end
            end
            pointer <= 0;
        end
        else 
        begin
            score1 <= 0;
            score2 <= 0;
            figure1 <= 0;
            figure2 <= 0;
            pointer <= 0;
            turn <= 0;
            turnA <= 0;
            turnB <= 0;
            status <= 0;
        end
    end
    
    always @ (posedge CLK)
    begin
        if (blink_clk == 0)
            blink <= ~blink;
    end
    display_segment display(CLK,fast_clk,score1,score2,figure1,figure2,pointer,turn,blink,mode,goal,convert_max,catch,status,an,seg);
endmodule

