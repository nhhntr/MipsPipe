module alu(A,B,F,Y);
	
	input [31:0] A;
	input [31:0] B;
	input [2:0] F;
	output reg [31:0] Y;
	
	wire Cin;
	wire [31:0] ss, outb;
	
	assign outb = F[2]  ? ~B : B; // sets outb to be in either subtractor or add form 
	assign ss = A + outb + F[2];  // can be either a subtractor or an adder 
	
	
	always @(*)
	case (F[1:0])
		2'b00: Y <= A & outb;
		2'b01: Y <= A | outb ;
		2'b10: Y <= ss;
		2'b11: Y <= ss[31];
		endcase
	
	
	/*wire [4:0] Result;
	assign Result = ALU(A,B,Cin,F);
	assign Y = Result[3:0];
	assign Cout = Result[4];
	
		
		
		
		function [4:0] ALU;
			input [31:0] A;
			input [31:0] B;
			input Cin;
			input [2:0] F;
				case (F)
					3'b000: ALU = A & B;
					3'b001: ALU = A | B;
					3'b010: ALU = A + B + Cin;
					3'b100: ALU = A & (~B);
					3'b101: ALU = A | (~B);
					3'b110: ALU = A + ((~B) + 1);
					3'b111: begin
						if(A<B) begin
							ALU = 5'b00001;
						end
						else begin
							ALU = 5'b00000;
						end
					end
				endcase
		endfunction
*/

endmodule
