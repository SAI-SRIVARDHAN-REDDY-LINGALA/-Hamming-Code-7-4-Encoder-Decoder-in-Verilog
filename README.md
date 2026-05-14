# Hamming Code (7,4) Encoder & Decoder in Verilog

## Overview

This project implements a complete **Hamming (7,4) Error Detection and Correction System** using Verilog HDL.

The design includes:

- Hamming Encoder
- Hamming Decoder
- Syndrome Generator
- Single-Bit Error Correction
- Error Injection Testbench
- Complete combinational ECC logic

The project demonstrates how digital systems detect and correct transmission or memory errors using **Error Correcting Codes (ECC)**.

---

# Features

- Hamming (7,4) code implementation
- Single-bit error correction
- Single-bit error detection
- Syndrome-based decoding
- Error injection testing
- Pure combinational logic design
- Fully synthesizable Verilog RTL
- Modular encoder-decoder architecture
- ECC-based communication logic
- FPGA-ready implementation

---

# Technologies Used

- Verilog HDL
- Digital Logic Design
- Error Correcting Codes (ECC)
- Combinational Logic
- Syndrome Decoding
- FPGA Design Concepts
- RTL Design Methodology

---

# What is Hamming Code?

Hamming Code is an **Error Correcting Code (ECC)** used to:

- Detect transmission errors
- Correct corrupted bits
- Improve communication reliability
- Protect memory systems

Hamming (7,4):

- Takes 4-bit input data
- Generates 7-bit encoded output
- Corrects 1-bit errors
- Detects 2-bit errors

---

# Hamming (7,4) Structure

## Bit Placement

Parity bits are placed at positions that are powers of 2.

| Position | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| Type | P1 | P2 | D1 | P3 | D2 | D3 | D4 |

---

# Hamming Distance Concept

The Hamming (7,4) code has:

```text
d_min = 3
```

This means:

- Can detect up to 2-bit errors
- Can correct 1-bit errors

This is the core mathematical property enabling reliable communication.

---

# Encoder Architecture

The encoder:

1. Accepts 4-bit input data
2. Generates parity bits
3. Constructs 7-bit Hamming codeword

---

# Parity Bit Generation

## P1 Calculation

Checks positions:

```text
1, 3, 5, 7
```

Equation:

```text
P1 = D1 ⊕ D2 ⊕ D4
```

---

## P2 Calculation

Checks positions:

```text
2, 3, 6, 7
```

Equation:

```text
P2 = D1 ⊕ D3 ⊕ D4
```

---

## P3 Calculation

Checks positions:

```text
4, 5, 6, 7
```

Equation:

```text
P3 = D2 ⊕ D3 ⊕ D4
```

---

# Final Encoded Codeword

```text
{D4, D3, D2, P3, D1, P2, P1}
```

---

# Syndrome-Based Error Detection

The decoder calculates a syndrome value:

```text
S = {S3, S2, S1}
```

The syndrome identifies the exact error location.

---

# Syndrome Interpretation

| Syndrome | Meaning |
|---|---|
| 000 | No error |
| 001 | Error at bit 1 |
| 010 | Error at bit 2 |
| 011 | Error at bit 3 |
| 100 | Error at bit 4 |
| 101 | Error at bit 5 |
| 110 | Error at bit 6 |
| 111 | Error at bit 7 |

---

# Error Correction Logic

When an error is detected:

1. Syndrome determines corrupted bit position
2. Decoder flips that bit
3. Original data is recovered

This allows automatic correction of single-bit transmission errors.

---

# Decoder Architecture

The decoder performs:

- Syndrome generation
- Error detection
- Error correction
- Data extraction

The corrected data is then reconstructed from the corrected codeword.

---

# Testbench Verification

A dedicated Verilog testbench was developed to validate:

- Encoder functionality
- Error injection
- Syndrome generation
- Bit correction logic
- Final data recovery

---

# Error Injection Testing

The testbench intentionally flips one bit:

```verilog
assign corrupted_code = code_out ^ 7'b0000001;
```

This simulates real communication or memory corruption.

The decoder successfully:

- Detects the error
- Locates the corrupted bit
- Corrects the codeword
- Recovers original data

---

# Communication Flow

```text
4-bit Data
    ↓
Hamming Encoder
    ↓
7-bit Encoded Data
    ↓
Transmission / Memory
    ↓
Error Injection
    ↓
Hamming Decoder
    ↓
Syndrome Generation
    ↓
Bit Correction
    ↓
Recovered Original Data
```

---

# Engineering Concepts Demonstrated

- Error Correcting Codes (ECC)
- Hamming Distance
- Syndrome Decoding
- Parity Generation
- Bitwise XOR Operations
- Combinational Logic Design
- Digital Communication Reliability
- Hardware Error Recovery
- RTL Design
- FPGA-Oriented Design

---

# Skills Demonstrated

- Verilog HDL
- ECC Design
- Digital Communication Concepts
- RTL Architecture Design
- Combinational Logic Development
- Hardware Verification
- Testbench Development
- Error Detection Systems
- FPGA Design Thinking
- Digital System Reliability

---

# Real-World Applications

Hamming codes are widely used in:

- ECC RAM
- DRAM Controllers
- Satellite Communication
- Network Transmission Systems
- Storage Devices
- FPGA Memory Systems
- Digital Communication Links
- NAND Flash Controllers

---

# Industry Relevance

Error correction is fundamental in modern digital systems.

This project reflects concepts used in:

- High-reliability computing
- Aerospace electronics
- Memory controller design
- Data center hardware
- Communication protocols
- Storage system architectures

---

# Key Takeaways

- Hamming code enables reliable digital communication
- Parity bits are placed at powers of 2
- Syndrome logic identifies corrupted bits
- Hamming (7,4) corrects single-bit errors
- ECC is essential in modern hardware systems
- XOR logic forms the foundation of parity generation
- Hardware can automatically recover corrupted data

---

# Author

**Sai Srivardhan Lingala**  
Electronics Engineering Student | FPGA & Digital Design Enthusiast
