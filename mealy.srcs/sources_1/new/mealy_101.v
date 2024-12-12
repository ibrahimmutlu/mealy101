`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 19:55:58
// Design Name: 
// Module Name: mealy_101
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
module mealy_101 (
    input clk,
    input reset,
    input din,
    output reg dout
);

  // State encoding
  parameter S0 = 2'b00,
            S1 = 2'b01,
            S2 = 2'b10;
  
  reg [1:0] state;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      dout <= 1'b0;
      state <= S0;
    end else begin
      case (state)
        S0: begin
          if (din) begin
            state <= S1;
            dout <= 1'b0;
          end else begin
            dout <= 1'b0;
          end
        end
        S1: begin
          if (~din) begin
            state <= S2;
            dout <= 1'b0;
          end else begin
            dout <= 1'b0;
          end
        end
        S2: begin
          if (din) begin
            state <= S0;
            dout <= 1'b1;
          end else begin
            state <= S0;
            dout <= 1'b0;
          end
        end
        default: begin
          state <= S0;
          dout <= 1'b0;
        end
      endcase
    end
  end

endmodule
