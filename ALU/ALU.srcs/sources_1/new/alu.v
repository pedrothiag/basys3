`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 07:44:13
// Design Name: 
// Module Name: alu
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


module alu(
    input [7:0] indata,
    input btn,
    input clk,
    input rst,
    input [2:0] op,
    output reg [7:0] s,
    output reg [3:0] operator
    );
    
    reg [7:0] a, b;
    reg [2:0] state;
    parameter inicio = 3'b000,
              insert_a = 3'b001,
              save_a = 3'b010,
              sync_a = 3'b011,
              insert_b = 3'b100,
              save_b = 3'b101,
              sync_b = 3'b110,
              show_result = 3'b111;
    always @(posedge clk, posedge rst) begin
        if(rst) begin
            a = 8'd0;
            b = 8'd0;
            s = 8'd0;
            operator = 4'hA;
            state = inicio;
        end else begin
            case(state)
                inicio: begin
                    a = 8'd0;
                    b = 8'd0;
                    s = 8'd0;
                    operator = 4'hA;
                    state = insert_a;
                end
                insert_a: begin
                    s = indata;
                    operator = 4'hA;
                    if(btn==1'b0) state = insert_a;
                    else state = save_a;
                end
                save_a: begin
                    s = indata;
                    operator = 4'hA;
                    a = indata;
                    state = sync_a;
                end
                sync_a: begin
                    s = indata;
                    operator = 4'hA;
                    if(btn==1'b1) state = sync_a;
                    else state = insert_b;
                end
                insert_b: begin
                    s = indata;
                    operator = 4'hB;
                    if(btn==1'b0) state = insert_b;
                    else state = save_b;
                end
                save_b: begin
                    s = indata;
                    operator = 4'hB;
                    b = indata;
                    state = sync_b;
                end
                sync_b: begin
                    s = indata;
                    operator = 4'hB;
                    if(btn==1'b1) state = sync_b;
                    else state = show_result;
                end
                show_result: begin
                    operator = 4'hC;
                    state = show_result;
                    case(op)
                        3'b000: s = a&b;
                        3'b001: s = a|b;
                        3'b010: s = a^b;
                        3'b011: s = ~a;
                        3'b100: s = a + b;
                        3'b101: s = a - b;
                        3'b110: s = a + 4'd1;
                        3'b111: s = a - 4'd1;
                    endcase
                end
            endcase
        end
    end
    
//    always @* begin
//        case(op)
//            3'b000: s = a&b;
//            3'b001: s = a|b;
//            3'b010: s = a^b;
//            3'b011: s = ~a;
//            3'b100: s = a + b;
//            3'b101: s = a - b;
//            3'b110: s = a + 4'd1;
//            3'b111: s = a - 4'd1;
//        endcase
//    end
endmodule
