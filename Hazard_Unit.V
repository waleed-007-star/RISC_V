
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 


module Hazard_Unit(output reg[1:0] forwardAE,forwardBE,output reg flushE,flushD,stallD,stallF,input RegWriteW,RegWriteM,PCSrcE,reset,clk,
                        input [4:0]RdW,RdM,Rs1E,Rs1D,Rs2D,Rs2E,RdE, input[1:0]ResultSrcE);


//Condition of Forwarding

always@(*) begin
	if(((Rs1E==RdM)&RegWriteM)&(Rs1E!=0))
     		forwardAE=2'b10;
	else if(((Rs1E==RdW)&RegWriteW)&(Rs1E!=0))
     		forwardAE=2'b01;
	else 
    		forwardAE=2'b00;

	if(((Rs2E==RdM)&RegWriteM)&(Rs2E!=0))
     		forwardBE=2'b10;
	else if(((Rs2E==RdW)&RegWriteW)&(Rs2E!=0))
     		forwardBE=2'b01;
	else 
    		forwardBE=2'b00;
end

reg lwstall;
always@(*)begin
assign lwstall=ResultSrcE&((Rs1D==RdE)|(Rs2D==RdE));
stallF<=lwstall;
stallD<=lwstall;
flushD<=PCSrcE;
flushE<=lwstall|PCSrcE;

end

endmodule
