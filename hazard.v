module hazard(rsD, rtD, rsE, rtE, writeregE, writeregM, writeregW, regwriteE, regwriteM, regwriteW, memtoregE,
					memtoregM, branchD, forwardaD, forwardbD, forwardaE, forwardbE, stallF, stallD, flushE, jumpD);

	input [4:0] rsD, rtD, rsE, rtE, writeregE, writeregM, writeregW;
	input regwriteE, regwriteM, regwriteW, memtoregE, memtoregM, branchD;
	input jumpD;
	output forwardaD, forwardbD, stallF, stallD, flushE;
	output reg [1:0] forwardaE, forwardbE;

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
