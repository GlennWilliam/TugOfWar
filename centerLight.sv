module centerLight (clock, reset, LeftButton, RightButton, LeftLEDR, RightLEDR, lightOn);
	input logic clock, reset;
	input logic LeftButton, RightButton, LeftLEDR, RightLEDR;
	output logic lightOn;
	
	reg ns;
	parameter On = 1'b1, Off = 1'b0;
	
	always_comb begin
		case (lightOn)
			On:	if((LeftButton & RightButton) | (~LeftButton & ~RightButton))
						ns = On;
					else
						ns = Off;
			Off:	if((~LeftButton & RightButton & LeftLEDR) | (LeftButton & ~RightButton & RightLEDR))
						ns = On;
					else
						ns = Off;
			default: ns = 1'bx;
		endcase
	end
	
	always_ff @(posedge clock) begin
		if(reset) begin
			lightOn <= On;
		end
		
		else begin
			lightOn <= ns;
		end
	end
endmodule


module centerLight_testbench();
	logic clock, reset, LeftButton, RightButton, LeftLEDR, RightLEDR, lightOn;
	
	centerLight dut (.clock, .reset, .LeftButton, .RightButton, .LeftLEDR, .RightLEDR, .lightOn);
	
	//Set up the clock
	parameter CLOCK_PERIOD = 50;
	initial begin
		clock <= 0;
		forever #(CLOCK_PERIOD / 2) 
		clock <= ~clock;
	end
	
	//Set up the inputs to the design. Each line is a clock cycle
	initial begin
																														@(posedge clock);
		reset <= 1;																									@(posedge clock);												
		reset <= 0;	LeftButton <= 0;	RightButton <= 0;	LeftLEDR <= 0;	RightLEDR <= 0;		@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																							RightLEDR <= 1;		@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																		LeftLEDR <= 1;								@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																							RightLEDR <= 0;		@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
												RightButton <= 1;													@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																							RightLEDR <= 1;		@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																		LeftLEDR <= 0;								@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																							RightLEDR <= 0;		@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
						LeftButton <= 1;																			@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																		LeftLEDR <= 1;								@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																							RightLEDR <= 1;		@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																		LeftLEDR <= 0;								@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
											RightButton <= 0;														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																		LeftLEDR <= 1;								@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																							RightLEDR <= 0;		@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																		LeftLEDR <= 0;								@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
	
	$stop;
																									
	end 
endmodule 

			