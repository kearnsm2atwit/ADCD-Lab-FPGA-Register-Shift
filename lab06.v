module lab06(input clk, B, input [3:0]A, output [7:0]H5, H4, H3, H2, H1);

	parameter MAX_COUNT = 150000000;		// 3 seconds is 150 million counts of clock @ 50MHz
	reg [27:0]count = 0;						// Initialize count. Needs to hold a max of 150 million
	reg [3:0]Q1, Q2, Q3, Q4 = 0;			// Registers to hold values for each flip flop
	
	sevenseg seg1(A, H1);					// Output all values to their respective HEX displays
	sevenseg seg2(Q1, H2);
	sevenseg seg3(Q2, H3);
	sevenseg seg4(Q3, H4);
	sevenseg seg5(Q4, H5);
	
	
	always @ (posedge clk) begin;				// Always block runs on positive edge of clock
		if (count <= MAX_COUNT) begin			// If the clock is before 3 seconds
			count <= count + 1;					// increment clock
		end	
		else begin
			count <= 0;								// Reset count
			
			
			if (B == 1'b0) begin					// If the button is pressed, put A into register
				Q1 <= A;
			end
			else begin								// If the button isn't pressed, put 0 back into first spot of register
				Q1 <= 0;
			end
			
			Q2 <= Q1;								// Nonblocking assignments to connect all D Flip Flops to each other
			Q3 <= Q2;
			Q4 <= Q3;
			
		end
		
	end
endmodule