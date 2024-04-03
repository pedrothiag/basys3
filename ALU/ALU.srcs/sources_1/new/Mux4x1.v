//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:55 03/26/2024 
// Design Name: 
// Module Name:    Mux4x1 
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
module Mux4x1(
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [1:0] sel,
    output reg [3:0] x
    );

	always @* begin
		case(sel)
			2'b00: x = a;
			2'b01: x = b;
			2'b10: x = c;
			2'b11: x = d;
		endcase
	end
endmodule
