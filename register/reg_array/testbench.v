module tb_reg_array;
    reg clk = 0, we;
    reg [1:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    reg_array uut (.clk(clk), .we(we), .addr(addr), .data_in(data_in), .data_out(data_out));
    always #5 clk = ~clk;

    initial begin
        we = 1; addr = 2'b00; data_in = 8'h11; #10;
        addr = 2'b01; data_in = 8'h22; #10;
        addr = 2'b10; data_in = 8'h33; #10;
        we = 0; addr = 2'b00; #10;
        addr = 2'b01; #10;
        addr = 2'b10; #10;

        $finish;
    end
endmodule
