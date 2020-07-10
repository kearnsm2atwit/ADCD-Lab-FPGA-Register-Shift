module lect7_q2 (input clk, output reg led);
	parameter MAX_COUNT = 50000000;	// 1Hz. clk on FPGA board is 50 MHz
	
	reg [25:0]count = 0;
	
	always @ (posedge clk) begin
		if (count <= MAX_COUNT) begin
			count <= count + 1;
		end 
		else begin
			count <= 0;		// Reset clk count
			led <= ~led;
		end
	end
	
endmodule