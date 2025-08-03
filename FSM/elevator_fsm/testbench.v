`timescale 1ns / 1ps

module tb_elevator_fsm;
    reg clk, reset, up, down;
    wire [1:0] floor;

    elevator_fsm uut (
        .clk(clk),
        .reset(reset),
        .up(up),
        .down(down),
        .floor(floor)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        up = 0;
        down = 0;

        #10 reset = 0;

        #10 up = 1;   
        #10 up = 0;

        #20 down = 1;  
        #10 down = 0;

        #20 $finish;
    end
endmodule
