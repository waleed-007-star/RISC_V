

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module pc_target(output reg[31:0] pc_targetE, input clk,reset,input [31:0] pcE,ImmExtE);

    always@(*)
begin
        if(reset)
        	pc_targetE<=0;
        else 
        pc_targetE<=pcE+ImmExtE;
end       
endmodule
