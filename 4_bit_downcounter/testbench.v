
module tb_down_counter;
  reg clk = 0, reset = 1;
  wire [3:0] q;

  down_counter uut (.clk(clk), .reset(reset), .q(q));

  always #5 clk = ~clk;  

  initial begin
    #12 reset = 0;
    repeat (20) begin
      #10;
      
      if (q > 4'hF) $error("Counter out of range");
    end
    $finish;
  end
  initial begin
    $dumpfile("dc.vcd");
    $dumpvars();
  end
endmodule
