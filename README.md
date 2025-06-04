# UVM ALU Testbench
This project is a Universal Verification Methodology (UVM) testbench for a simple Arithmetic Logic Unit (ALU), designed in SystemVerilog. Link to project on EDA playground: https://www.edaplayground.com/x/8gTN

## ALU Features

The ALU supports the following 4 operations:

| Opcode | Operation  | Description           |
|--------|------------|-----------------------|
| 0000   | A + B      | Addition              |
| 0001   | A - B      | Subtraction           |
| 0010   | A & B      | Bitwise AND           |
| 0011   | A \| B     | Bitwise OR            |

Outputs:
- `ALU_Out`: 8-bit result
- `CarryOut`: Indicates overflow for addition/subtraction
