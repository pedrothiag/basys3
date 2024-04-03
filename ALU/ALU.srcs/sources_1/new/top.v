`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 07:44:13
// Design Name: 
// Module Name: top
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
module top (
	input [7:0] indata,
    input btn,
    input clk,
    input rst,
    input [2:0] op,
    output [6:0] hex,
    output [3:0] dsel,
    output dp,
    output [7:0] s
    );
    
    wire clk_divider;
    wire [7:0] sout;
    wire [3:0] cen0, dez0, und0, outmux, operator0;
	wire [3:0] dsel0;
	wire [1:0] muxsel0;	
	
	alu u1(.indata(indata), .btn(btn), .clk(clk_divider), .rst(rst), .op(op), .s(sout), .operator(operator0));
	clkdivider u2(.clk(clk), .clk_out(clk_divider));	
	bin2BCD u3(.bin(sout),.cen(cen0), .dez(dez0), .und(und0));
	Mux4x1 u4(.a(und0), .b(dez0), .c(cen0), .d(operator0), .sel(muxsel0), .x(outmux));
	BCD2Hex u5(.bcd(outmux), .hex(hex));
	StateMachine u6(.clk(clk_divider), .dsel(dsel0));
	CombSel u7(.dsel(dsel0), .muxsel(muxsel0));
	
	assign dsel = dsel0;
	assign dp = 1'b1;      //Ponto Decimal desligado
	assign s = sout;
endmodule
