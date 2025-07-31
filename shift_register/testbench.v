
module tb_shift_register;
  parameter WIDTH = 8;
  reg clk = 0, rst_n = 0, en, dir, si;
  wire [WIDTH-1:0] q;
  wire so;

  shift_register #(WIDTH) uut (
    .clk(clk), .rst_n(rst_n),
    .en(en), .dir(dir), .si(si),
    .q(q), .so(so)
  );

  always #5 clk = ~clk;

  initial begin
    #12 rst_n = 1;
    en = 1; dir = 0; // shift left
    foreach (q[i]) begin
      si = $random % 2;
      @(posedge clk);
      $display("Shifted in %b, q=%b", si, q);
    end
    dir = 1;
    repeat (8) begin
      @(posedge clk);
    end
    $finish;
  end
  initial begin
    $dumpfile("shift.vcd");
    $dumpvars();
  end
endmodule
