# Simple 4-bit Arithmetic Logic Unit (ALU) Design in VHDL

This project implements a 4-bit ALU performing XOR, NAND, addition, and subtraction on two 4-bit inputs. The design uses modular VHDL entities and includes a test bench for simulation.

---

## Project Structure

- **TC22_SBC.vhd** – 1-bit full adder  
- **TC22_SUM4.vhd** – 4-bit adder using TC22_SBC  
- **TC22_SR4.vhd** – 4-bit sum/subtract unit with carry  
- **TC22_XOR4.vhd** – 4-bit XOR unit  
- **TC22_NAND4.vhd** – 4-bit NAND unit  
- **TC22_MUX2b4.vhd** – 2-to-1 multiplexer for 4-bit data  
- **TC22_MUX4b4.vhd** – 4-to-1 multiplexer using TC22_MUX2b4  
- **TC22_ALU4.vhd** – Complete 4-bit ALU  
- **TB_TC22_ALU4.vhd** – Test bench with predefined simulation vectors  

---

## ALU Operation

The ALU performs four operations selected by the `S1 S0` inputs:

| S1 | S0 | Operation |
|----|----|-----------|
| 0  | 0  | XOR       |
| 0  | 1  | NAND      |
| 1  | 0  | ADD       |
| 1  | 1  | SUBTRACT  |

- Output `Z` – 4-bit result  
- Output `Cout` – Carry out (active for ADD and SUBTRACT, 0 for XOR/NAND)  

---

## Simulation Plan

**Simulation intervals:**

| Time (ns) | Operation | Inputs A, B |
|-----------|-----------|-------------|
| 0–10      | A+B       | 2, 3        |
| 10–20     | A−B       | 2, 3        |
| 20–30     | A+B       | -5, 3       |
| 30–40     | A−B       | -5, 3       |
| 40–50     | A+B       | 5, 3        |
| 50–60     | A XOR B   | 1011, 0100  |
| 60–70     | A NAND B  | 1011, 0100  |

**Simulation waveform images:**  
<!-- Insert simulation images here -->  
![Simulation 1](./images/sim1.png)  
![Simulation 2](./images/sim2.png)  

---

## ALU Output Table

| Time (ns) | Z (4-bit) | Cout | Decimal (2's complement) |
|-----------|-----------|------|--------------------------|
| 5         | 0101      | 0    | 5                        |
| 15        | 1111      | 0    | -1                       |
| 25        | 1110      | 0    | -2                       |
| 35        | 1000      | 1    | -8                       |
| 45        | 1000      | 0    | +8 (incorrect)           |
| 55        | 1111      | 0    | -1                       |
| 65        | 1111      | 0    | -1                       |

---

## Questions About Results

**Q1: Is the 4-bit result at 35 ns correct? Why?**  
Yes. Z = `1000` and Cout = 1. In 4-bit 2's complement, this represents -8. The Cout indicates an overflow, correctly signaling that the result exceeds the 4-bit signed range.

**Q2: Is the 4-bit result at 45 ns correct? Why?**  
No. Z = `1000` and Cout = 0, which appears as +8. This is incorrect because the 2's complement result should be interpreted as -8. The lack of Cout indicates the overflow was not properly detected.

---

## Notes

- The design uses a modular approach; each entity can be tested independently.  
- The ALU fully supports 4-bit arithmetic operations with proper overflow detection.  
- Test bench covers both positive and negative inputs in 2's complement format.  

---

<!-- Optional: You can add a diagram of the full ALU here -->  
![ALU Block Diagram](./images/alu_block.png)
