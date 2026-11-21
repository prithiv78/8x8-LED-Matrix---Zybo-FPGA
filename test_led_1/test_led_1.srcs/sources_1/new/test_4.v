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

//Multiple Characters --> row and column values
module led_out(
    input wire delayed_clk, scan_clk,
    input wire rst,
    output wire [7:0] row,
    output reg [7:0] column = 8'b0000_0000
);
    reg [2:0] idx = 3'b000;
    reg [2:0] row_idx = 3'b000;
    
    always @(posedge delayed_clk or posedge rst) begin 
        if (rst) begin 
            idx <= 3'b000;
        end else if (idx < 3'b101) begin 
            idx <= idx + 1'b1;
        end else begin 
            idx <= 3'b000;
        end
    end
    
    always @(posedge scan_clk or posedge rst) begin
        if (rst)
            row_idx <= 3'd0;
        else
            row_idx <= row_idx + 1'b1;
    end
    
    assign row = ~(8'b0000_0001 << row_idx);
    
    always @(*) begin 
        case (idx)
        
        3'b000: begin //I          
                case (row_idx)
                    3'd0: column = 8'b1111_1111;
                    3'd1: column = 8'b1111_1111;
                    3'd2: column = 8'b0001_1000;
                    3'd3: column = 8'b0001_1000;
                    3'd4: column = 8'b0001_1000;
                    3'd5: column = 8'b0001_1000;
                    3'd6: column = 8'b1111_1111;
                    3'd7: column = 8'b1111_1111;
                    default: column = 8'b0000_0000;
                endcase
        end
        3'b001: begin //I       
                case (row_idx)
                    3'd0: column = 8'b1111_1111;
                    3'd1: column = 8'b1111_1111;
                    3'd2: column = 8'b0001_1000;
                    3'd3: column = 8'b0001_1000;
                    3'd4: column = 8'b0001_1000;
                    3'd5: column = 8'b0001_1000;
                    3'd6: column = 8'b1111_1111;
                    3'd7: column = 8'b1111_1111;
                    default: column = 8'b0000_0000;
                endcase
        end
        
        3'b010: begin //T          
                case (row_idx)
                    3'd0: column = 8'b1111_1111;
                    3'd1: column = 8'b1111_1111;
                    3'd2: column = 8'b0001_1000;
                    3'd3: column = 8'b0001_1000;
                    3'd4: column = 8'b0001_1000;
                    3'd5: column = 8'b0001_1000;
                    3'd6: column = 8'b0001_1000;
                    3'd7: column = 8'b0001_1000;
                    default: column = 8'b0000_0000;
                endcase
        end
        
        3'b011: begin  //P         
                case (row_idx)
                    3'd0: column = 8'b1111_1110;
                    3'd1: column = 8'b1111_1111;
                    3'd2: column = 8'b1100_0011;
                    3'd3: column = 8'b1111_1111;
                    3'd4: column = 8'b1111_1110;
                    3'd5: column = 8'b1100_0000;
                    3'd6: column = 8'b1100_0000;
                    3'd7: column = 8'b1100_0000;
                    default: column = 8'b0000_0000;
                endcase
        end
        
        3'b100: begin //K
                case (row_idx)
                    3'd0: column = 8'b1100_0111;
                    3'd1: column = 8'b1100_1110;
                    3'd2: column = 8'b1101_1100;
                    3'd3: column = 8'b1111_1000;
                    3'd4: column = 8'b1111_1000;
                    3'd5: column = 8'b1101_1100;
                    3'd6: column = 8'b1100_1110;
                    3'd7: column = 8'b1100_0111;
                    default: column = 8'b0000_0000;
                endcase
        end
        
        3'b101: begin //D           
                case (row_idx)
                    3'd0: column = 8'b1111_1100;
                    3'd1: column = 8'b1111_1110;
                    3'd2: column = 8'b1100_0111;
                    3'd3: column = 8'b1100_0011;
                    3'd4: column = 8'b1100_0011;
                    3'd5: column = 8'b1100_0111;
                    3'd6: column = 8'b1111_1110;
                    3'd7: column = 8'b1111_1100;
                    default: column = 8'b0000_0000;
                endcase
        end
        endcase
    end
endmodule

module test_4(
    input  wire clk, 
    input  wire rst, 
    output wire a1, a2, a3, a4, a5, a6, a7, a8,
    output wire b1, b2, b3, b4, b5, b6, b7, b8
);
    wire delayed_clk, scan_clk;
    wire [7:0] r;
    wire [7:0] c;

    scan_clk u_sclk (
        .clk(clk),
        .rst(rst),
        .scan_clk(scan_clk)
    );
    
    delay_clk u_dclk (
        .clk(clk),
        .rst(rst),
        .delayed_clk(delayed_clk)
    );

    led_out u_led_out(
        .delayed_clk(delayed_clk),
        .scan_clk(scan_clk),
        .rst(rst),
        .row(r),
        .column(c)
    );
    
    // Top edge (Pins 16 down to 9)
    assign a1 = c[0]; // Pin 16 -> Col 1
    assign a2 = c[1]; // Pin 15 -> Col 2
    assign a3 = r[1]; // Pin 14 -> Row 2
    assign a4 = c[7]; // Pin 13 -> Col 8
    assign a5 = r[3]; // Pin 12 -> Row 4
    assign a6 = c[2]; // Pin 11 -> Col 3
    assign a7 = c[4]; // Pin 10 -> Col 5
    assign a8 = r[0]; // Pin 9  -> Row 1

    // Bottom edge (Pins 1 to 8)
    assign b1 = r[4]; // Pin 1  -> Row 5
    assign b2 = r[6]; // Pin 2  -> Row 7
    assign b3 = c[6]; // Pin 3  -> Col 7
    assign b4 = c[5]; // Pin 4  -> Col 6
    assign b5 = r[7]; // Pin 5  -> Row 8
    assign b6 = c[3]; // Pin 6  -> Col 4
    assign b7 = r[5]; // Pin 7  -> Row 6
    assign b8 = r[2]; // Pin 8  -> Row 3

endmodule

