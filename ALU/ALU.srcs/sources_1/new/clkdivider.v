//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:30 03/26/2024 
// Design Name: 
// Module Name:    clkGen 
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
module clkdivider(clk, clk_out);
    input clk;
    output reg clk_out;
    
    reg        [31:0]   status;
    always @ (*) begin
        clk_out = status[18];
    end

    always @ (negedge clk) begin
        status <= (status + 32'h00000001);
    end
  
endmodule