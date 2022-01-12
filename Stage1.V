

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2021 02:45:32 PM
// Design Name: 
// Module Name: Register1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Stage1(output reg [31:0] instrD, PCD,pc_plus_fourD, input [31:0] pcF, pc_plus_fourF,instruction, input clk,reset,FlushD,EN);

always@(posedge clk)
 begin

if(reset|FlushD)begin
PCD = 32'b0;
pc_plus_fourD =32'b0;
instrD =32'b0;
end
else if(EN)begin
PCD <= PCD;
pc_plus_fourD <=pc_plus_fourD;
instrD =instrD ;
end
else  begin
PCD <= pcF;
pc_plus_fourD <=pc_plus_fourF;
instrD = instruction;
end

end
endmodule
