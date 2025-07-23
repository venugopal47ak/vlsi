module dis_tb;

    reg clk;
  reg [3:0] data_in;
    wire [6:0] seg;
    wire [3:0] digit_select;
   dis uut (
        .clk(clk),
        .data_in(data_in),
        .seg(seg),
        .digit_select(digit_select)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin 
        data_in = 16'h1234; 
        #1000;
        data_in = 16'h5678; 
        #1000;

        data_in = 16'h0901; 
        #1000;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | digit_select=%b | seg=%b", $time, digit_select, seg);
      $dumpfile("ss.vcd");
      $dumpvars();
    end

endmodule
