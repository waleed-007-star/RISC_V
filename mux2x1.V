`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 11:20:18 PM
// Design Name: 
// Module Name: mux2x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 




module mux2x1(output wire [31:0]o,input[31:0]a,b,input sel);
			
            assign o  = (sel)? b : a;
            	
endmodule


