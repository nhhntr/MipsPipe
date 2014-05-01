module datapath(clk, reset, memtoregE, memtoregM, memtoregW, pcsrcD, branchD, alusrcE, regdstE, regwriteE, regwriteM,
						regwriteW, jumpD, alucontrolE, equalD, pcF, instrF, aluoutM, writedataM, readdataM, opD, functD,
							flushE);

	input clk, reset, memtoregE, memtoregM, memtoregW, branchD, alusrcE, regdstE, regwriteE, regwriteM, regwriteW, jumpD;
	input [2:0] alucontrolE;
	input [1:0] pcsrcD;
	input [31:0] instrF, readdataM;
	output equalD, flushE;
	output [5:0] opD, functD;
	output [31:0] pcF, aluoutM, writedataM;
	
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
