`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2020 06:57:20
// Design Name: 
// Module Name: Convert_max_mic
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


module Convert_max_mic(
    input CLK,
    input [24:0] clk3hz,
    input freeze,
    input [11:0] max_convert,
    output reg [4:0] read
    );
     always @ (posedge CLK)
     begin
        if (clk3hz == 0)
            begin
            if (!freeze) begin
                if (max_convert < 2048) read <= 0;
                else if (2048 <= max_convert && max_convert < 2176) read <= 1;
                else if (2176 <= max_convert && max_convert < 2304) read <= 2;
                else if (2304 <= max_convert && max_convert < 2432) read <= 3;
                else if (2432 <= max_convert && max_convert < 2560) read <= 4; 
                else if (2560 <= max_convert && max_convert < 2688) read <= 5; 
                else if (2688 <= max_convert && max_convert < 2816) read <= 6;
                else if (2816 <= max_convert && max_convert < 2944) read <= 7;
                else if (2944 <= max_convert && max_convert < 3072) read <= 8;
                else if (3072 <= max_convert && max_convert < 3200) read <= 9; 
                else if (3200 <= max_convert && max_convert < 3328) read <= 10;
                else if (3328 <= max_convert && max_convert < 3456) read <= 11;
                else if (3456 <= max_convert && max_convert < 3584) read <= 12;
                else if (3584 <= max_convert && max_convert < 3712) read <= 13;
                else if (3712 <= max_convert && max_convert < 3840) read <= 14;
                else if (3840 <= max_convert && max_convert < 3968) read <= 15;
                else if (3968 <= max_convert && max_convert < 4096) read <= 16;
                end
            end else read <= read;
    end
endmodule
