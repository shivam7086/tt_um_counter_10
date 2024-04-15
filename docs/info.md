<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

A 10-bit binary counter utilizes 10 D flip-flops, where each flip-flop's output connects to the next flip-flop's input. Clocking the first flip-flop initiates counting. With each clock pulse, the counter increments in binary from 0000000000 to 1111111111, spanning decimal values 0 to 1023.


## How to test

We test it on Vivado and open sources (OpenROAD and OpenLane). 

## External hardware

defaults  
