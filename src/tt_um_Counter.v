/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_Counter_shivam (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
 // Internal registers
reg [31:0] out;
reg [31:0] out_binary;
reg [7:0] out_hexadecimal;
reg [9:0] out_decimal;
 assign rst_n = rst;
   

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;
    assign uo_out[0] = out;
    assign uo_out[1]= out_binary;
    assign uo_out[2]= out_hexadecimal;
    assign uo_out[3]= out_decimal;
    
// Counter logic
always @(posedge clk or posedge rst)
begin
    if (rst)
        out <= 0;
    else if (ui_in[1])
        out<= out;
    else if (ui_in[0])
        out<= out + 1;
    else
        out<= out - 1;
end

// Convert count to binary, hexadecimal, and decimal
always @(*)
begin
    out_binary = out;
    out_hexadecimal = out;
    out_decimal = out;
end

endmodule
