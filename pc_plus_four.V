

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module pc_plus_four(output reg[31:0] pc_plus_four, input clk,reset,input [31:0] pc);

    always@(*)
	begin
        if(reset)
        	pc_plus_four<=0;
        else 
        pc_plus_four<=pc+4;
	end
       
endmodule
