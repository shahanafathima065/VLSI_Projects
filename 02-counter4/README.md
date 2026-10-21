# 4-bit Counter with Synchronous Reset

## What it does
This project is a 4-bit counter. It goes up by 1 on every rising
clock edge (positive edge). When reset is 1, it goes back to 0.
After 15, it wraps around to 0.

## How it works
- The counter uses `always @(posedge clk)`, so it changes only at
  the rising edge of the clock.
- The reset is synchronous: it works only at a clock edge.
- Non-blocking assignment (`<=`) is used inside the clocked block.
- This is a 4-bit counter, so it can only hold values from 0 to 15.
  That is why it wraps around from 15 to 0.

## How I tested it
The testbench makes a 10 ns clock and keeps its own correct count.
After every clock edge, it compares the counter with the correct
value. It tests:
- reset at the start
- 40 clock ticks (more than 16, so the wrap-around is tested)
- reset in the middle of counting
- counting again after the reset

It printed "ALL TESTS PASSED".

![Passing simulation](https://github.com/user-attachments/assets/8b5fa4bb-1380-432d-87cd-dcfb97f75551>)

## Tools
Verilog, Xilinx Vivado 2023.2 (behavioral simulation)

## Files
- counter4.v: the design
- tb_counter4.v: the testbench
- waveform_pass.png: passing simulation
