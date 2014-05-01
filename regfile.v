module regfile (clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);

	input clk, we3;
	input [4:0] ra1, ra2, wa3;
	input [31:0] wd3;
	output [31:0] rd1, rd2;

	reg [31:0] rf[63:0];

	// three ported register file
	// read two ports combinationally
	// write third port on rising edge of clock
	// register 0 hardwired to 0
	//Note: for pipelined processor, write third port 
   // on falling edge of clk
	
	always @ (negedge clk)
		if (we3) rf[wa3] <= wd3;

	assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
	assign rd2 = (ra2 != 0) ? rf[ra2] : 0;

endmodule 
