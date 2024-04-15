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
 
    reg[31:0] out;
 assign rst = rst_n;
 assign uo_out = out;

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign rst_n =rst;
  assign ui_in[0] =up_dowm;
   assign ui_in[1]=hold;
    assign uo_out[0] =out;
    assign uo_out[1]= out_binary;
    assign uo_out[2]= out_hexadecimal;
    assign uo_out[3]= out_decimal;
    
// Internal registers
reg [31:0] count_reg;
reg [31:0] binary_reg;
reg [7:0] hexadecimal_reg;
reg [9:0] decimal_reg;

// Counter logic
always @(posedge clk or posedge rst)
begin
    if (rst)
        count_reg <= 0;
    else if (hold)
        count_reg <= count_reg;
    else if (up_down)
        count_reg <= count_reg + 1;
    else
        count_reg <= count_reg - 1;
end

// Convert count to binary, hexadecimal, and decimal
always @(*)
begin
    binary_reg = count_reg;
    hexadecimal_reg = count_reg;
    decimal_reg = count_reg;
end

// Output assignments
assign out = count_reg;
assign out_binary = binary_reg;
assign out_hexadecimal = hexadecimal_reg;
assign out_decimal = decimal_reg;

endmodule
