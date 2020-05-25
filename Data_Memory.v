`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:10 05/05/2020 
// Design Name: 
// Module Name:    Data_Memory 
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
module Data_Memory(
    input i_clk,
    input [63:0] i_add,
    input [63:0] i_dataWr,
    input [7:0]  i_sw,
    input i_memRd, // Señal de control
    input i_memWr, // Señal de control
    output [63:0] o_dataRd,
    output reg [7:0] o_leds
    );

    localparam MEM_SIZE = 100;
    localparam inicial = "data_mem.txt";

    reg  [7:0] r_insMem [MEM_SIZE-1:0];

    initial begin
		$readmemb  (inicial, r_insMem);
	end
    
    always @(posedge i_clk) begin
        if(i_add < MEM_SIZE && i_memWr  && i_add[17:16] == 1)begin
            o_leds <= i_add[7:0];
        end        
    end

    // Area de escritura 
    always @(*)
        if(i_add < MEM_SIZE && i_memWr  && i_add[17:16] == 0)begin
            r_insMem [i_add+7] <= i_dataWr[63:56];
            r_insMem [i_add+6] <= i_dataWr[55:48];
            r_insMem [i_add+5] <= i_dataWr[47:40];
            r_insMem [i_add+4] <= i_dataWr[39:32];
            r_insMem [i_add+3] <= i_dataWr[31:24];
            r_insMem [i_add+2] <= i_dataWr[23:16];
            r_insMem [i_add+1] <= i_dataWr[15:8];
            r_insMem [i_add]   <= i_dataWr[7:0];
        end
            
        
    
    // Area de lectura
    assign o_dataRd = i_add<MEM_SIZE?(i_memRd && i_add[17:16] == 0?{r_insMem[i_add+7],r_insMem[i_add+6],r_insMem[i_add+5],r_insMem[i_add+4],r_insMem[i_add+3],r_insMem[i_add+2],r_insMem[i_add+1],r_insMem[i_add]}:
    (i_memRd && i_add[17:16] == 1)?{{56{i_leds[7]}},i_leds}:
    (i_memRd && i_add[17:16] == 2)?{{56{i_sw[7]}},i_sw}):0;


endmodule
