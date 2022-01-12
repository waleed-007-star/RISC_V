

`timescale 1ns / 1ps


module Stage2(output reg PCSrcE, output reg MemWriteE,RegWriteE,ALUSrcE,output reg [3:0] ALUControlE, output reg [1:0]ResultSrcE,
 output reg [31:0] RD1E, RD2E,pcE,ImmExtE,pc_plus_fourE, output reg [4:0]RdE,Rs1E,Rs2E,input  MemWriteD,RegWriteD,ALUSrcD,PCSrcD, 
  input [3:0]ALUControlD, input [1:0]ResultSrcD, input [31:0] RD1D, RD2D,PCD,ImmExtD,pc_plus_fourD,input [4:0] RdD,Rs1D,Rs2D, input clk, reset,FlushE);
                
 always@(posedge clk)
 begin
                if(reset||FlushE)
begin
                PCSrcE=1'b0;
                MemWriteE=1'b0;
                RegWriteE=1'b0;
                ALUSrcE=1'b0;
                ALUControlE= 4'b0;
                ResultSrcE= 2'b0;
                RD1E=32'b0;
                RD2E= 32'b0;
                pcE=32'b0;
                ImmExtE=32'b0;
                pc_plus_fourE= 32'b0;
                RdE= 5'b0;
                Rs1E=5'b0;
                Rs2E=5'b0;
                end

                else
 begin
                PCSrcE<=PCSrcD;
                MemWriteE=MemWriteD;
                RegWriteE<=RegWriteD;
                ALUSrcE=ALUSrcD;
                ALUControlE= ALUControlD;
                ResultSrcE= ResultSrcD;
                RD1E=RD1D;
                RD2E= RD2D;
                pcE=PCD;
                ImmExtE=ImmExtD;
                pc_plus_fourE=pc_plus_fourD ;
                RdE= RdD;
                Rs1E=Rs1D;
                Rs2E=Rs2D;
                
                
                end
                end
endmodule
