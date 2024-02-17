module userInput (clock, reset, LeftButton, RightButton, LeftOut, RightOut);
	input logic clock, reset, LeftButton, RightButton;
	output logic LeftOut, RightOut;
	
	button left (.clock, .reset, .Button(LeftButton), .out(LeftOut));
	button right (.clock, .reset, .Button(RightButton), .out(RightOut));
	
endmodule

module button (clock, reset, Button, out);
	input logic clock, reset, Button;
	output logic out;
	
	reg ns, prevButton;
	parameter On = 1'b1, Off = 1'b0;
	
	always_comb begin
		case (out)
			On:	ns = Off;
			Off:	begin
						if (Button == On & Button != prevButton)
							ns = On;
						else
							ns = Off;
					end
			default: ns = Off;
		endcase
	end
	
	always_ff @(posedge clock) begin
		if (reset) begin
			out <= Off;
			prevButton <= Off;
		end
		
		else begin
			out <= ns;
			prevButton <= Button;
		end
	end
endmodule


module button_testbench();
	logic clock, reset, Button, out;
	
	button dut (.clock, .reset, .Button, .out);
	
	//Set up the clock
	parameter CLOCK_PERIOD = 50;
	initial begin
		clock <= 0;
		forever #(CLOCK_PERIOD / 2) 
		clock <= ~clock;
	end
	
	
	initial begin
											@(posedge clock);
		reset <= 1;						@(posedge clock);
											@(posedge clock);
		reset <= 0; Button <= 0;	@(posedge clock);
											@(posedge clock);
											@(posedge clock);
						Button <= 1;	@(posedge clock);
											@(posedge clock);
											@(posedge clock);
						Button <= 0;	@(posedge clock);
											@(posedge clock);
											@(posedge clock);
						Button <= 1;	@(posedge clock);
											@(posedge clock);
											@(posedge clock);

		$stop;
																									
	end 
endmodule 
		

