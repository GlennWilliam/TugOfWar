module DE1_SoC (CLOCK_50, KEY, SW, LEDR, HEX0);
	input logic CLOCK_50;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [9:0] LEDR;
	output logic [6:0] HEX0;
	
	logic L, R;
	
	userInput inputs (.clock(CLOCK_50), .reset(SW[9]), .LeftButton(KEY[3]), .RightButton(KEY[0]), .LeftOut(L), .RightOut(R));
	
	TugOfWar play (.clock(CLOCK_50), .reset(SW[9]), .LeftButton(L), .RightButton(R), .LEDR(LEDR[9:0]), .display(HEX0));
		
endmodule

module DE1_SoC_testbench();
	logic CLOCK_50;
	logic [3:0] KEY;
	logic [9:0] SW;
	logic [9:0] LEDR;
	logic [6:0] HEX0;
	
	DE1_SoC dut (.CLOCK_50, .KEY, .SW, .LEDR, .HEX0);
	
	//Set up the CLOCK_50
	parameter CLOCK_PERIOD = 50;
	initial begin
		CLOCK_50 <= 0;
		forever #(CLOCK_PERIOD / 2) 
		CLOCK_50 <= ~CLOCK_50;
	end
	
	initial begin
																@(posedge CLOCK_50);
																@(posedge CLOCK_50);
		SW[9] <= 1;											@(posedge CLOCK_50);
																@(posedge CLOCK_50);
																@(posedge CLOCK_50);
		SW[9] <= 0;	KEY[3] <= 0;	KEY[0] <= 0;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 1;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 0;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 1;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 0;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 1;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 0;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 1;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 0;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
											KEY[0] <= 1;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
																@(posedge CLOCK_50);
		SW[9] <= 1;											@(posedge CLOCK_50);
																@(posedge CLOCK_50);
																@(posedge CLOCK_50);
		SW[9] <= 0;	KEY[3] <= 1;	KEY[0] <= 0;	@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 0;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 1;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 0;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 1;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 0;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 1;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 0;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 1;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 0;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 1;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 0;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
						KEY[3] <= 1;						@(posedge CLOCK_50);
																@(posedge CLOCK_50);
																@(posedge CLOCK_50);
																@(posedge CLOCK_50);
																
	
	$stop;
																									
	end 
endmodule 	
											
		
	
	
	