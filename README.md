# Tug of War Electronic Game
Welcome to the Tug of War Electronic Game repository! This project aims to recreate the classic team sport of Tug of War in an electronic format using Verilog and FPGA hardware.

# Overview
The Tug of War Electronic Game is designed for two players and utilizes the DE1-SoC FPGA development board. Players use the KEY[0] and KEY[3] buttons to control the movement of a lit LED across a playfield consisting of 9 LEDs (LEDR9 to LEDR1, skipping LEDR0).

# Features
Player Controls: Each player can press their respective button to move the lit LED left or right.
Playfield LEDs: The playfield LEDs represent the tug of war rope, with the center LED initially lit.
Winning Condition: If the lit LED moves off the playfield, the player responsible for that movement wins, and the HEX0 7-segment display indicates the winner.
Reset Functionality: The game can be reset using the SW9 switch.

# Design Approach
The project is structured using multiple Finite State Machines (FSMs), with each FSM responsible for a specific aspect of the game:

User Input Detection: Ensures accurate detection of button presses using FSM logic.
Playfield LEDs Control: Manages the state of each playfield LED based on button inputs and neighboring LED status.
Game Logic: Determines the game state, including win conditions and reset functionality.

# Getting Started
To run the Tug of War Electronic Game on the DE1-SoC FPGA development board, follow these steps:

Clone this repository to your local machine.
Open the project files in a Verilog development environment (e.g., Quartus Prime).
Compile the Verilog code and load it onto the FPGA board.
Connect the FPGA board to a display monitor and power source.
Press the KEY[0] and KEY[3] buttons to control the game, and use SW9 to reset.
