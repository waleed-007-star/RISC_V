
`timescale 1ns / 1ps


module Stage3(output reg RegWriteM,MemWriteM,output reg [1:0]ResultSrcM, output reg [31:0]AluResultM,WriteDataM,pc_plus_fourM, output reg [4:0]RdM,
input [1:0]ResultSrcE,input [31:0]AluResultE,WriteDataE,pc_plus_fourE,input clk,reset,RegWriteE,MemWriteE,input [4:0] RdE);
      
always @(posedge clk) begin
      if(reset)
 begin
      RegWriteM<=1'b0;
      MemWriteM=1'b0;
      ResultSrcM=2'b0;
      AluResultM=32'b0;
      WriteDataM=32'b0;
      pc_plus_fourM=32'b0;
      RdM=5'b0;
      end
      else 
begin
      RegWriteM=RegWriteE;
      MemWriteM<=MemWriteE;
      ResultSrcM=ResultSrcE;
      AluResultM<=AluResultE;
      WriteDataM<=WriteDataE;
      pc_plus_fourM<=pc_plus_fourE;
      RdM<=RdE;
      end
      end
endmodule
