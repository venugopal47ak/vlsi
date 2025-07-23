module sev_seg_tb;

  reg clk;
  reg rst_n;
  reg [3:0] digit;
  wire [7:0] seg;
  wire [3:0] out;

  sev_seg vvt(
    .clk(clk),
    .rst_n(rst_n),
    .digit(digit),
    .seg(seg),
    .out(out)
  );

  initial clk = 0;
  always #50 clk = ~clk; 

  initial begin
    rst_n = 0;
    digit = 4'h0;
    #20 rst_n = 1;

    #100 digit = 4'h2;
    #100 digit = 4'h6;
    #100 digit = 4'hB;
    #100 digit = 4'hE;

    #1000 $finish;
  end

  initial begin
    $monitor("%t | clk=%b rst_n=%b digit=%h seg=%b out=%b",
             $time, clk, rst_n, digit, seg, out);
    $dumpfile("sev_seg_tb.vcd");
    $dumpvars;
  end

endmodule
