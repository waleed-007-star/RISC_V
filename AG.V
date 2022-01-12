
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module Address_generator (output [31:0] pc_target,pc_plus_four,pc,pc_next,input [31:0] immext,input clk, reset, PCSrc);	
       
        initial pc=0;
	//Selection for next value of PC
	
	assign pc_next = PCSrc ? pc_target : pc_plus_four; 
	assign pc_target = pc+immext; 
    	 
        
     //always block for updating pc
      
    always @ (posedge clk)
            begin
                if(reset==1)
                    pc<=0;
                else
                    pc<=pc_next;
            end
  
endmodule

