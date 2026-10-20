# 4-bit Ripple-Carry Adder

## What it does
This project adds two 4-bit numbers and a carry-in. It gives a
4-bit sum and a carry-out.

## How it works
- A full adder adds three bits: a, b, and carry-in.
- Four full adders are connected in a row. The carry moves from
  one adder to the next, like carrying a digit on paper.
- The sum has only 4 bits, so it can show numbers up to 15. When the
  total is more than 15, the extra bit goes to the carry-out (cout),
  and cout becomes 1.

## How I tested it
The testbench tries all 512 input combinations (16 x 16 x 2) and
compares each result with the correct answer. It prints
"ALL TESTS PASSED".
![Passing simulation](https://github.com/user-attachments/assets/3e8b1868-77eb-43ce-9f8e-ff3ed36b7ddc)
## Testing the testbench
I put a bug in the design on purpose (XOR changed to OR). The
testbench reported 390 failed tests out of 512, so the testbench
can catch mistakes.

![Simulation with the deliberate bug](https://github.com/user-attachments/assets/3e0f64f4-f40c-464a-82b4-8c9b2e2cc673")

## Tools
Verilog, Xilinx Vivado 2023.2 (behavioral simulation)

## Files
- adder4.v: the design
- tb_adder4.v: the testbench
- waveform_pass.png: passing simulation
- bug_test.png: simulation with the deliberate bug
