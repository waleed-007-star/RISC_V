
`timescale 1ns/1ps
module Instruction_Memory(output reg [31:0] instruction,input [31:0] pc);
    reg [31:0] instruction_memory_values [0:40];
initial begin
    $readmemh("Test_mem.mem", instruction_memory_values);
    end
always@(pc) begin
    case(pc)
    32'd0:instruction=instruction_memory_values[0];
    32'd4:instruction=instruction_memory_values[1];
    32'd8:instruction=instruction_memory_values[2];
    32'd12:instruction=instruction_memory_values[3];
    32'd16:instruction=instruction_memory_values[4];
    32'd20:instruction=instruction_memory_values[5];
    32'd24:instruction=instruction_memory_values[6];
    32'd28:instruction=instruction_memory_values[7];
    32'd32:instruction=instruction_memory_values[8];
    32'd36:instruction=instruction_memory_values[9];
    32'd40:instruction=instruction_memory_values[10];
    32'd44:instruction=instruction_memory_values[11];
    32'd48:instruction=instruction_memory_values[12];
    32'd52:instruction=instruction_memory_values[13];
    32'd56:instruction=instruction_memory_values[14];
    32'd60:instruction=instruction_memory_values[15];
    32'd64:instruction=instruction_memory_values[16];
    32'd68:instruction=instruction_memory_values[17];
    32'd72:instruction=instruction_memory_values[18];
    32'd76:instruction=instruction_memory_values[19];
    32'd80:instruction=instruction_memory_values[20];
    32'd84:instruction=instruction_memory_values[21];
    32'd88:instruction=instruction_memory_values[22];
    32'd92:instruction=instruction_memory_values[23];
    32'd96:instruction=instruction_memory_values[24];
    32'd100:instruction=instruction_memory_values[25];
    32'd104:instruction=instruction_memory_values[26];
    32'd108:instruction=instruction_memory_values[27];
    32'd112:instruction=instruction_memory_values[28];
    32'd116:instruction=instruction_memory_values[29];
    32'd120:instruction=instruction_memory_values[30];
    32'd124:instruction=instruction_memory_values[31];
    32'd128:instruction=instruction_memory_values[32];
    32'd132:instruction=instruction_memory_values[33];
    32'd136:instruction=instruction_memory_values[34];
    32'd140:instruction=instruction_memory_values[35];
    32'd144:instruction=instruction_memory_values[36];
    default:instruction=32'h00000000;

//CSR Instruction

    32'd256:instruction=32'h00c10093;
    32'd256:instruction=32'h00208193;
    32'd260:instruction=	
    endcase
    end
    endmodule
















