module decoder_2_4_tb;
    reg [1:0] a;
    wire [3:0] y;

    decoder_2_4 dc(.a(a), .y(y));

    initial begin
        a = 2'b00; #10;
        a = 2'b01; #10;
        a = 2'b10; #10;
        a = 2'b11; #10;
        $finish;
    end
  initial begin
    $dumpfile("dc.vcd");
      $dumpvars();
  end
endmodule
