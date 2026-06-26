`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Pardis Gharghaninejad
//
// Design Name: SPI Slave Select Binary Encoder
// Module Name: encoder
// Project Name: PULSe - Zynq UltraScale+ Port
// Target Devices: KV260 (Zynq UltraScale+ MPSoC)
// Tool Versions: Vivado 2025.2
// Description: 8-to-3 priority encoder for AXI Quad SPI Slave Select signals.
//              Encodes 8 active-low SS lines into 3 binary outputs (A0, A1, A2).
//
// Dependencies: None
//////////////////////////////////////////////////////////////////////////////////


module encoder(
input wire [7:0] ss_n,
output reg [2:0] addr
);

wire[7:0] ss = ~ss_n;

always@(*)begin
case (1'b1) 
ss[0]: addr = 3'd0;
ss[1]:addr = 3'd1;
ss[2]:addr = 3'd2;
ss[3]:addr = 3'd3;
ss[4]:addr = 3'd4;
ss[5]:addr = 3'd5;
ss[6]:addr = 3'd6;
ss[7]:addr = 3'd7;
default: addr = 3'd0;
endcase 
end 
endmodule
