`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (input CLOCK, input BTC, input [1:0]sw,
    input sw7_freeze, sw6_border, sw5_theme, sw4_border_showing, sw3_volumebar, sw2_components,
    input BTU, BTD,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output rgb_cs, rgb_sdin, rgb_sclk, rgb_d_cn, rgb_resn, rgb_vccen, rgb_pmoden,
    output [15:0] led,
    output [3:0] an ,
    output [7:0] seg 
    );
    wire clk625Hz, btc_pressed;
    wire frame, pixel_send, sample_pix;
    wire [12:0] pixel_indx;
    wire [4:0] test_sts;
    wire [11:0]max_read; //largest value within sampled data
    wire [4:0] convert_max; //max_read converts to this value, varies from 0-16
    wire [11:0] mic_in; //output signal of the Audio_capture
    wire clk20khz;
    
    wire [15:0] oled_data;
    
    wire clk3Hz;
    reg [31:0] COUNT = 0;
    reg [3:0] mode = 0; //Allow the user to choose desired modes via the switches

    always @ (posedge CLOCK)
    begin
        COUNT <= COUNT+1;
        if (sw[0] == 1 && sw[1] == 0) mode <= 1;
        else if (sw[0] == 0 && sw[1] == 1) mode <= 2;
        else mode <= 0;
    end
    
    clk20k (CLOCK, clk20khz);
    clk6p25m (CLOCK, clk625Hz);
    reset pulse_reset (CLOCK, BTC, btc_pressed);
    Convert_mic_in convert(CLOCK,COUNT[24:0],clk20khz,mic_in,max_read);
    Convert_max_mic max_mic_read(CLOCK,COUNT[24:0],sw7_freeze,max_read,convert_max);
    Seg7_display mode_display1(CLOCK,COUNT[26:0],convert_max,mode,an[3:0],seg[7:0]);
    LED_blink mode_led1(CLOCK,COUNT[24:0],convert_max,mode,max_read,led[15:0]);
    // Instantiate oled display
    //assign oled_data = {mic_in[11:7], 6'b0, mic_in[11:7]}; //Include to the always block
    Oled_Display oled_display (.clk(clk625Hz), .reset(btc_pressed), .frame_begin(frame), 
    .sending_pixels(pixel_send), .sample_pixel(sample_pix), .pixel_index(pixel_indx), 
    .pixel_data(oled_data), .cs(rgb_cs), .sdin(rgb_sdin), .sclk(rgb_sclk), .d_cn(rgb_d_cn), 
    .resn(rgb_resn), .vccen(rgb_vccen), .pmoden(rgb_pmoden), .teststate(test_sts));
    
    oled_board (CLOCK, convert_max, sw5_theme, sw6_border, sw4_border_showing, sw3_volumebar, 
                sw2_components, clk625Hz, pixel_indx, BTU, BTD, oled_data);
    
    // Instantiate micro capture  
    Audio_Capture mic_capture(
          .CLK(CLOCK),                  
          .cs(clk20khz),                   
          .MISO(J_MIC3_Pin3),                 
          .clk_samp(J_MIC3_Pin1),            
          .sclk(J_MIC3_Pin4),            
          .sample(mic_in)     
          );
          
    //assign led = (sw0) ? mic_in : 0; //Include later to the always block      

    // Delete this comment and write your codes and instantiations here

endmodule