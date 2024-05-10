# Mano Basic Computer Design
## Overview
The Mano Basic Computer is a simple computer architecture designed by M. Morris Mano. It serves as an educational tool to understand fundamental computer architecture principles and digital logic design.
It includes RAM, Common Bus, Arithmatic and Logic Unit (ALU), and Registers, and we have added a stack too.
## Instructions 
XOR , ADD , LDA , PUSH , POP , BSA , MUL , INC , SZA , HLT , INP , OUT , SKI , SKO , ION , IOF .

## Modules
1. 3x8decoder: Converts 3-bit input to one of eight outputs.
2. AR_SP_selection: Chooses between Address Register and Stack Pointer.
3. ALU: Performs arithmetic and logic operations.
4. common_bus_control: Manages shared communication line access.
5. common_bus_selection: Selects device access to common bus.
6. control: Coordinates hardware operation.
7. decoder4x16: Converts 4-bit input to one of sixteen outputs.
8. Eflag: Stores arithmetic and logic operation results.
9. encoder: Converts input data into coded form.
10. Main: Central processing unit or primary program/module.
11. mux: Selects one of several input signals.
12. RAM: 16*4096 RAM.
13. register_8bit: for INPR and OUTR registers.
14. register_12bit: for AR , PC , and SP registers.
15. register_16bit: for DR , AC , IR and TR registers.
16. SC: 4-bit counter.
17. SP: Tracks stack top address.
18. timing: Generates timing signals by connecting SC and decoder4x16 modules

