`timescale 1ns / 1ps

module tb_sequence_detector_1011;
    reg clk, reset, in_bit;
    wire detected;

    sequence_detector_1011 uut (
        .clk(clk),
        .reset(reset),
        .in_bit(in_bit),
        .detected(detected)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        in_bit = 0;
        #10 reset = 0;

        #10 in_bit = 1;
        #10 in_bit = 1;
        #10 in_bit = 0;
        #10 in_bit = 1;
        #10 in_bit = 0;
        #10 in_bit = 1;
        #10 in_bit = 1;
        #10 in_bit = 0;
        #10 in_bit = 1;
        #10 in_bit = 1;

        #20 $finish;
    end
endmodule
