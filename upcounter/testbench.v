module up_counter_tb;
    reg clk, rst;
    wire [3:0] q;
    up_counter ak(clk, rst, q);
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin
        rst = 1; #10;
        rst = 0; #10;
    end
  initial begin
    $dumpfile("up.vcd");
    $dumpvars();
  end
  
endmodule

