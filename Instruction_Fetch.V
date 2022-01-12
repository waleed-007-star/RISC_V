`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 

module Instruction_Fetch (input [31:0] instruction, input reset, input clk,
    output reg [4:0] instruction19_15,instruction24_20,instruction11_7,
    output reg [31:7] instruction31_7,
    output reg func7,
    output reg [2:0] func3,
    output reg [6:0] op);

always @(*) 
	begin
		instruction19_15<=instruction[19:15];
		instruction24_20<=instruction[24:20];
		instruction11_7<=instruction[11:7];
		func7<= instruction[30]; 
		func3<= instruction[14:12];
		op<= instruction[6:0];
		instruction31_7<=instruction[31:7];
	end
endmodule


