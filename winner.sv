module Winner (HEX0, clock, reset, LeftLEDR, RightLEDR, LeftKEY, RightKEY);
	input logic clock, reset;
	input logic LeftLEDR, RightLEDR, LeftKEY, RightKEY;
	output logic [6:0] HEX0;
	
	reg [1:0] ps, ns;
	parameter off = 2'b00, one = 2'b01, two = 2'b10;
	
	logic [6:0] NOW, ONE, TWO;
	assign NOW = 7'b1111111;
	assign ONE = 7'b1111001;
	assign TWO = 7'b0100100;
	
	always_comb begin
		case(ps)
			off:  if(LeftLEDR & LeftKEY & ~RightKEY) 
						begin
							ns <= one;
							HEX0 = ONE;
						end
						
					else if (RightLEDR & RightKEY & ~LeftKEY) 
						begin
							ns <= two;
							HEX0 = TWO;
						end
						
					else
						begin
							ns <= off;
							HEX0 <= NOW;
						end
			
			one:	begin
						ns <= one;
						HEX0 <= ONE;
					end
					
			two:	begin
						ns <= two;
						HEX0 <= TWO;
					end
			
			default: begin
							ns <= off;
							HEX0 <= NOW;
						end
			
		endcase
	end
	
	always_ff @(posedge clock) begin
		if(reset)
			ps <= off;
		else
			ps <= ns;
	end
	
endmodule

module Winner_testbench();
	logic clock, reset, LeftLEDR, RightLEDR, LeftKEY, RightKEY;
	logic [6:0] HEX0;

	
	Winner dut (.HEX0, .clock, .reset, .LeftLEDR, .RightLEDR, .LeftKEY, .RightKEY);
	
	parameter CLOCK_PERIOD = 50;
	initial begin
		clock <= 0;
		forever #(CLOCK_PERIOD / 2) 
		clock <= ~clock;
	end
	
	initial begin
																														@(posedge clock);
		reset <= 1;																									@(posedge clock);																												
		reset <= 0;	LeftLEDR <= 0;	RightLEDR<= 0;	LeftKEY <= 0;	RightKEY <= 0;					@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
						LeftLEDR <= 1; 					LeftKEY <= 1;										@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
		reset <= 1;																									@(posedge clock);		
		reset <= 0;	LeftLEDR <= 0;	RightLEDR<= 0;	LeftKEY <= 0;	RightKEY <= 0;					@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
											RightLEDR <= 1; 					RightKEY <= 1;					@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
																														@(posedge clock);
	
		$stop;
																									
	end 
endmodule 
	
				
			