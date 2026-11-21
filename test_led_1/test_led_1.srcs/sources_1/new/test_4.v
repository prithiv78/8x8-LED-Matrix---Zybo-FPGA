`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2026 16:56:17
// Design Name: 
// Module Name: test_4
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

//Multiple Led --> Faster clk
module scan_clk(
    input  wire clk,
    input  wire rst,
    output reg  scan_clk = 1'b0
);
    reg [25:0] temp = 26'd0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            temp <= 26'd0;
            scan_clk <= 1'b0;
        end else if (temp == 26'd62_499) begin
            temp <= 26'd0;
            scan_clk <= ~scan_clk;
        end else begin
            temp <= temp + 1'b1;
        end
    end
endmodule

//Different Characters --> Slower clk
module delay_clk(
    input  wire clk,
    input  wire rst,
    output reg  delayed_clk = 1'b0
);
    reg [25:0] temp = 26'd0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            temp        <= 26'd0;
            delayed_clk <= 1'b0;
        end else if (temp == 26'd62_499_999) begin // Half-second toggle = 1 Hz
            temp        <= 26'd0;
            delayed_clk <= ~delayed_clk;
        end else begin
            temp        <= temp + 1'b1;
        end
    end
endmodule

//Single Character --> Multiple LED
module led_on(

);

module test_4(

    );
endmodule
