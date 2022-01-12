`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



 module ALU(input [31:0] A,B,  input [3:0] ALU_Sel,output [31:0] ALU_Out, output ZeroOut,output neg);

       reg [31:0] ALU_Result;
       wire [32:0] tmp;
       assign ALU_Out = ALU_Result; 
       assign tmp = A-B;
       assign neg = tmp[31]; // negative flag flag
       assign ZeroOut = (ALU_Result == 0); // Zero Flag
       always @(*)
       begin
           case(ALU_Sel)
           4'b0000: // Addition
              ALU_Result = A + B ;
           4'b0001: // Subtraction
              ALU_Result = A - B ;
           4'b0010: // Multiplication
              ALU_Result = A * B;
           4'b0011: // Division
              ALU_Result = A/B;
           4'b0100: // Logical shift left
              ALU_Result = A<<B;
            4'b0101: // Logical shift right
              ALU_Result = A>>B;
            4'b0110: // Rotate left
              ALU_Result = {A[30:0],A[31]};
            4'b0111: // Rotate right
              ALU_Result = {A[0],A[31:1]};
             4'b1000: //  Logical and
              ALU_Result = A & B;
             4'b1001: //  Logical or
              ALU_Result = A | B;
             4'b1010: //  Logical xor
              ALU_Result = A ^ B;
             4'b1011: //  Logical nor
              ALU_Result = ~(A | B);
             4'b1100: // Logical nand
              ALU_Result = ~(A & B);
             4'b1101: // Logical xnor
              ALU_Result = ~(A ^ B);
             4'b1110: // Greater comparison
              ALU_Result = (A>B)?32'd1:32'd0 ;
             4'b1111: // Equal comparison
              ALU_Result = (A==B)?32'd1:32'd0 ;
             default: ALU_Result = A + B ;
           endcase
       end
endmodule









