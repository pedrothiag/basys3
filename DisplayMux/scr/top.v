//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:11 03/23/2024 
// Design Name: 
// Module Name:    displaymux 
// Project Name: 
// Target Devices: 
// Tool versions: 
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
	 input [13:0] bin,
	 input clk,
	 output [6:0] hex,
	 output dp,
     output [3:0] dsel
    );	
	wire [3:0] mil0, cen0, dez0, und0, outmux;
	wire [3:0] dsel0;
	wire [1:0] muxsel0;
	wire clkDiv;
	
	bin2BCD u0(.bin(bin),.mil(mil0), .cen(cen0), .dez(dez0), .und(und0));
	Mux4x1 u1(.a(und0), .b(dez0), .c(cen0), .d(mil0), .sel(muxsel0), .x(outmux));
	BCD2Hex u2(.bcd(outmux), .hex(hex));
	StateMachine u3(.clk(clkDiv), .dsel(dsel0));
	CombSel u4(.dsel(dsel0), .muxsel(muxsel0));
	clkdivider u5 (.clk(clk), .clk_out(clkDiv));	
	assign dsel = dsel0;
	assign dp = 1'b1;      //Ponto Decimal desligado
endmodule
