`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:40 05/08/2020 
// Design Name: 
// Module Name:    Sumador_Base 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sumador_Base(
    input i_sum,
    output reg i_res
    );
    assign i_res = i_sum + 4;

endmodule
