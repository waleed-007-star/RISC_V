
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
	

module Program_Counter(output reg[31:0] pc, input clk,reset,EN, input [31:0] pc_next );

    always@(posedge clk)
begin
        if(reset)
        	pc<=32'h0;
        	else if(EN)
        	pc<=pc;

        else 
        	pc<=pc_next;
end
endmodule
