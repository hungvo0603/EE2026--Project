`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2020 17:06:17
// Design Name: 
// Module Name: LED_blink
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


module LED_blink(
    input basys_clock,
    input [23:0]clk3hz,
    input [4:0] read_mic,
    input [4:0] read_mic_slow,
    input [3:0] mode,
    input [11:0] max_read,
    output reg [15:0] led
    );
    always @ (posedge basys_clock)
    begin
        if (clk3hz == 0)
        begin
        if (mode == 1)
        begin
            if (read_mic == 0) led = 0;
            else if (read_mic == 1) led = 1;
            else if (read_mic == 2) led = 3;
            else if (read_mic == 3) led = 7;
            else if (read_mic == 4) led = 15;
            else if (read_mic == 5) led = 31;
            else if (read_mic == 6) led = 63;
            else if (read_mic == 7) led = 127;
            else if (read_mic == 8) led = 255;
            else if (read_mic == 9) led = 511;
            else if (read_mic == 10) led = 1023;
            else if (read_mic == 11) led = 2047;
            else if (read_mic == 12) led = 4095;
            else if (read_mic == 13) led = 8191;
            else if (read_mic == 14) led = 16383;
            else if (read_mic == 15) led = 32767;
            else if (read_mic == 16) led = 65535;
        end
        else if (mode == 2) led [15:0] ={4'b0, max_read [11:0]};
        else if (mode == 3)
        begin
            if (read_mic_slow == 0) led = 0;
            else if (read_mic_slow == 1) led = 1;
            else if (read_mic_slow == 2) led = 3;
            else if (read_mic_slow == 3) led = 7;
            else if (read_mic_slow == 4) led = 15;
            else if (read_mic_slow == 5) led = 31;
            else if (read_mic_slow == 6) led = 63;
            else if (read_mic_slow == 7) led = 127;
            else if (read_mic_slow == 8) led = 255;
            else if (read_mic_slow == 9) led = 511;
            else if (read_mic_slow == 10) led = 1023;
            else if (read_mic_slow == 11) led = 2047;
            else if (read_mic_slow == 12) led = 4095;
            else if (read_mic_slow == 13) led = 8191;
            else if (read_mic_slow == 14) led = 16383;
            else if (read_mic_slow == 15) led = 32767;
            else if (read_mic_slow == 16) led = 65535;
        end
        else if (mode == 4)
        begin
            if (read_mic_slow == 0) led = 0;
            else if (read_mic_slow == 1) led = 1;
            else if (read_mic_slow == 2) led = 3;
            else if (read_mic_slow == 3) led = 7;
            else if (read_mic_slow == 4) led = 15;
            else if (read_mic_slow == 5) led = 31;
            else if (read_mic_slow == 6) led = 63;
            else if (read_mic_slow == 7) led = 127;
            else if (read_mic_slow == 8) led = 255;
            else if (read_mic_slow == 9) led = 511;
            else if (read_mic_slow == 10) led = 1023;
            else if (read_mic_slow == 11) led = 2047;
            else if (read_mic_slow == 12) led = 4095;
            else if (read_mic_slow == 13) led = 8191;
            else if (read_mic_slow == 14) led = 16383;
            else if (read_mic_slow == 15) led = 32767;
            else if (read_mic_slow == 16) led = 65535;

        end
        else led <= 0;
        end
    end
    
endmodule

