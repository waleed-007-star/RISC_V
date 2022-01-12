





`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Controller(input funct7,Zero,neg, input [2:0] funct3,input [6:0] op, output reg PCSrc,
                  output MemWrite,RegWrite,ALUSrc,output [1:0] immSrc, output reg [3:0] ALUControl, output reg [1:0]ResultSrc);

reg [6:0] Inst_Type;



        always @(*)begin
        case(op)
        7'b0000011,7'b0010011,7'b1100111: Inst_Type= 3'b00;   //I type instruction
        7'b0100011: Inst_Type= 3'b001;   // S type instruction
        7'b1100011: Inst_Type= 3'b010;   // B type instruction
        7'b1101111: Inst_Type= 3'b011;   // J type instruction
        7'b0110011: Inst_Type= 3'b100;   // R type instruction
        7'b0110111,7'b0010111: Inst_Type= 3'b101;   // U type instruction
        endcase
        end
        
        assign immSrc= Inst_Type[1:0];
        assign MemWrite= Inst_Type==1'd1;
        assign RegWrite= Inst_Type==0|| Inst_Type==3|| Inst_Type==4 || Inst_Type==5;
        assign ALUSrc= ~(Inst_Type==4 || Inst_Type==5|| Inst_Type==2);
        
        always@(*)begin
        case(op)
        7'b0000011:ResultSrc=1;
        7'b1101111,7'b1100111: ResultSrc=2;
        default ResultSrc=0;
        
        endcase
        
        end
        
        always @(*)
        begin
            casex({funct3,op})
            10'bxxx_1101111, 10'bxxx_1100111: PCSrc=1;
            10'b000_1100011: PCSrc=Zero;  // Beq instruction
            10'b001_1100011: PCSrc= ~(Zero); // Bneq instruction
            10'b100_1100011: PCSrc= neg;    // less than 
            10'b101_1100011: PCSrc= ~neg||Zero; // BGE
            
            default: PCSrc=0;
            
        endcase
       end
       
      always@(*)begin
      casex({op,funct3,funct7})
      11'b0110011_000_0,11'b0010011_000_x,11'b0000011_010_x:ALUControl= 4'b0000;// lw,addi,add
      11'b0010011_100_x,11'b0110011_100_0: ALUControl= 4'b1010; // xor operation
      
      11'b0010011_110_x: ALUControl= 4'b1001; // or operation
      11'b0010011_001_0: ALUControl= 4'b0100; // slli
      11'b0110011_001_0: ALUControl= 4'b0100; // sll
      11'b0010011_101_0: ALUControl= 4'b0101; // shift right
      11'b0010011_111_x: ALUControl= 4'b1000; // AND 
      11'b0110011_000_1: ALUControl= 4'b0001; // Sub
      11'b1100011_000_x,11'b1100011_001_x,11'b1100011_100_x: ALUControl = 4'b0001;             // beq //bne blt
      11'b1100011_101_x : ALUControl = 4'b0001;              //bge
      
      endcase
      end 
      
     
        


endmodule





