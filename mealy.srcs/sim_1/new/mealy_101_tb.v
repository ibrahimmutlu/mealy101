`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 20:00:58
// Design Name: 
// Module Name: mealy_101_tb
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

`timescale 1ns / 1ps

module mealy_101_tb;

  // Inputs
  reg clk;
  reg reset;
  reg din;

  // Output
  wire dout;

  // Instantiate the Mealy state machine
  mealy_101 uut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout)
  );

  // Clock generation
  always #5 clk = ~clk; // 10 ns clock period (100 MHz)

  // Test sequence
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;  // Apply reset
    din = 0;
    #20;
    
    reset = 0;  // Release reset
    
    // Test case 1: Input sequence 1-0-1 (should produce dout = 1 after the sequence)
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;

    // Test case 2: Input sequence 0-1-0-1 (should produce dout = 1 only for the last transition)
    din = 0; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;

    // Test case 3: Continuous 0s and 1s (should produce dout = 0 for non-101 sequences)
    din = 0; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    // Test case 4: Apply reset in the middle
    reset = 1; #10;
    reset = 0; #10;

    din = 1; #10;
    din = 0; #10;
    din = 1; #10;

    // End simulation
    #50;
    $stop;
  end

endmodule
