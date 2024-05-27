# Sum of Natural Numbers Verilog Implementation

## Overview

This repository hosts a Verilog implementation of a digital system designed to calculate the sum of the first N natural numbers. The experiment focuses on mapping the algorithm to an architecture using hierarchical modeling and explores two distinct implementation approaches: one with a Finite State Machine (FSM) and another without using FSM. The primary objective is to optimize hardware resource utilization while ensuring efficient functionality.

## Theory

### Sum of Natural Numbers Algorithm

The sum of the first N natural numbers can be computed using the formula:

\[ \text{Sum} = 1 + 2 + 3 + \ldots + N \]

The algorithm iteratively adds each natural number from 1 to N to obtain the total sum. Depending on the hardware implementation requirements, this process can involve either a direct calculation or a more structured approach.

## Implementation

### Verilog Code

This repository includes two implementations of the sum of natural numbers algorithm:

1. **Implementation with FSM**: This approach utilizes a Finite State Machine (FSM) to control the sequencing of inputs and outputs, dividing the system into three states: IDLE, BUSY, and DONE. The control path manages state transitions, while the data path computes the sum using a down-counter and an adder.

2. **Implementation without FSM**: In contrast to the FSM-based approach, this implementation presents a more direct method of computing the sum without employing a Finite State Machine. It focuses on integrating the control of the system and the computation of the sum, aiming for streamlined functionality and efficient resource utilization.

### Experimental Procedure

The experimental procedure involves designing and implementing the Verilog code for both implementations: with and without FSM. Each implementation undergoes testing using a suitable test bench to verify its functionality. The test bench provides random inputs to the system and checks the corresponding outputs to ensure accurate operation.

## Conclusion

This experiment showcases the Verilog-based implementation of a digital system for calculating the sum of the first N natural numbers. By exploring different implementation approaches and leveraging hierarchical modeling, the experiment demonstrates how to optimize hardware resource utilization while maintaining efficient functionality. The use of FSM-based control and direct computation methods offers insights into the trade-offs between complexity and resource efficiency in digital circuit design.
