`timescale 1ns / 1ps

module tb_top_riscv_single;

  parameter WIDTH = 32;
  reg clk;
  reg reset;
  wire [WIDTH-1:0] result;

  // Instantiate the top module
  top_riscv_single #(WIDTH) dut (
    .clk(clk),
    .reset(reset),
    .result(result)
  );

  initial begin
    // VCD file generation setup
    $dumpfile("out.vcd");
    $dumpvars(0, tb_top_riscv_single);

    // Initialize signals
    clk = 0;
    reset = 0;

    // Release reset after some cycles
    #100 reset = 1;
  end

  // Generate clock with period of 20ns
  always #10 clk = ~clk;

  initial begin
    // Run simulation for a certain period
    #200;
    $finish;
  end

  // Optional: monitor output
  initial begin
    $monitor("Time: %0t | Result: %h", $time, result);
  end

endmodule
