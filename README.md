# Tug of War Electronic Game
Welcome to the Tug of War Electronic Game repository! This project aims to recreate the classic team sport of Tug of War in an electronic format using Verilog and FPGA hardware.

# Overview
The Tug of War Electronic Game is designed for two players and utilizes the DE1-SoC FPGA development board. Players use the KEY[0] and KEY[3] buttons to control the movement of a lit LED across a playfield consisting of 9 LEDs (LEDR9 to LEDR1, skipping LEDR0).

# Features
1. Player Controls: Each player can press their respective button to move the lit LED left or right.
2. Playfield LEDs: The playfield LEDs represent the tug of war rope, with the center LED initially lit.
3. Winning Condition: If the lit LED moves off the playfield, the player responsible for that movement wins, and the HEX0 7-segment display indicates the winner.
4. Reset Functionality: The game can be reset using the SW9 switch.

# Design Approach
The project is structured using multiple Finite State Machines (FSMs), with each FSM responsible for a specific aspect of the game:

1. User Input Detection: Ensures accurate detection of button presses using FSM logic.
2. Playfield LEDs Control: Manages the state of each playfield LED based on button inputs and neighboring LED status.\
3. Game Logic: Determines the game state, including win conditions and reset functionality.

# Getting Started
To run the Tug of War Electronic Game on the DE1-SoC FPGA development board, follow these steps:

1. Clone this repository to your local machine.
2. Open the project files in a Verilog development environment (e.g., Quartus Prime).
3. Compile the Verilog code and load it onto the FPGA board.
4. Connect the FPGA board to a display monitor and power source.
5. Press the KEY[0] and KEY[3] buttons to control the game, and use SW9 to reset.
