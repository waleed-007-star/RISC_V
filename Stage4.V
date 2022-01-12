
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 

module Stage4(output reg RegWriteW, output reg [1:0] ResultSrcW,output reg [31:0] ALUResult,ReadDataW,pc_plus_fourW, output reg [4:0] RdW, 
input [31:0] AluResultM,pc_plus_fourM,RD,input [4:0]RdM, input clk,reset,input RegWriteM,input [1:0] ResultSrcM);
    
always @(posedge clk) begin
    if(reset) begin
    RegWriteW= 1'b0;
    ResultSrcW= 2'b0;
    ALUResult= 32'b0;
    ReadDataW= 32'b0;
    pc_plus_fourW= 32'b0;
    RdW= 5'b0;
    end
    else 
begin
    RegWriteW<=RegWriteM;
    ResultSrcW<=ResultSrcM;
    ALUResult<=AluResultM;
    ReadDataW<=RD;
    pc_plus_fourW<=pc_plus_fourM;
    RdW<=RdM;
    end
    end
                 
endmodule

