`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2026 17:17:15
// Design Name: 
// Module Name: test_2
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

// 1. Clock Divider (125 MHz -> 1 Hz square wave)
module scan_clk(
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

// 2. Shifter (walks 1 LED at a time across all 64 positions)
module shifter(
    input  wire       clk,
    input  wire       rst,
    output wire [7:0] row,     // Active-LOW (0 = ON)
    output wire [7:0] column   // Active-HIGH (1 = ON)
);
    reg [2:0] row_idx = 3'd0;  // 0 to 7
    reg [2:0] col_idx = 3'd0;  // 0 to 7

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            row_idx <= 3'd0;
            col_idx <= 3'd0;
        end else begin
            if (col_idx == 3'd7) begin
                col_idx <= 3'd0;
                row_idx <= row_idx + 1'b1; // Wraps from 7 back to 0 automatically
            end else begin
                col_idx <= col_idx + 1'b1;
            end
        end
    end

    // Convert 0..7 index into one-hot signals
    assign row    = ~(8'b0000_0001 << row_idx); // Only active row is 0
    assign column =  (8'b0000_0001 << col_idx); // Only active col is 1
endmodule

// 3. Top-Level Module (connects everything to physical pins)
module test_2(
    input  wire clk,  // Connect to Zybo 125 MHz clock (K17) in .xdc
    input  wire rst,  // Connect to a Zybo push button in .xdc
    output wire a1, a2, a3, a4, a5, a6, a7, a8,
    output wire b1, b2, b3, b4, b5, b6, b7, b8
);
    // Internal wires to connect the modules
    wire       slow_clk;
    wire [7:0] r; // r[0] = Row 1 ... r[7] = Row 8
    wire [7:0] c; // c[0] = Col 1 ... c[7] = Col 8

    // Instantiate scan_clk
    scan_clk u_clk (
        .clk         (clk),
        .rst         (rst),
        .delayed_clk (slow_clk)
    );

    // Instantiate shifter (driven by slow_clk)
    shifter u_shift (
        .clk    (slow_clk),
        .rst    (rst),
        .row    (r),
        .column (c)
    );

    // Map rows (r[0]..r[7]) and cols (c[0]..c[7]) to your physical pins
    // Top edge (Pins 16 down to 9)
    assign a1 = c[7]; // Pin 16 -> Col 8
    assign a2 = c[6]; // Pin 15 -> Col 7
    assign a3 = r[1]; // Pin 14 -> Row 2
    assign a4 = c[0]; // Pin 13 -> Col 1
    assign a5 = r[3]; // Pin 12 -> Row 4
    assign a6 = c[5]; // Pin 11 -> Col 6
    assign a7 = c[3]; // Pin 10 -> Col 4
    assign a8 = r[0]; // Pin 9  -> Row 1

    // Bottom edge (Pins 1 to 8)
    assign b1 = r[4]; // Pin 1  -> Row 5
    assign b2 = r[6]; // Pin 2  -> Row 7
    assign b3 = c[1]; // Pin 3  -> Col 2
    assign b4 = c[2]; // Pin 4  -> Col 3
    assign b5 = r[7]; // Pin 5  -> Row 8
    assign b6 = c[4]; // Pin 6  -> Col 5
    assign b7 = r[5]; // Pin 7  -> Row 6
    assign b8 = r[2]; // Pin 8  -> Row 3
endmodule
