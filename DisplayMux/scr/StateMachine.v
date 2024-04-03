//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:54 03/26/2024 
// Design Name: 
// Module Name:    StateMachine 
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
module StateMachine(
	 input clk,
    output reg [3:0] dsel
    );
	 	
	//Registrador de estado e codifica??o dos estados
	reg [1:0] state;
	parameter s0 = 0,
	          s1 = 1,
		      s2 = 2,
			  s3 = 3;
	
	//------------Maquina de estados para multiplexacao
	//Estado Proximo
	always @(posedge clk) begin
		case(state)
			//unidade
			s0: begin
				state <= s1;
				dsel <= 4'b1110;
			end
			//dezena
			s1: begin
				state <= s2;
				dsel <= 4'b1101;
			end
			//centena
			s2: begin
				state <= s3;
				dsel <= 4'b1011;
			end
			//default
			s3: begin
				state <= s0;
				dsel <= 4'b0111;
			end
		endcase
	end
endmodule
