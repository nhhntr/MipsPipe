`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:42:18 04/10/2014
// Design Name:   mips
// Module Name:   C:/Users/Adam/Desktop/2013-2014/Spring 2014/Computer Org/tester1/testbench.v
// Project Name:  tester1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module testbench();

	reg clk;
	reg reset;

	wire [31:0] aluout;  
	wire [31:0] writedata;
	wire [31:0] readdata;
	wire [31:0] dataadr;
	wire memwrite;

// instantiate device to be tested
top dut(clk, reset, writedata, dataadr, memwrite);

// initialize test
initial
	begin
		reset <= 1;
		# 22; 
		reset <= 0;
	end

// generate clock to sequence tests
always
	begin
		clk <= 1; 
		# 5; 
		clk <= 0;
		# 5;
	end

// check results
always@(negedge clk)
	begin
		if(memwrite) begin
			if(dataadr === 84 & writedata === 7 ) begin
			$display("Simulation succeeded");
			$stop;
			end
			else if (dataadr != 80) begin
				$display("Simulation failed");
				$stop;
					end
			end
	end

endmodule 

module top (input clk, reset, output [31:0] writedata, dataadr, output memwrite);

	wire [31:0] pc, instr, readdata;

	// instantiate processor and memories
	mips mips (clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
	imem imem (pc[7:2], instr);
	dmem dmem (clk, memwrite, dataadr, writedata, readdata);

endmodule 

module imem (input [5:0] a, output [31:0] rd);

	reg [31:0] RAM[63:0];

initial
	begin
		$readmemh ("memfile.dat",RAM);
	end
	assign rd = RAM[a]; // word aligned

endmodule 

module dmem (input clk, we, input [31:0] a, wd, rd);

	reg [31:0] RAM[63:0];


	initial  
	  begin 
			$readmemh("memfile.dat",RAM);
			end
			
	assign rd = RAM[a[31:2]]; // word aligned
	always @ (posedge clk)
		if (we) RAM[a[31:2]] <= wd;

endmodule 