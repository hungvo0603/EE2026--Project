`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//  
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY : MONDAY P.M
//
//  STUDENT A NAME: TRA QUANG MINH THONG
//  STUDENT A MATRICULATION NUMBER: A0200659H
//
//  STUDENT B NAME: VO QUANG HUNG
//  STUDENT B MATRICULATION NUMBER: A0200697A
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (input CLOCK, input sw1, sw0, sw15, BTC, BTU, BTD, BTL, BTR,
    input sw7_freeze, sw6_border, sw5_theme, sw4_border_showing, sw3_volumebar, sw2_components, sw8,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output rgb_cs, rgb_sdin, rgb_sclk, rgb_d_cn, rgb_resn, rgb_vccen, rgb_pmoden,
    output [15:0] led,
    output [3:0] an ,
    output [7:0] seg 
    );
    wire clk625Hz, btc_pressed_H, btc_pressed, btu_pressed, btl_pressed, btr_pressed, btd_pressed;
    wire frame, pixel_send, sample_pix;
    wire [12:0] pixel_indx;
    wire [4:0] test_sts;
    wire [11:0]max_read; //largest value within sampled data
    wire [11:0]max_read_slow;
    wire [4:0] convert_max; //max_read converts to this value, varies from 0-16
    wire [4:0] convert_max_slow;
    wire [11:0] mic_in; //output signal of the Audio_capture
    wire clk20khz;
    
    wire [15:0] oled_data;
    wire clk3Hz;
    wire [15:0] oled_data_sound;
    wire [15:0] oled_data_stadium;
    wire [15:0] oled_data_goal;
    wire GOAL;
    wire MISS;
    wire [4:0] target;
    wire [1:0] status;
    
    reg [31:0] COUNT = 0;
    reg [3:0] mode = 0; //Allow the user to choose desired modes via the switches
    wire [3:0] figure1, figure2, turnA, turnB;
    wire turn;

    always @ (posedge CLOCK)
    begin
        COUNT <= COUNT+1;
        if (sw0 && !sw1 && !sw8 && !sw15) mode <= 1; // decimal
        else if (!sw0 && sw1 && !sw8 && !sw15) mode <= 2; // binary
        else if (!sw0 && !sw1 && !sw8 && sw15) mode <= 3; // enter game
        else if (sw8 && GOAL) mode <= 5;
        else if (sw8 && MISS) mode <= 6;
        else if (!sw1 && !sw0 && sw8 && sw15) mode <= 4;
        else mode <= 0;
    end
    
    assign oled_data = (mode <= 2 && mode != 0) ? oled_data_sound : (mode == 3 || mode == 4) ? oled_data_stadium : 
                       (mode == 5 || mode == 6) ? oled_data_goal : 0;
    
    clk20k (CLOCK, clk20khz);
    clk6p25m (CLOCK, clk625Hz);
    reset pulse_reset (CLOCK, BTC, btc_pressed_H);
    
    my_2_dff pulse_resetC (CLOCK, COUNT[17:0], BTC, btc_pressed);
    my_2_dff pulse_resetU (CLOCK, COUNT[17:0], BTU, btu_pressed);
    my_2_dff pulse_resetD (CLOCK, COUNT[17:0], BTD, btd_pressed);
    my_2_dff pulse_resetL (CLOCK, COUNT[17:0], BTL, btl_pressed);
    my_2_dff pulse_resetR (CLOCK, COUNT[17:0], BTR, btr_pressed);
    
    Convert_mic_in convert(CLOCK,COUNT[23:0],clk20khz,mic_in,max_read);
    Convert_mic_in_slow convert_slow(CLOCK,COUNT[24:0],clk20khz,mic_in,max_read_slow);
    Convert_max_mic max_mic_read(CLOCK,COUNT[23:0],sw7_freeze,max_read,convert_max);
    Convert_max_mic_slow max_mic_read_slow(CLOCK,COUNT[24:0],max_read,mode,convert_max_slow);
    LED_blink mode_led1(CLOCK,COUNT[23:0],convert_max,convert_max_slow,mode,max_read,led[15:0]);    
    Oled_Display oled_display (.clk(clk625Hz), .reset(btc_pressed_H), .frame_begin(frame), 
    .sending_pixels(pixel_send), .sample_pixel(sample_pix), .pixel_index(pixel_indx), 
    .pixel_data(oled_data), .cs(rgb_cs), .sdin(rgb_sdin), .sclk(rgb_sclk), .d_cn(rgb_d_cn), 
    .resn(rgb_resn), .vccen(rgb_vccen), .pmoden(rgb_pmoden), .teststate(test_sts));
    
    oled_board (CLOCK, convert_max, sw5_theme, sw6_border, sw4_border_showing, sw3_volumebar, 
                sw2_components, clk625Hz, pixel_indx, BTU, BTD, oled_data_sound);
                
    stadium (.clk_6p25(clk625Hz), .freeze(sw8), .pix_indx(pixel_indx), .actual(convert_max_slow), 
             .btnc(btc_pressed), .target(target), .sw15(sw15), .oled_dat_out(oled_data_stadium), 
             .GOAL(GOAL), .MISS(MISS), .turnA(turnA), .turnB(turnB), .turn(turn), .status(status));
    
    goal_display(.clk_6p25(clk625Hz), .pix_indx(pixel_indx), .goal(GOAL), .miss(MISS), .oled_dat_out(oled_data_goal));
    
    convert_target target_ (figure1, figure2, target);
    
    // Instantiate micro capture  
    Audio_Capture mic_capture(
          .CLK(CLOCK),                  
          .cs(clk20khz),                   
          .MISO(J_MIC3_Pin3),                 
          .clk_samp(J_MIC3_Pin1),            
          .sclk(J_MIC3_Pin4),            
          .sample(mic_in)     
          );
          
    Audio_Challenge soccer_game(
                .CLK(CLOCK),
                .press_clk(COUNT[23:0]),
                .fast_clk(COUNT[16:0]),
                .blink_clk(COUNT[25:0]),
                .mode(mode),
                .btnC(btc_pressed),
                .btnR(btr_pressed),
                .btnL(btl_pressed),
                .btnU(btu_pressed),
                .btnD(btd_pressed),
                .convert_max(convert_max),
                .convert_max_slow(convert_max_slow),
                .an(an),
                .seg(seg),
                .figure1(figure1),
                .figure2(figure2), 
                .turnA(turnA),
                .turnB(turnB),
                .turn(turn), 
                .status(status)
                );
                     

    // Delete this comment and write your codes and instantiations here

endmodule