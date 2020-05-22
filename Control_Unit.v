`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:35 05/06/2020 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
    input [10:0] i_opCode,
    input        i_ZERO, // Bandera ZERO (ALU B == 0)
    output reg       o_reg2Sel = 0, // Segundo operando RM/RT(MUX RF)
    output reg       o_rfWr = 0, //Escritura RF (FLAG RF)
    output reg [1:0] o_SEU = 0, // Extension de signo (FLAG SEU)
    output reg       o_ALUSrcB = 0, // Segundo operando o_reg2/Inmed (MUX ALU)
    output reg [3:0] o_ALUOp = 0, // Operacion ALU (FLAG ALU)
    output reg       o_memWr = 0, //Habilitador escritura memo (FLAG DM)
    output reg       o_memRd = 0, //Habilitador lectura  memo (FLAG DM)
    output reg       o_PCSrc = 0, //Selector de #instruccion (MUX PC)
    output reg       o_wrDataSel = 0
    );

    always @(*) begin
            // TIPO B
            if(i_opCode[10:5] == 6'b100101) begin // BL
                o_reg2Sel <= 0;
                o_rfWr    <= 0;
                o_SEU     <= 2;
                o_ALUSrcB <= 1;
                o_ALUOp   <= 8;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 1;
                o_wrDataSel <= 0;
            end
            else if(i_opCode[10:5] == 6'b000101) begin // B
                o_reg2Sel <= 0;
                o_rfWr    <= 0;
                o_SEU     <= 2;
                o_ALUSrcB <= 1;
                o_ALUOp   <= 8;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 1;
                o_wrDataSel <= 0;
            end
            // TIPO CB
            //8'b01010100: begin // B.COND (REVISAR)
                // o_reg2Sel <= 1;
                // o_rfWr    <= 0;
                // o_SEU     <= 3;
                // o_ALUSrcB <= 0;
                // o_ALUOp   <= 8;
                // o_memRd   <= 0;
                // o_memWr   <= 0;
                // o_PCSrc   <= 1;
            //end
            else if(i_opCode[10:3] == 8'b10110100) begin // CBZ
                o_reg2Sel <= 1;
                o_rfWr    <= 0;
                o_SEU     <= 3;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 8;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= i_ZERO;
                o_wrDataSel <= 0;
            end
            else if(i_opCode[10:3] == 8'b01010100) begin // CBNZ
                o_reg2Sel <= 1;
                o_rfWr    <= 0;
                o_SEU     <= 3;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 8;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= !i_ZERO;
                o_wrDataSel <= 0;
            end
            
            // TIPO I 
            else if(i_opCode[10:1] == 10'b1001000100) begin // ADDI
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 1;
                o_ALUOp   <= 0;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode[10:1] == 10'b1101000100) begin // SUBBI
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 1;
                o_ALUOp   <= 1;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            // TIPO R
            else if(i_opCode == 11'b10001011000) begin //ADD
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 0;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b11001011000) begin // SUB
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 1;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b10001010000) begin // AND
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 2;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b10101010000) begin // ORR
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 3;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b11010011011) begin // LSL
                
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 6;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b11010011010) begin // LSR
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 7;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b10101011000) begin // ADDS
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 1;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b11101011000) begin // SUBS
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 2;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 1;
            end
            else if(i_opCode == 11'b11010110000) begin // BR
                o_reg2Sel <= 0;
                o_rfWr    <= 1;
                o_SEU     <= 0;
                o_ALUSrcB <= 0;
                o_ALUOp   <= 8;
                o_memRd   <= 0;
                o_memWr   <= 0;
                o_PCSrc   <= 1;
                o_wrDataSel <= 0;
            end
            // TIPO D
            else if(i_opCode == 11'b11111000000) begin // STUR
                o_reg2Sel <= 1;
                o_rfWr    <= 0;
                o_SEU     <= 1;
                o_ALUSrcB <= 1;
                o_ALUOp   <= 1;
                o_memRd   <= 1;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 0;
            end
            else if(i_opCode == 11'b11111000010) begin // LDUR
                o_reg2Sel <= 1;
                o_rfWr    <= 1;
                o_SEU     <= 1;
                o_ALUSrcB <= 1;
                o_ALUOp   <= 1;
                o_memRd   <= 1;
                o_memWr   <= 0;
                o_PCSrc   <= 0;
                o_wrDataSel <= 0;
            end
    end


endmodule
