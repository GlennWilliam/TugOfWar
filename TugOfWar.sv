module TugOfWar (clock, reset, LeftButton, RightButton, LEDR, display);
		input logic clock, reset, LeftButton, RightButton;
		output logic [9:0] LEDR;
		output logic [6:0] display;
		
		logic FinalLeft, FinalRight;
		
		assign FinalLeft = 1'b0;
		assign FinalRight = 1'b0;
		
		normalLight ledr9 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(FinalLeft), . RightLEDR(LEDR[8]), .lightOn(LEDR[9]));
		
		normalLight ledr8 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[9]), . RightLEDR(LEDR[7]), .lightOn(LEDR[8]));
		
		normalLight ledr7 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[8]), . RightLEDR(LEDR[6]), .lightOn(LEDR[7]));
		
		normalLight ledr6 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[7]), . RightLEDR(LEDR[5]), .lightOn(LEDR[6]));
		
		centerLight ledr5 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[6]), . RightLEDR(LEDR[4]), .lightOn(LEDR[5]));
		
		normalLight ledr4 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[5]), . RightLEDR(LEDR[3]), .lightOn(LEDR[4]));
		
		normalLight ledr3 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[4]), . RightLEDR(LEDR[2]), .lightOn(LEDR[3]));
		
		normalLight ledr2 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[3]), . RightLEDR(LEDR[1]), .lightOn(LEDR[2]));
		
		normalLight ledr1 (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR(LEDR[2]), . RightLEDR(FinalRight), .lightOn(LEDR[1]));
		
		Winner gameOver (.clock, .reset, .LeftLEDR(LEDR[9]), .RightLEDR(LEDR[1]), .LeftKEY(LeftButton), .RightKEY(RightButton), .HEX0(display));

endmodule



module TugOfWar_testbench();
	logic clock, reset, LeftButton, RightButton;
	logic [9:0] LEDR;
	logic [6:0] display;
	TugOfWar dut(.clock, .reset, .LeftButton, .RightButton, .LEDR, .display);
	
	//Set up the clock
	parameter CLOCK_PERIOD = 50;
	initial begin
		clock <= 0;
		forever #(CLOCK_PERIOD / 2) 
		clock <= ~clock;
	end
	
	initial begin
		@(posedge clock);
		reset <= 1;													@(posedge clock);												
		reset <= 0;	LeftButton <= 0;	RightButton <= 0;	@(posedge clock);
																		@(posedge clock);
												RightButton <= 1;	@(posedge clock);
																		@(posedge clock);
						LeftButton <= 1;	RightButton <= 0;	@(posedge clock);
																		@(posedge clock);
						LeftButton <= 0;	RightButton <= 1;	@(posedge clock);
																		@(posedge clock);																
												RightButton <= 1;	@(posedge clock);
																		@(posedge clock);
												RightButton <= 1;	@(posedge clock);
																		@(posedge clock);
												RightButton <= 1;	@(posedge clock);
																		@(posedge clock);
												RightButton <= 1;	@(posedge clock);
																		@(posedge clock);
																		@(posedge clock);
																		@(posedge clock);

	$stop;
																									
	end 
endmodule 																
