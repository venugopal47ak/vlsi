`timescale 1ns / 1ps

module tb_parity_checker;
    reg clk, reset, bit_in;
    wire even_parity;

    parity_checker uut (
        .clk(clk),
        .reset(reset),
        .bit_in(bit_in),
        .even_parity(even_parity)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        bit_in = 0;
        #10 reset = 0;

        #10 bit_in = 1;  
        #10 bit_in = 0;  
        #10 bit_in = 1;  
        #10 bit_in = 1;  

        #20 $finish;
    end
endmodule
