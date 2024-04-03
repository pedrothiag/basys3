//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:52 03/26/2024 
// Design Name: 
// Module Name:    CombSel 
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
module CombSel(
    input [3:0] dsel,
    output [1:0] muxsel
    );

	assign muxsel[1] = dsel[1]&dsel[0];
	assign muxsel[0] = dsel[2]&dsel[0];

endmodule
