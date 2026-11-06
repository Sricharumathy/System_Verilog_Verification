# Dual-Port RAM – Specification Sheet

**Design Name:** Parameterized Dual-Port RAM  
**HDL:** SystemVerilog

### 1. Memory Specifications

| Parameter | Value |
|---|---|
| Memory Type | True Dual-Port RAM |
| Data Width | 8 bits |
| Memory Depth | 8 locations |
| Address Width | 3 bits |
| Total Capacity | 64 bits |
| Clock | Positive edge triggered |

### 2. Input / Output Signals

| Signal | Direction | Description |
|---|---|---|
| clk | Input | Clock signal |
| rst | Input | Active-high synchronous reset |
| we_a | Input | Port A write enable |
| we_b | Input | Port B write enable |
| addrA | Input | Port A address |
| addrB | Input | Port B address |
| data_inA | Input | Port A input data |
| data_inB | Input | Port B input data |
| data_outA | Output | Port A output data |
| data_outB | Output | Port B output data |

### 3. Functional Specifications

- Supports independent read and write operations through Port A and Port B.
- Both ports can read simultaneously.
- Both ports can write simultaneously to different memory addresses.
- When `we_a` or `we_b` is HIGH, the corresponding port performs a write operation.
- When the write enable is LOW, the corresponding port performs a read operation.
- Read and write operations are synchronous to the positive clock edge.
- When reset is HIGH, all memory locations and output registers are cleared.
- Simultaneous writes to the same address are blocked.

### 4. Operating Conditions

| Condition | Expected Operation |
|---|---|
| `we_a=0`, `we_b=0` | Both ports read |
| `we_a=1`, `we_b=0` | Port A writes, Port B reads |
| `we_a=0`, `we_b=1` | Port A reads, Port B writes |
| `we_a=1`, `we_b=1` | Both ports write to different addresses |

**Reset:** Active-high, synchronous.

**Address Range:** 0 to 7.

**Data Range:** 0x00 to 0xFF.

---

**End of Specification**
