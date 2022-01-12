



`timescale 1ns / 1ps


module CSR(input clk,reset,interrupt,input [31:0] PCE, output [31:0] PC_out);

wire [31:0] PCreturn_in;
reg  [31:0] PCreturn_out;

assign PCreturn_in= (interrupt) ? PCE+8 : PCreturn_out;

always@(posedge clk) begin
    if(reset)
    PCreturn_out<=0;
    else
    PCreturn_out<=PCreturn_in;
end

assign PC_out=(interrupt)? 32'd240:PCreturn_out;
endmodule

