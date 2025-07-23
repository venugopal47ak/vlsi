module clk_div_tb;
    reg clk_in, rst;
    wire clk_out;
clk_div g1 (
  .clk_in(clk_in),
        .rst(rst),
  .clk_out(clk_out)
    );
    initial begin
        clk_in = 0;
        forever #10 clk_in = ~clk_in;
    end
    initial begin
      $monitor("t=%0t,clk_in=%t,rst=%b,clk_out=%b", $time, clk_in, rst, clk_out);

        rst = 1;        
        #25;
        rst = 0;        
        #200;

        $finish;
    end
  initial begin
    $dumpfile("ss.vcd");
    $dumpvars;
  end

endmodule

