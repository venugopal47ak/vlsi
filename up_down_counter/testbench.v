
module tb_up_down_counter;
  reg clk = 0;
  reg reset_n = 0;
  reg dir;
  wire [3:0] q;

  up_down_counter uut (.clk(clk), .reset_n(reset_n), .dir(dir), .q(q));

  always #5 clk = ~clk;

  initial begin
    #15 reset_n = 1;
    dir = 1;
    repeat (10) @(posedge clk);

    dir = 0;
    repeat (10) @(posedge clk);
    $finish;
  end
  initial begin
    $dumpfile("ud.vcd");
    $dumpvars();
  end
endmodule
