`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module Register_File(output reg [31:0]Port_A, Port_B,input [31:0] Din,input [4:0] Addr_A, Addr_B, Addr_Wr,input wr, clk,reset);
			 											
			reg [31:0] Reg_File [31:0]; 	//Register File

integer x;
    always @(*) begin
        Port_A <=Reg_File[Addr_A];
        Port_B <=Reg_File[Addr_B];
     end
     
     always @(negedge clk)
 begin
        if(reset)
	begin
            for(x=0;x<32;x=x+1)
                Reg_File[x]<=32'h0;  
        end 
        else if (wr)
 begin
        Reg_File[Addr_Wr]=Din;
        end
    end
endmodule








