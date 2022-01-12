`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 

module Top_Module(input reset,clk);

wire [31:0] instrD,SrcBE,instruction,SrcAE,SrcBEsrc;
wire [31:0]PCD,pcF,pcE,AluResultM,WriteDataM,AluResultE,WriteDataE,ALUResult,ReadDataW,pc_plus_fourW,ResultW;
wire [31:0] pc_plus_fourF,pc_plus_fourD,pc_plus_fourE,RD1E,RD2E,ImmExtD,ImmExtE,RD1D,RD2D,pc_plus_fourM,RD,pc_targetE,pcF_;
wire PCSrcE,MemWriteE,RegWriteE,ALUSrcE,MemWriteD,RegWriteD,ALUSrcD,PCSrcD,MemWriteM,RegWriteM,RegWriteW;
wire [3:0] ALUControlE,ALUControlD;
wire [1:0] ResultSrcE,ResultSrcD,ResultSrcM,ResultSrcW,immSrcD,forwardAE,forwardBE;
wire [4:0]RdE,RdD,RdM,RdW,Rs1D,Rs2D,Rs2E,Rs1E;
wire [31:7] instruction31_7;
wire ZeroOut,neg;
wire [2:0] func3;
wire func7,flushE,flushD,stallD,stallF;
wire [6:0]op;




//Memories

Instruction_Memory IM( .pc(pcF),.instruction(instruction) );
Data_Memory DM(.Data_Out(RD), .Data_In(WriteDataM), .D_Addr(AluResultM), .wr(MemWriteM), .reset(reset), .clk(clk));
Instruction_Fetch IF(.instruction(instrD), .reset(reset), .clk(clk),.instruction19_15(Rs1D),.instruction24_20(Rs2D),.instruction11_7(RdD),.instruction31_7(instruction31_7), .func7(func7),.func3(func3),.op(op));
Register_File RF(.Port_A(RD1D), .Port_B(RD2D), .Din(ResultW), .Addr_A(Rs1D), .Addr_B(Rs2D), .Addr_Wr(RdW), .wr(RegWriteW), .clk(clk),.reset(reset));


//Sign Extend
sign_extend SE(.instr(instruction31_7), .immSrc(immSrcD),
              .immext(ImmExtD));
//Muxes              
mux2x1 M1(.o(SrcBE),.a(SrcBEsrc),.b(ImmExtE), .sel(ALUSrcE));
mux3x1 M2(.d0(ALUResult), .d1(ReadDataW), .d2(pc_plus_fourW),.s(ResultSrcW),.y(ResultW));
mux2x1 M3(.o(pcF_),.a(pc_plus_fourF),.b(pc_targetE),.sel(PCSrcE));
mux3x1 M4(.d0(RD1E), .d1(ResultW), .d2(AluResultM),.s(forwardAE),.y(SrcAE));
mux3x1 M5(.d0(RD2E), .d1(ResultW), .d2(AluResultM),.s(forwardBE),.y(SrcBEsrc));
//ALU

ALU A1(.A(SrcAE),.B(SrcBE),.ALU_Sel(ALUControlE),.ALU_Out(AluResultE), .ZeroOut(ZeroOut), .neg(neg));
       

//Address_Generation
                      
Program_Counter PC(.pc(pcF), .clk(clk),.reset(reset),.EN(stallF), .pc_next(pcF_) );
pc_plus_four PF(.pc_plus_four(pc_plus_fourF),.clk(clk),.reset(reset),.pc(pcF)); 
pc_target PT   (.pc_targetE(pc_targetE), .clk(clk),.reset(reset),.pcE(pcE),.ImmExtE(ImmExtE));
 

  Controller C(.funct7(func7),.Zero(ZeroOut),.neg(neg), .funct3(func3),.op(op), .PCSrc(PCSrcD),
                                       .ResultSrc(ResultSrcD),.MemWrite(MemWriteD),.RegWrite(RegWriteD),.ALUSrc(ALUSrcD),.immSrc(immSrcD), .ALUControl(ALUControlD));



//Stages of Pipelining
                                       
 Stage1 S1(.instrD(instrD), .PCD(PCD),.pc_plus_fourD(pc_plus_fourD), .pcF(pcF), .pc_plus_fourF(pc_plus_fourF),.instruction(instruction), .clk(clk),.reset(reset),.FlushD(flushD),.EN(stallD));
 
 Stage2 S2(.PCSrcE(PCSrcE), .MemWriteE(MemWriteE),.RegWriteE(RegWriteE),.ALUSrcE(ALUSrcE),
                  .ALUControlE(ALUControlE), .ResultSrcE(ResultSrcE),
                 .RD1E(RD1E), .RD2E(RD2E),.pcE(pcE),.ImmExtE(ImmExtE),.pc_plus_fourE(pc_plus_fourE),.RdE(RdE),.Rs1E(Rs1E),.Rs2E(Rs2E),
                  .MemWriteD(MemWriteD),.RegWriteD(RegWriteD),.ALUSrcD(ALUSrcD),.PCSrcD(PCSrcD), 
                 .ALUControlD(ALUControlD),.ResultSrcD(ResultSrcD), 
                 .RD1D(RD1D), .RD2D(RD2D),.PCD(PCD),.ImmExtD(ImmExtD),.pc_plus_fourD(pc_plus_fourD),
                 .RdD(RdD),.Rs1D(Rs1D),.Rs2D(Rs2D), .clk(clk), .reset(reset),.FlushE(flushE));
                 
Stage3 S3(.RegWriteM(RegWriteM),.MemWriteM(MemWriteM),.ResultSrcM(ResultSrcM), 
                                  .AluResultM(AluResultM),.WriteDataM(WriteDataM),.pc_plus_fourM(pc_plus_fourM), 
                                  .RdM(RdM),
                                  .clk(clk),.reset(reset),.RegWriteE(RegWriteE),.MemWriteE(MemWriteE),
                                  .ResultSrcE(ResultSrcE),.AluResultE(AluResultE),.WriteDataE(SrcBEsrc),.pc_plus_fourE(pc_plus_fourE), 
                                  .RdE(RdE) );
                                  
Stage4 S4 (.RegWriteW(RegWriteW),.ResultSrcW(ResultSrcW),.ALUResult(ALUResult),.ReadDataW(ReadDataW),.pc_plus_fourW(pc_plus_fourW), 
                                                   .RdW(RdW), .RegWriteM(RegWriteM),.ResultSrcM(ResultSrcM),
                                                   .AluResultM(AluResultM),.pc_plus_fourM(pc_plus_fourM),.RD(RD),.RdM(RdM), .clk(clk),.reset(reset) );



//Hazard Unit
Hazard_Unit HU(.forwardAE(forwardAE),.forwardBE(forwardBE),.flushE(flushE),.flushD(flushD),.stallD(stallD),.stallF(stallF),.RegWriteW(RegWriteW),.RegWriteM(RegWriteM),
.PCSrcE(PCSrcE),.reset(reset),.clk(clk),.RdW(RdW),.RdM(RdM),.Rs1E(Rs1E),.Rs1D(Rs1D),.Rs2D(Rs2D),.Rs2E(Rs2E),.RdE(RdE),.ResultSrcE(ResultSrcE));

endmodule










