`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// NAME: Waleed Ziafat 


module testbench_tb();

 reg reset,clk,interrupt;
 
 
Top_Module DUT ( reset,clk);
 
  initial clk=1;
 always #20 clk=~clk;
 initial
 begin
 reset=1;
 @(posedge clk)
 reset=0;
               
 end
endmodule