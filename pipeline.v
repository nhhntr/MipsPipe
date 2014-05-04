module mips(

	input clk, 
	input reset,
	input [31:0] instrF, 
	input readdataM,
	output [31:0] pcF, 
	output [31:0] aluoutM, 
	output [31:0] writedataM,
	output memwriteM);
	
	wire [5:0] opD, functD;
	wire [1:0] pcsrcD;
	wire regdstE, alusrcE, memtoregE, memtoregM, memtoregW, regwriteE, regwriteM, regwriteW;
	wire [2:0] alucontrolE;
	wire flushE, equalD;

	controller c(clk, reset, opD, functD, flushE, equalD,memtoregE, memtoregM, memtoregW, memwriteM, pcsrcD,
						branchD,alusrcE, regdstE, regwriteE, regwriteM, regwriteW, jumpD, alucontrolE);

	datapath dp(clk, reset, memtoregE, memtoregM, memtoregW, pcsrcD, branchD, alusrcE, regdstE, regwriteE,
					regwriteM, regwriteW, jumpD, alucontrolE, equalD, pcF, instrF, aluoutM, writedataM, readdataM,
						opD, functD, flushE);

endmodule

	
module controller(

	input clk, 
	input reset, 
	input flushE, 
	input equalD,
	input [5:0] opD, 
	input [5:0] functD,
	output memtoregE,
	output memtoregM, 
	output memtoregW, 
	output memwriteM, 
	output branchD, 
	output alusrcE, 
	output regdstE, 
	output regwriteE, 
	output regwriteM, 
	output regwriteW, 
	output jumpD,
	output [2:0] alucontrolE,
	output [1:0]pcsrcD);
	
	wire [1:0] aluopD;
	wire memtoregD, memwriteD, alusrcD, regdstD, regwriteD;
	wire [2:0] alucontrolD;
	wire memwriteE;

	maindec md(opD, memtoregD, memwriteD, branchD, alusrcD, regdstD, regwriteD, jumpD, aluopD);
	aluctrl ad(functD, aluopD, alucontrolD);

	assign pcsrcD = {jumpD, (branchD & equalD)};

	// pipeline registers
	floprc #(8) regE(clk, reset, flushE, 
			{memtoregD, memwriteD, alusrcD, regdstD, regwriteD, alucontrolD},
			{memtoregE, memwriteE, alusrcE, regdstE, regwriteE, alucontrolE});
	flopr #(3) regM(clk, reset, {memtoregE, memwriteE, regwriteE}, {memtoregM, memwriteM, regwriteM});
	flopr #(2) regW(clk, reset, {memtoregM, regwriteM}, {memtoregW, regwriteW});

endmodule

module maindec(

	input [5:0] op,
	output memtoreg, 
	output memwrite, 
	output branch, 
	output alusrc, 
	output regdst, 
	output regwrite, 
	output jump,
	output [1:0] aluop);
	
	reg [8:0] controls;

	assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop} = controls;

	always @(*)
		case(op)
			6'b000000: controls <= 9'b110000010; //Rtyp
			6'b100011: controls <= 9'b101001000; //LW
			6'b101011: controls <= 9'b001010000; //SW
			6'b000100: controls <= 9'b000100001; //BEQ
			6'b001000: controls <= 9'b101000000; //ADDI
			6'b000010: controls <= 9'b000000100; //J
			default: controls <= 9'bxxxxxxxxx; //???
	endcase

endmodule

module aluctrl(

	input [5:0] funct,
	input [1:0] aluop,
	output reg [2:0] alucontrol);
	
	always @(*)
		case(aluop)
		2'b00: alucontrol <= 3'b010; // add
		2'b01: alucontrol <= 3'b110; // sub
		default: case(funct) // RTYPE
					6'b100000: alucontrol <= 3'b010; // ADD
					6'b100010: alucontrol <= 3'b110; // SUB
					6'b100100: alucontrol <= 3'b000; // AND
					6'b100101: alucontrol <= 3'b001; // OR
					6'b101010: alucontrol <= 3'b111; // SLT
					default: alucontrol <= 3'bxxx; // ???
				
				endcase
		endcase

endmodule

module datapath(

	input clk, 
	input reset, 
	input memtoregE, 
	input memtoregM, 
	input memtoregW, 
	input branchD, 
	input alusrcE, 
	input regdstE, 
	input regwriteE, 
	input regwriteM, 
	input regwriteW, 
	input jumpD,
	input [2:0] alucontrolE,
	input [1:0] pcsrcD,
	input [31:0] instrF, 
	input [31:0] readdataM,
	output equalD, 
	output flushE,
	output [5:0] opD, 
	output [5:0] functD,
	output [31:0] pcF, 
	output [31:0] aluoutM, 
	output [31:0] writedataM);
	
	wire forwardaD, forwardbD;
	wire [1:0] forwardaE, forwardbE;
	wire stallF;
	wire [4:0] rsD, rtD, rdD, rsE, rtE, rdE;
	wire [4:0] writeregE, writeregM, writeregW;
	wire flushD;
	wire [31:0] pcnextFD;
	wire [31:0] pcnextbrFD, pcplus4F, pcbranchD;
	wire [31:0] signimmD, signimmE, signimmshD;
	wire [31:0] srcaD, srca2D, srcaE, srca2E;
	wire [31:0] srcbD, srcb2D, srcbE, srcb2E, srcb3E;
	wire [31:0] pcplus4D, instrD;
	wire [31:0] aluoutE, aluoutW;
	wire [31:0] readdataW, resultW;
	wire pcsrcjbr;
	assign pcsrcjbr = ( pcsrcD[1] | pcsrcD[0] );
	

	// hazard detection
	hazard h(rsD, rtD, rsE, rtE, writeregE, writeregM, writeregW,regwriteE, regwriteM, regwriteW, memtoregE,
				memtoregM, branchD, forwardaD, forwardbD, forwardaE, forwardbE, stallF, stallD, flushE, jumpD);

	// next PC logic (operates in fetch and decode)
	mux3 #(32) pcbrmux(pcplus4F, pcbranchD, {pcplus4D[31:28],instrD[25:0],2'b00}, pcsrcD, pcnextFD);
	//mux2 #(32) pcmux(pcnextbrFD,{pcplus4D[31:28], instrD[25:0], 2'b00}, jumpD, pcnextFD);

	// register file (operates in decode and writeback)
	regfile rf(clk, regwriteW, rsD, rtD, writeregW, resultW, srcaD, srcbD);

	// Fetch stage logic
	flopenr #(32) pcreg(clk, reset, ~stallF, pcnextFD, pcF);
	adder pcadd1(pcF, 32'b100, pcplus4F);
   flopenrc #(32) r1D(clk, reset, ~stallD, flushD, pcplus4F, pcplus4D);
	flopenrc #(32) r2D(clk, reset, ~stallD, flushD, instrF, instrD);
	
	// Decode stage
	signext se(instrD[15:0], signimmD);
	sl2 immsh(signimmD, signimmshD);
	adder pcadd2(pcplus4D, signimmshD, pcbranchD);
	mux2 #(32) forwardadmux(srcaD, aluoutM, forwardaD, srca2D);
	mux2 #(32) forwardbdmux(srcbD, aluoutM, forwardbD, srcb2D);
	eqcmp #(32) comp(srca2D, srcb2D, equalD);

	assign opD = instrD[31:26];
	assign functD = instrD[5:0];
	assign rsD = instrD[25:21];
	assign rtD = instrD[20:16];
	assign rdD = instrD[15:11];
	assign flushD = pcsrcjbr | jumpD;

	// Execute stage
	floprc #(32) r1E(clk, reset, flushE, srca2D, srcaE);
	floprc #(32) r2E(clk, reset, flushE, srcb2D, srcbE);
	floprc #(32) r3E(clk, reset, flushE, signimmD, signimmE);
	
	floprc #(5) r4E(clk, reset, flushE, rsD, rsE);
	floprc #(5) r5E(clk, reset, flushE, rtD, rtE);
	floprc #(5) r6E(clk, reset, flushE, rdD, rdE);
	
	mux3 #(32) forwardaemux(srcaE, resultW, aluoutM, forwardaE, srca2E);
	mux3 #(32) forwardbemux(srcbE, resultW, aluoutM, forwardbE, srcb2E);
	mux2 #(32) srcbmux(srcb2E, signimmE, alusrcE, srcb3E);
	
	alu alu(srca2E, srcb3E, alucontrolE, aluoutE);
	mux2 #(5) wrmux(rtE, rdE, regdstE, writeregE);

	// Memory stage
	flopr #(32) r1M(clk, reset, srcb2E, writedataM);
	flopr #(32) r2M(clk, reset, aluoutE, aluoutM);
	flopr #(5) r3M(clk, reset, writeregE, writeregM);

	// Writeback stage
	flopr #(32) r1W(clk, reset, aluoutM, aluoutW);
	flopr #(32) r2W(clk, reset, readdataM, readdataW);
	flopr #(5) r3W(clk, reset, writeregM, writeregW);
	mux2 #(32) resmux(aluoutW, readdataW, memtoregW, resultW);

endmodule

module hazard(

	input [4:0] rsD, 
	input [4:0] rtD, 
	input [4:0] rsE, 
	input [4:0] rtE, 
	input [4:0] writeregE, 
	input [4:0] writeregM, 
	input [4:0] writeregW,
	input regwriteE, 
	input regwriteM, 
	input regwriteW, 
	input memtoregE, 
	input memtoregM, 
	input branchD,
	input jumpD;
	output forwardaD, 
	output forwardbD, 
	output stallF, 
	output stallD, 
	output flushE,
	output reg [1:0] forwardaE, 
	output forwardbE);

	wire lwstallD, branchstallD;

	// forwarding sources to D stage (branch equality)
	assign forwardaD = (rsD !=0 & (rsD == writeregM) & regwriteM);
	assign forwardbD = (rtD !=0 & (rtD == writeregM) & regwriteM);

	// forwarding sources to E stage (ALU)
	always @(*)
		begin
			forwardaE = 2'b00; 
			forwardbE = 2'b00;
			if (rsE != 0)
				if (rsE == writeregM & regwriteM)
					forwardaE = 2'b10;
				else if (rsE == writeregW & regwriteW)
					forwardaE = 2'b01;
						if (rtE != 0)
							if (rtE == writeregM & regwriteM)
								forwardbE = 2'b10;
							else if (rtE == writeregW & regwriteW)
										forwardbE = 2'b01;
		end

	// stalls
	assign #1 lwstallD = memtoregE & (rtE == rsD | rtE == rtD);
	assign #1 branchstallD = branchD & (regwriteE & (writeregE == rsD | writeregE == rtD) | memtoregM & (writeregM == rsD | writeregM == rtD));
	assign #1 stallD = lwstallD | branchstallD;
	assign #1 stallF = stallD;

	// stalling D stalls all previous stages
	assign #1 flushE = stallD | jumpD;

	// stalling D flushes next stage
	// Note: not necessary to stall D stage on store
	// if source comes from load;
	// instead, another bypass network could
	// be added from W to M

endmodule

module eqcmp # (parameter WIDTH = 8) (

	input [WIDTH-1:0] a, 
	input [WIDTH-1:0] b,
	output y);

	assign y = (a === b);
		
endmodule 



module alu(
	
	input [31:0] A,
	input [31:0] B,
	input [2:0] F,
	output reg [31:0] Y);
	
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

module adder (

	input [31:0] a, 
	input [31:0] b,
	output [31:0] y);

	assign y = a + b;

endmodule 

module signext (

	input [15:0] a,
	output [31:0] y);
	
	assign y = {{16{a[15]}}, a};

endmodule

module sl2 (

	input [31:0] a,
	output [31:0] y);

	// shift left by 2
	assign y = {a[29:0], 2'b00};

endmodule 

module mux2 # (parameter WIDTH = 8) (
input [WIDTH-1:0] d0, 
input [WIDTH-1:0] d1, 
input s, 
output [WIDTH-1:0] y);

	assign y = s ? d1 : d0;

endmodule 

module mux3 #(parameter WIDTH = 8) (
input [WIDTH-1:0] d0,
input [WIDTH-1:0] d1,
input [WIDTH-1:0] d2, 
input [1:0] s, 
output [WIDTH-1:0] y);

	assign  y = s[1] ? d2 : (s[0] ? d1 : d0);

endmodule 

module regfile (

input clk, 
input we3,
input [4:0] ra1,
input [4:0]	ra2,
input [4:0] wa3,
input [31:0] wd3,
output [31:0] rd1,
output [31:0] rd2);

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

module flopr # (parameter WIDTH = 8) (

input clk, 
input reset, 
input [WIDTH-1:0] d, 
output reg [WIDTH-1:0] q);

	always @ (posedge clk, posedge reset)
		if (reset) q <= 0;
		else q <= d;

endmodule 

module floprc #(parameter WIDTH = 8) (

input clk, 
input reset, 
input clear, 
input [WIDTH-1:0] d, 
output reg [WIDTH-1:0] q);

	always @(posedge clk, posedge reset)
		if (reset) q <= #1 0;
		else if (clear) q <= #1 0;
			  else q <= #1 d;

endmodule

module flopenr #(parameter WIDTH = 8) (

input clk, 
input reset, 
input en, 
input [WIDTH-1:0] d, 
output reg [WIDTH-1:0] q);

	always @(posedge clk, posedge reset)
		if (reset) q <= #1 0;
		else if (en) q <= #1 d;

endmodule

module flopenrc #(parameter WIDTH = 8) (

input clk, 
input reset, 
input en, 
input clear, 
input [WIDTH-1:0] d, 
output reg [WIDTH-1:0] q);

	always @(posedge clk, posedge reset)
		if (reset) q <= #1 0;
		else if (clear) q <= #1 0;
				else if (en) q <= #1 d;

endmodule

/*module imem(

	input [5:0] a;
	output [31:0] rd);

	reg [31:0] RAM[63:0];

	initial begin
				$readmemh("memfile.dat",RAM);
			  end
			  
	assign rd = RAM[a]; // word aligned

endmodule

module dmem(

	input clk, 
	input we,
	input [31:0] a, 
	input [31:0] wd,
	output [31:0] rd);
	

	reg [31:0] RAM[63:0];

	initial begin
				$readmemh("memfile.dat",RAM);
			  end
			  
	assign rd = RAM[a[31:2]]; // word aligned

	always @(posedge clk)
		if (we)
			RAM[a[31:2]] <= wd;

endmodule
*/
