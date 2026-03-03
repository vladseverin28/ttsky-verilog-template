# Structural 8-bit ALU

## Design Description

This project implements a simple 8-bit Arithmetic Logic Unit (ALU) using structural Verilog. The ALU takes two 8-bit inputs (a and b) and a 2-bit operation selector (op). Depending on the value of op, the circuit performs one of four operations:

00 -> Addition
01 -> Subtraction
10 -> Bitwise AND
11 -> Bitwise XOR

All operations are computed in parallel and the final result is selected using a hierarchy of 2-to-1 multiplexers.

The multiplexers are implemented structurally usin basic logic gates (AND, OR, and NOT). 

---

## Testbench Description

A Verilog testbench was created to verify te functionality of the ALU.
The testbench applies several input combinations for each operation and checks the resulting output.

The following operations are tested:

- Addition
- Subtraction
- Bitwise AND
- Bitwise XOR

The testbench compares the simulated output with the expected values and reports whether the test pass or fail.

---

## GenAI Usage

ChatGPT was used to assist with creating the testbench, and organizing the project documentation

Last updated: March 3, 2026

