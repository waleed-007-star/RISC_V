
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module Data_Memory(output reg [31:0] Data_Out, input [31:0] Data_In, input [31:0] D_Addr, input wr, reset, clk);
		reg [31:0] Mem [255:0];			// Data Memory
integer x;
    always @(*)begin
        Data_Out<=Mem[D_Addr];
    end
    always @(posedge clk) begin
        
        if(reset) 
begin
            for(x=0;x<255;x=x+1)
            Mem[x]=32'h0;
            end 
        else if (wr) 
begin
        Mem[D_Addr]<=Data_In;
        end
    end
 endmodule









