module tb_sipo_shift;
    reg clk = 0, reset, serial_in;
    wire [7:0] parallel_out;

    sipo_shift uut (.clk(clk), .reset(reset), .serial_in(serial_in), .parallel_out(parallel_out));
    always #5 clk = ~clk;

    initial begin
        reset = 1; serial_in = 0;
        #10 reset = 0;

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;

        $finish;
    end
endmodule
