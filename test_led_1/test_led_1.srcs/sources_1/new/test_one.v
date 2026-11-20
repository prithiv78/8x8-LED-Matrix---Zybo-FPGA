`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2026 15:44:19
// Design Name: 
// Module Name: test_one
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

//module scan_clk(
//    input wire clk,
//    input wire rst,
//    output reg delayed_clk
//);
//    reg [26:0] temp = 27'b0;
//    always @(posedge clk or posedge rst) begin
//        if (rst) begin
//            temp  <= 0;
//            delayed_clk <= 0;
//        end else if (temp == 27'd124_999_999) begin
//            temp  <= 0;
//            delayed_clk <= ~delayed_clk;
//        end else begin
//            temp  <= temp + 1'b1;
//        end
//    end

//endmodule

//module shifter(
//    input wire clk,
//    input wire rst,
//    output reg [7:0] row = 8'b11111111,
//    output reg [7:0] column = 8'b00000000 
//);
//    integer i, j;
//    always @(posedge clk or posedge rst) begin
//        if (rst) begin
//            row <= 8'b11111111;
//            column <= 8'b00000000;
//        end else begin
//            for (i=0; i<8; i=i+1) begin 
//                if (row == 8'b0) begin
//                    row <= 8'b11111111;
//                end else begin
//                    row <= row - 8'b1;
//                end
//                for (j=0; j<8; j=j+j) begin 
//                    if (column == 8'b11111111) begin
//                        column <= 8'b0;
//                    end else begin
//                        column <= column + 8'b1;
//                    end
//                end
//            end
//        end 
//    end
//endmodule

module test_one(
    output wire a1, a2, a3, a4, a5, a6, a7, a8,
    output wire b1, b2, b3, b4, b5, b6, b7, b8
);
   // Top edge (left-to-right = Pins 16 down to 9)
    assign a1 = 1'b0; // Pin 16 -> Col 8
    assign a2 = 1'b0; // Pin 15 -> Col 7
    assign a3 = 1'b0; // Pin 14 -> Row 2
    assign a4 = 1'b1; // Pin 13 -> Col 1  <-- ON
    assign a5 = 1'b1; // Pin 12 -> Row 4
    assign a6 = 1'b0; // Pin 11 -> Col 6
    assign a7 = 1'b0; // Pin 10 -> Col 4
    assign a8 = 1'b1; // Pin 9  -> Row 1  <-- ON
    
    // Bottom edge (left-to-right = Pins 1 to 8)
    assign b1 = 1'b1; // Pin 1  -> Row 5
    assign b2 = 1'b1; // Pin 2  -> Row 7
    assign b3 = 1'b0; // Pin 3  -> Col 2
    assign b4 = 1'b0; // Pin 4  -> Col 3
    assign b5 = 1'b1; // Pin 5  -> Row 8
    assign b6 = 1'b0; // Pin 6  -> Col 5
    assign b7 = 1'b1; // Pin 7  -> Row 6
    assign b8 = 1'b1; // Pin 8  -> Row 3c8
endmodule
